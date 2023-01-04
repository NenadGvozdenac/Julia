using ControlSystems

function ulazi(time)

    tp1 = rem.(time, 40)

    y1 = ((5/20 .* tp1) .* (tp1 .<= 20)) .+ (((-5/20 .* (tp1 .- 40))) .* (tp1 .> 20))
    y2 = (0 .* (tp1 .<= 10)) .+ (5 .* (tp1 .> 10))

    return y1, y2

end

function sistem()

    G1 = tf(1, [1, 3.4])
	G2 = tf([2, 1.1], [1, 2, 2])
	G3 = tf(1, [1, 2, 0])
	G4 = tf(1, [1, 1.5])
	G5 = tf(7)
	G6 = tf(2.2)

    G12 = series(G1, G2)
    G12 = feedback(G12, 1)
    
    G34 = series(G3, G4)
    G346 = feedback(G34, G6)

    W11 = series(1/G4, G5)
    W11 = series(W11, G346)
    W11 = feedback(G12, W1)

    W12 = series(G346, 1/G4)
    W12 = series(W12, -G12)
    W12 = feedback(W12, -G5)

    W21 = series(G346, G5)
    W21 = series(G12, W21)
    W21 = feedback(W21, 1/G4)

    W22 = series(-G12, 1/G4)
    W22 = series(G5, W22)
    W22 = feedback(G346, -W22)

    return W11, W12, W21, W22

end

time = 0:0.1:120

W11, W12, W21, W22 = sistem()

u1, u2 = ulazi(time)

y11, ~, ~ = lsim(W11, u1', time)
y12, ~, ~ = lsim(W12, u1', time)
y21, ~, ~ = lsim(W21, u2', time)
y22, ~, ~ = lsim(W22, u2', time)

y1 = y11 .+ y21
y2 = y12 .+ y22

plot1 = plot(time, [y1', y2'], lw=2, label=["y1(t)" "y2(t)"])
plot2 = plot(time, [u1, u2], lw=2, label=["u1(t)" "u2(t)"])
plot(plot1, plot2, layout=(2,1), xticks=0:10:120, size=(700, 600), ylabel="y(t)", xlabel="t")
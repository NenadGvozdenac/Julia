using ControlSystems

function sistem()

    G1 = tf(1, [1, 1])
    G2 = tf(1, [1, 2])
    G3 = tf(1, [1, 3])
    G4 = tf(1, [1, 4])

    W11 = series(G2, -G3)
    W11 = series(W11, G4)
    W11 = feedback(G1, W11)

    W12 = series(-G1, G2)
    W12 = series(W12, G4)
    W12 = feedback(W12, G3)

    W21 = series(-G3, G4)
    W21 = series(G1, W21)
    W21 = feedback(W21, G2)

    W22 = series(-G1, G2)
    W22 = series(G3, W22)
    W22 = feedback(G4, W22)

    return W11, W12, W21, W22
end

time = 0:0.1:25

u1 = cos.(time)
u2 = sin.(time)

W11, W12, W21, W22 = sistem()

y11, ~, ~ = lsim(W11, u1', time)
y12, ~, ~ = lsim(W12, u1', time)
y21, ~, ~ = lsim(W21, u2', time)
y22, ~, ~ = lsim(W22, u2', time)

y1 = y11 .+ y21
y2 = y12 .+ y22

plot1 = plot(time, [y1', y2'], label=["y1(t)" "y2(t)"], lw=2)
plot2 = plot(time, [u1, u2], label=["cos(t)" "sin(t)"], lw=2)

plot(plot1, plot2, layout=(2,1), xticks=0:1:150, ylabel="y(t)", xlabel="t", size=(600, 500))
using ControlSystems
using Plots

# Moje resenje

function sistem() 

    G1 = tf(1, [1, 1])
    G2 = tf(1, [1, 2])
    H1 = tf(1, [1, 3])
    H2 = tf(1, [1, 4])

    G12 = series(G1, G2)
    H12 = series(H1, H2)
    W1 = feedback(G12, -H12)

    G1H12 = series(G1, H12)
    W2 = feedback(G2, -G1H12)

    H1G12 = series(H1, G12)
    W3 = feedback(H1G12, -H2)

    return minreal(W1), minreal(W2), minreal(W3)
end

# Kuslakovicevo resenje

# function sistem()
# 	G1 = tf(1, [1, 1])
# 	G2 = tf(1, [1, 2])
# 	H1 = tf(1, [1, 3])
# 	H2 = tf(1, [1, 4])

# 	G12 = series(G1, G2)
# 	H12 = series(H1, H2)
	
# 	W1 = minreal(feedback(G12, -H12))
# 	W2 = minreal(series(W1, 1/G1))
# 	W3 = minreal(series(W1, H1))

# 	return W1, W2, W3
# end

function h(t)
    return t > 0 ? 1.0 : 0.0
end

time = 0:0.1:30

u1 = sin.(time)
u2 = cos.(time)
u3 = h.(time)

W1, W2, W3 = sistem()

y1, ~, ~ = lsim(W1, u1', time)
y2, ~, ~ = lsim(W2, u2', time)
y3, ~, ~ = lsim(W3, u3', time)

y = y1 .+ y2 .+ y3

plot(time, [u1, u2, u3, y'], lw=2, label=["sin(t)" "cos(t)" "h(t)" "y(t)"], xticks=0:1:30)
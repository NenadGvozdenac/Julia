using ControlSystems
using Plots

function sistem() 

    G1 = tf(10, [1, 10])
    G2 = tf([5, 2], [1, 2, 1, 0])
    G3 = tf(5)
    G4 = tf([1, 0.1], [1, 0.05])

    G34 = series(G3, G4)
    G234 = feedback(G2, G34)
    G1234 = parallel(-G1, G234)
    W1 = G1234

    G24 = series(-G2, G4)
    G234 = feedback(G24, -G3)

    W2 = G234

    return W1, W2
end

time = 0:0.01:10

u1 = sin.(time)
u2 = cos.(time)

W1, W2 = sistem()

y1, ~, ~ = lsim(W1, u1', time)
y2, ~, ~ = lsim(W2, u2', time)

y = y1 .+ y2

plot(time, [y', u1, u2], label=["Izlaz Y" "Ulaz sin" "Ulaz cos"], lw=2)
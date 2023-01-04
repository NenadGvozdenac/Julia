using ControlSystems

s = tf("s")

G1 = 1/(s+1)
G2 = 1/(s+2)
G3 = 1/(s+3)
G4 = 1/(s+4)
G5 = 1/(s+5)
G6 = 1/(s+6)

G34 = series(G3, G4)
G346 = feedback(G34, G6)
G345 = series(G5, 1/G34)
G2346 = series(G2, G346)
G2345 = feedback(G2346, -G345)
G123456 = series(G1, G2346)
Ge = feedback(G123456, 1)

G = minreal(Ge)
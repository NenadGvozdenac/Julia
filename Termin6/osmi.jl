using ControlSystems

s = tf("s")

G1 = 1/(s+1)
G2 = 1/(s+2)
G3 = 1/(s+3)
G4 = 1/(s+4)
G5 = 1/(s+5)
G6 = 1/(s+6)

G34 = series(G3, G4)
G25 = feedback(-G5, G2)
Gx1 = series(G5, 1/G4)
G125 = series(G1, G25)
Ge1 = parallel(G1, G125)
Ge2 = feedback(Gx1, G34)
Ge = series(Ge1, Ge2)
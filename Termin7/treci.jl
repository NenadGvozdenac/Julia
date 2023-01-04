# using ControlSystems

# G1 = tf(2, [0.2, 1])
# G2 = tf([1.2, 1], [1, 2, 0.1])
# G3 = tf(4, [1, 3, 2])
# G4 = tf(1, [0.1, 1])



# G12 = series(G1, G2)
# G3K2 = feedback(G3, -K2)
# G3K2K1G4 = series(K1, -1)
# G3K2K1G42 = series(G3K2, G4)
# G3K2K1G4e = series(G3K2K1G4, G3K2K1G42)
# G12G3K2K1G4e = series(G12, G3K2K1G4e)
# Ge = parallel(-G12G3K2K1G4e, G12)
using ControlSystems

G = tf([10, 5], [2, 3, 4, 0, 1])    # Transfer Function - Funkcija prenosa (10s + 5) / (2s^4 + 3s^3 + 4s^2 + 1)
G2 = zpk(G) # Funkcija sa polovima
funkcija_stanja = ss(G) # Funkcija stanja iz funkcije prenosa u matematicki model
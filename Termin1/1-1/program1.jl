# Za proizvoljnu kvadratnu matricu A, izdvojiti sve parne kolone.

A = round.(rand(5, 5) * 50)

parneKolone = A[:, 2:2:end]
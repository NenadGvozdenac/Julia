# Za proizvoljnu kvadratnu matricu A, izdvojiti sve parne kolone.

matrica = round.(rand(5, 5) * 50)
parneKolone = matrica[:, 2:2:end]
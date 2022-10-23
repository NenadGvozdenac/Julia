# Za proizvoljnu kvadratnu matricu A, izdvojiti elemente koji se nalaze na preseku parnih vrsta i parnih kolona.

A = round.(rand(7, 7) * 100)

elementiNaPresekuParnihVrstaIKolona = A[2:2:end, 2:2:end]
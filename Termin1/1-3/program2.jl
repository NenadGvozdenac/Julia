# Za proizvoljnu kvadratnu matricu A, izdvojiti elemente koji se nalaze na preseku parnih vrsta i parnih kolona.

matrica = round.(rand(5, 5) * 50)

presek = matrica[2:2:end, 2:2:end]
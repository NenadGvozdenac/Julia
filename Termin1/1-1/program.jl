# Za proizvoljnu kvadratnu matricu A, izdvojiti sve parne kolone.

function izdvojiSveParneKolone(A)
    return A[:, 2:2:end]
end

matrica = [1 2 3 4 5; 2 3 4 5 6; 7 6 5 4 2; 3 4 2 5 6; 1 2 4 2 5]

izdvojiSveParneKolone(matrica)
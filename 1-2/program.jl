# Za proizvoljnu kvadratnu matricu A, izdvojiti sve elemente koji su deljivi sa 9.

function elementiDeljiviSa9(A)
    return A[A .% 9 .== 0]
end

A = [1 2 3 4 18; 2 3 4 2 5; 6 5 4 2 9; 2 3 4 1 4; 2 3 4 5 2]

elementiDeljiviSa9(A)
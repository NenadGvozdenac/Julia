# Za proizvoljnu kvadratnu matricu A, izdvojiti sve elemente koji su deljivi sa 9.

A = round.(rand(5, 5) * 100)

elementiDeljiviSa9 = A[rem.(A, 9) .== 0]
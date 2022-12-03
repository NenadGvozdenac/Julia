# Za proizvoljnu kvadratnu matricu A, izdvojiti sve elemente koji su deljivi sa 9.

matrica = round.(rand(5, 5) * 50)

elDeljiviSa9 = matrica[matrica .% 9 .== 0]
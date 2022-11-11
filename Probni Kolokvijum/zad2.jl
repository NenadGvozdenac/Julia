using Statistics, LinearAlgebra

function funkcija(A, k, r)

    v = diag(reverse(A, dims=2))[rem.(diag(reverse(A, dims=2)), 2) .== 0]
    c = reverse(A, dims=2)[(triu(reverse(A, dims=2), 1) .> k) .& (rem.(triu(reverse(A, dims=2), 1), r) .== 0)]

    return v, c
end

A = round.(rand(5, 5) * 100)

v, c = funkcija(A, 3, 5)   # poziv funkcije
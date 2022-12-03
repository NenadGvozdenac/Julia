using Statistics, LinearAlgebra

function zadatak1(A, s, e)

    parneVrste = A[2:2:end, :]
    v = parneVrste[(parneVrste .> e) .& (parneVrste .<= s)]

    m_log = ones(size(A))
    m_log = tril(A, -1)
    m_log = convert.(Bool, m_log)

    pozitivniElementi = A[m_log]
    m = length(pozitivniElementi)

    return v, m

end

A = round.(rand(5, 5) * 50)
e = 3
s = 23

v, m = zadatak1(A, s, e)
function funkcija(A)
    maska = ones(size(A))
    ispodGlavneDijag2 = tril(maska, -1)
    ispodGlavneDijag2 = convert.(Bool, ispodGlavneDijag2)
    elementi = A[ispodGlavneDijag2]
    elementiDeljivi2 = elementi[elementi .% 2 .== 0]

    return elementiDeljivi2
end

A = round.(rand(5, 5) * 50)

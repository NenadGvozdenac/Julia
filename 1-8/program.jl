# Zadatak 8. Napisati funkciju koja određuje poziciju nenultih elemenata proizvoljne matrice. Zadatak rešiti bez korišćenja funkcije findall.

A = [1 2 3 2 4; 0 2 0 4 3; 2 3 4 0 2; 1 2 3 4 0; 2 3 4 5 0];

boolMatrix = A .== 0

function vratiNeNulaElemente(A)
    vektorZaVracanje = []

    for i in 1:size(A, 1)
        for j in 1:size(A, 2)
            if A[i, j] == 0
                continue
            else
                push!(vektorZaVracanje, (i, j))
            end
        end
    end
    
    vektorZaVracanje
end

vratiNeNulaElemente(A)
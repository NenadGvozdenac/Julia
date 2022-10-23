# Zadatak 9. Napisati funkciju, po uzoru na funkciju prod, koja određuje proizvod
# svih elemenata vektora

function proizvodElemenataVektora(A)

    proizvod = 1

    for element in A
        proizvod *= element
    end
    
    proizvod
end

proizvodElemenataVektora([1, 2, 3, 4, 2, 5, 6])
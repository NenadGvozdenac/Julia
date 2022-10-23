# Zadatak 7. Za podatke iz tabele T (Primer 4 - Složeni primeri) napisati kod koji
# određuje:
# koliko je ženskih, a koliko muških osoba (poželjno je prikazati i njihova imena),
# prosečnu visinu i težinu ženskih osoba,
# prosečnu visinu i težinu muških osoba,
# najstariju i najmlađu osobu,
# standardnu devijaciju za visinu.

T = [   
        "Ime" "Pol" "Starost" "Tezina" "Visina";
        "Ana" "z" 20 46 160;
        "Bojan" "m" 24 52 165;
        "Vlada" "m" 24 95 195;
        "Gordana" "z" 30 57 160;
        "Dejan" "m" 36 84 185;
        "Zoran" "m" 22 80 180
    ]

podaci = T[2:end, 1:2]

vektorMuskih = findall(podaci[:, 2] .== "m")
vektorZenskih = findall(podaci[:, 2] .== "z")

if length(vektorMuskih) == 1
    ime = T[vektorMuskih .+ 1, 1][1]
    print("Jedna muska osoba je ", ime)
else 
    imena = T[vektorMuskih .+ 1, 1]
    print("Osobe muskog pola su: \n")

    for ime in imena
        println(ime)
    end
end

println()

if length(vektorZenskih) == 1
    ime = T[vektorZenskih .+ 1, 1][1]
    print("Jedna zenska osoba je ", ime)
else 
    imena = T[vektorZenskih .+ 1, 1]
    print("Osobe zenskog pola su: \n")

    for ime in imena
        println(ime)
    end
end

println("\nOsoba muskog pola je ", length(vektorMuskih))
println("Osoba zenskog pola je ", length(vektorZenskih), "\n")

zenskeOsobe = T[vektorZenskih .+ 1, :]
muskeOsobe = T[vektorMuskih .+ 1, :]

prosecnaTezinaZenskihOsoba = sum(zenskeOsobe[:, 4]) / length(zenskeOsobe) * 5
prosecnaVisinaZenskihOsoba = sum(zenskeOsobe[:, 5]) / length(zenskeOsobe) * 5

println("\nProsecna tezina zenskih osoba: ", prosecnaTezinaZenskihOsoba)
println("\nProsecna visina zenskih osoba: ", prosecnaVisinaZenskihOsoba)

prosecnaTezinaMuskihOsoba = sum(muskeOsobe[:, 4]) / length(muskeOsobe) * 5
prosecnaVisinaMuskihOsoba = sum(muskeOsobe[:, 5]) / length(muskeOsobe) * 5

println("\nProsecna tezina muskih osoba: ", prosecnaTezinaMuskihOsoba)
println("\nProsecna visina muskih osoba: ", prosecnaVisinaMuskihOsoba)

podaci = T[2:end, :]

najstarijaOsoba = maximum(podaci[:, 3])
najmladjaOsoba = minimum(podaci[:, 3])

imeNajstarije = T[findfirst(podaci[:, 3] .== najstarijaOsoba) + 1]
imeNajmladje = T[findfirst(podaci[:, 3] .== najmladjaOsoba) + 1]

println("\nNajstarija osoba je ", imeNajstarije, ", {", najstarijaOsoba, "}.")
println("\nNajmladja osoba je ", imeNajmladje, ", {", najmladjaOsoba, "}.")
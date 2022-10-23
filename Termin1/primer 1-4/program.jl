# Primer 4. Data je tabela T koja sadrži podatke o osobama. Napisati kod koji:
# određuje osobu sa najvećom težinom (ili osobe ako ih je više). Ispisati poruku na
# terminal koja prikazuje imena osobe(a) i maksimalnu težinu.
# određuje prosečnu visinu i težinu.



function funkcija(matricaImena)
    podaci = T[2:end, 3:end]
    matricaNajvecaTezina = maximum(podaci[:, 2])

    pozicijaNajtezeOsobe = findall(podaci[:, 2] .== matricaNajvecaTezina)
    ime = T[pozicijaNajtezeOsobe .+ 1, 1][1]
    
    println("Osoba sa najvecom tezinom je ", ime, " (", matricaNajvecaTezina, "kg)")
end

T = [   
        "Ime" "Pol" "Starost" "Tezina" "Visina";
        "Ana" "z" 20 46 160;
        "Bojan" "m" 24 52 165;
        "Vlada" "m" 24 95 195;
        "Gordana" "z" 30 57 160;
        "Dejan" "m" 36 84 185;
        "Zoran" "m" 22 80 180
    ]

funkcija(T)
from prime_intre_ele import prime_intre_ele

def numarPerechi(v):
    numar = 0
    for i in range(0,len(v)-1):
        if (prime_intre_ele(v[i],v[i+1])):
            numar += 1
    return numar
        

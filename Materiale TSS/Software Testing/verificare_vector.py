from numarPerechi import numarPerechi

def verificare_vector(n, v, count):
    numar_perechi = 0
    if n < 1 or n > 50 or count<0 or count>n-1 or len(v)!=n:
        print("Conditii nesatisfacute!")
        return False
    for i in range(0,len(v)):
        if v[i]<0:
            print("Conditii nesatisfacute!")
            return False
    return count == numarPerechi(v)


            

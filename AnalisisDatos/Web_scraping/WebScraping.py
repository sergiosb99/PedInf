from bs4 import BeautifulSoup
import csv

def funcion (codigo_html):  
    page = open(codigo_html,"r")
    soup = BeautifulSoup(page, 'html.parser')

    tabla_general = soup.find(id = 'D3')
    tablas = tabla_general.find_all('tr')

    nombre_enfermedad = tablas[1].find_all('td')
    tabla_sintomas = tablas[3].find(id = 'tdheight')
    sintomas = tabla_sintomas.find_all('a')

    print('ENFERMEDAD: ' + str(nombre_enfermedad[0].text))
    print('SÍNTOMAS:')
    for x in range(0,len(sintomas)):
        if x % 2 != 0:
            print(sintomas[x].text)
            registro = [[nombre_enfermedad[0].text,sintomas[x].text]]

            bbdd = open(r"C:\Users\sevil\Desktop\dataset.csv", 'a')
            with bbdd:
                writer = csv.writer(bbdd)
                writer.writerows(registro)
    print('\n')

# Main
cabecera = [["Disease","Symptom"]]
bbdd = open(r"dataset.csv", 'w')
with bbdd:
    writer = csv.writer(bbdd)
    writer.writerows(cabecera)

codigos_html = [r"CodigosHTML\Kawasaki.txt",
                    r"CodigosHTML\Bronquiolitis.txt",
                    r"CodigosHTML\Escarlatina.txt",
                    r"CodigosHTML\Gripe.txt",
                    r"CodigosHTML\Lombrices.txt",
                    r"CodigosHTML\Sarampion.txt",
                    r"CodigosHTML\TosFerina.txt"]

for i in range(0,7):
    funcion(codigos_html[i])

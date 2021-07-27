;; ----- REGLAS PARA DIAGNÓSTICO DE ENFERMEDADES -----

(defrule regla_enf_1
	(paciente(edad ?edad))
	(sintoma(nombre_sintoma "picores")(gravedad "fuerte"))
	(sintoma(nombre_sintoma "piel_granosa")(gravedad "leve"))
	(sintoma(nombre_sintoma "piel_roja")(gravedad "leve"))
	(test(< ?edad 14))
=>
	(assert(varicela))
	(open "diagnostico.txt" mydata "a")
	(printout mydata "Enfermedad diagnosticada: Varicela." crlf
			"La varicela es una infeccion causada por el virus zoster." crlf
			"Causa una erupcion en la piel con picazon y ampollas." crlf crlf)
	(close)
	(printout t "Enfermedad diagnosticada: Varicela." crlf)
)

(defrule regla_enf_2
	(paciente(edad ?edad))
	(sintoma(nombre_sintoma "picores")(gravedad "fuerte"))
	(sintoma(nombre_sintoma "piel_granosa")(gravedad "leve"))
	(sintoma(nombre_sintoma "ganglios_inflamados")(gravedad "leve"))
	(test(< ?edad 14))
=>
	(assert(varicela))
	(open "diagnostico.txt" mydata "a")
	(printout mydata "Enfermedad diagnosticada: Varicela." crlf
			"La varicela es una infeccion causada por el virus zoster." crlf
			"Causa una erupcion en la piel con picazon y ampollas." crlf crlf)
	(close)
	(printout t "Enfermedad diagnosticada: Varicela." crlf)
)

(defrule regla_enf_3
	(paciente(edad ?edad))
	(sintoma(nombre_sintoma "fiebre"))
	(sintoma(nombre_sintoma "piel_granosa")(gravedad "fuerte"))
	(test(< ?edad 5))
=>
	(assert(sarampion))
	(open "diagnostico.txt" mydata "a")
	(printout mydata "Enfermedad diagnosticada: Sarampion." crlf
			"El sarampion es una enfermedad infecciosa causada por un virus del genero Morbillivirus." crlf
			"Se disemina facilmente de persona a persona y causa una erupcion en la piel de color roja." crlf crlf)
	(close)
	(printout t "Enfermedad diagnosticada: Sarampion." crlf)	
)

(defrule regla_enf_4
	(paciente(edad ?edad))
	(sintoma(nombre_sintoma "tos")(gravedad "fuerte"))
	(sintoma(nombre_sintoma "diarrea")(gravedad "leve"))
	(sintoma(nombre_sintoma "piel_granosa")(gravedad "fuerte"))
	(test(< ?edad 5))
=>
	(assert(sarampion))
	(open "diagnostico.txt" mydata "a")
	(printout mydata "Enfermedad diagnosticada: Sarampion." crlf
			"El sarampion es una enfermedad infecciosa causada por un virus del genero Morbillivirus." crlf
			"Se disemina facilmente de persona a persona y causa una erupcion en la piel de color roja." crlf crlf)
	(close)
	(printout t "Enfermedad diagnosticada: Sarampion." crlf)	
)

(defrule regla_enf_5
	(paciente(edad ?edad))
	(sintoma(nombre_sintoma "fiebre"))
	(sintoma(nombre_sintoma "molestia_respirar")(gravedad "leve"))
	(sintoma(nombre_sintoma "jadeos")(gravedad "leve"))
	(test(< ?edad 14))
=>
	(assert(bronquiolitis))
	(open "diagnostico.txt" mydata "a")
	(printout mydata "Enfermedad diagnosticada: Bronquiolitis." crlf
			"La bronquiolitis es una infeccion pulmonar comun en niños pequeños y bebes." crlf
			"Causa inflamacion y congestion en los bronquiolos del pulmon." crlf crlf)
	(close)
	(printout t "Enfermedad diagnosticada: Bronquiolitis." crlf)
)

(defrule regla_enf_6
	(paciente(edad ?edad))
	(sintoma(nombre_sintoma "fiebre"))
	(sintoma(nombre_sintoma "molestia_respirar")(gravedad "leve"))
	(sintoma(nombre_sintoma "insuficiencia_respiratoria")(gravedad "fuerte"))
	(test(< ?edad 14))
=>
	(assert(bronquiolitis))
	(open "diagnostico.txt" mydata "a")
	(printout mydata "Enfermedad diagnosticada: Bronquiolitis." crlf
			"La bronquiolitis es una infeccion pulmonar comun en niños pequeños y bebes." crlf
			"Causa inflamacion y congestion en los bronquiolos del pulmon." crlf crlf)
	(close)
	(printout t "Enfermedad diagnosticada: Bronquiolitis." crlf)
)

(defrule regla_enf_7
	(paciente(edad ?edad))
	(sintoma(nombre_sintoma "fiebre"))
	(sintoma(nombre_sintoma "tos")(gravedad "fuerte"))
	(sintoma(nombre_sintoma "amigdalas_hinchadas")(gravedad "fuerte"))
	(test(< ?edad 14))
=>
	(assert(faringoamigdalitis))
	(open "diagnostico.txt" mydata "a")
	(printout mydata "Enfermedad diagnosticada: Faringoamidgalitis." crlf
			"La faringoamigdalitis es la infeccion aguda de la faringe o las amigdalas palatinas." crlf
			"Puede causar complicaciones que incluyen la celulitis de la amigdala o un absceso amigdalino." crlf crlf)
	(close)
	(printout t "Enfermedad diagnosticada: Faringoamidgalitis." crlf)
)

(defrule regla_enf_8
	(paciente(edad ?edad))
	(sintoma(nombre_sintoma "amigdalas_hinchadas")(gravedad "fuerte"))
	(sintoma(nombre_sintoma "amigdalas_rojas")(gravedad "fuerte"))
	(sintoma(nombre_sintoma "malestar")(gravedad "leve"))
	(test(< ?edad 14))
=>
	(assert(faringoamigdalitis))
	(open "diagnostico.txt" mydata "a")
	(printout mydata "Enfermedad diagnosticada: Faringoamidgalitis." crlf
			"La faringoamigdalitis es la infeccion aguda de la faringe o las amigdalas palatinas." crlf
			"Puede causar complicaciones que incluyen la celulitis de la amigdala o un absceso amigdalino." crlf crlf)
	(close)
	(printout t "Enfermedad diagnosticada: Faringoamidgalitis." crlf)
)

(defrule regla_enf_9
	(paciente(edad ?edad))
	(sintoma(nombre_sintoma "fatiga")(gravedad "fuerte"))
	(sintoma(nombre_sintoma "ganglios_inflamados")(gravedad "fuerte"))
	(sintoma(nombre_sintoma "dolor_garganta")(gravedad "fuerte"))
	(test(< ?edad 14))
=>
	(assert(mononucleosis))
	(open "diagnostico.txt" mydata "a")
	(printout mydata "Enfermedad diagnosticada: Mononucleosis." crlf
			"La mononucleosis infecciosa es una infeccion causada, por lo general, por el virus de Epstein-Barr." crlf
			"El virus se disemina a través de la saliva y es por ello que a veces se la llama enfermedad del beso." crlf crlf)
	(close)
	(printout t "Enfermedad diagnosticada: Mononucleosis" crlf)
)

(defrule regla_enf_10
	(paciente(edad ?edad))
	(sintoma(nombre_sintoma "fatiga")(gravedad "fuerte"))
	(sintoma(nombre_sintoma "ganglios_inflamados")(gravedad "fuerte"))
	(sintoma(nombre_sintoma "dolor_cabeza")(gravedad "fuerte"))
	(test(< ?edad 14))
=>
	(assert(mononucleosis))
	(open "diagnostico.txt" mydata "a")
	(printout mydata "Enfermedad diagnosticada: Mononucleosis." crlf
			"La mononucleosis infecciosa es una infeccion causada, por lo general, por el virus de Epstein-Barr." crlf
			"El virus se disemina a través de la saliva y es por ello que a veces se la llama enfermedad del beso." crlf crlf)
	(close)
	(printout t "Enfermedad diagnosticada: Mononucleosis" crlf)
)

(defrule regla_enf_11
	(paciente(edad ?edad))
	(sintoma(nombre_sintoma "problemas_cardiacos")(gravedad "fuerte"))
	(sintoma(nombre_sintoma "labios_secos")(gravedad "fuerte"))
	(sintoma(nombre_sintoma "labios_rojos")(gravedad "fuerte"))
	(test(< ?edad 5))
=>
	(assert(enfermedad_kawasaki))
	(open "diagnostico.txt" mydata "a")
	(printout mydata "Enfermedad diagnosticada: Enfermedad de Kawasaki." crlf
			"La enfermedad de Kawasaki es una afeccion rara que en general ataca a niños pequeños." crlf
			"Es un tipo de vasculitis, o inflamacion de los vasos sanguineos, por lo que requiere hospitalizacion" crlf crlf)
	(close)
	(printout t "Enfermedad diagnosticada: Enfermedad de Kawasaki" crlf)
)

(defrule regla_enf_12
	(paciente(edad ?edad))
	(sintoma(nombre_sintoma "problemas_cardiacos")(gravedad "fuerte"))
	(or (sintoma(nombre_sintoma "labios_secos")(gravedad "fuerte"))
		(sintoma(nombre_sintoma "labios_rojos")(gravedad "fuerte"))
	)
	(sintoma(nombre_sintoma "piel_roja")(gravedad "fuerte"))
	(test(< ?edad 5))
=>
	(assert(enfermedad_kawasaki))
	(open "diagnostico.txt" mydata "a")
	(printout mydata "Enfermedad diagnosticada: Enfermedad de Kawasaki." crlf
			"La enfermedad de Kawasaki es una afeccion rara que en general ataca a niños pequeños." crlf
			"Es un tipo de vasculitis, o inflamacion de los vasos sanguineos, por lo que requiere hospitalizacion" crlf crlf)
	(close)
	(printout t "Enfermedad diagnosticada: Enfermedad de Kawasaki" crlf)
)

(defrule regla_enf_13
	(paciente(edad ?edad))
	(sintoma(nombre_sintoma "piel_roja")(gravedad "fuerte"))
	(sintoma(nombre_sintoma "piel_granosa")(gravedad "fuerte"))
	(sintoma(nombre_sintoma "fiebre")(gravedad "fuerte"))
	(test(< ?edad 14))
	(test(> ?edad 2))
=>
	(assert(escarlatina))
	(open "diagnostico.txt" mydata "a")
	(printout mydata "Enfermedad diagnosticada: Escarlatina." crlf
			"La escarlatina es causada por bacterias llamadas Streptococcus, en su tipo A." crlf
			"Produce un sarpullido rojo brillante que afecta la mayor parte del cuerpo." crlf crlf)
	(close)
	(printout t "Enfermedad diagnosticada: Escarlatina" crlf)
)

(defrule regla_enf_14
	(paciente(edad ?edad))
	(sintoma(nombre_sintoma "tos")(gravedad "fuerte"))
	(sintoma(nombre_sintoma "vomitos")(gravedad "leve"))
	(sintoma(nombre_sintoma "problemas_pulmonares")(gravedad "fuerte"))
	(test(< ?edad 3))
=>
	(assert(tos_ferina))
	(open "diagnostico.txt" mydata "a")
	(printout mydata "Enfermedad diagnosticada: Tos Ferina." crlf
			"La tos ferina es una infeccion de las vias respiratoria altas, causada por la bacteria Bordetella pertussis." crlf
			"Es una enfermedad grave que causar discapacidad permanente en los bebes e incluso la muerte." crlf crlf)
	(close)
	(printout t "Enfermedad diagnosticada: Tos Ferina" crlf)
)

(defrule regla_enf_15
	(paciente(edad ?edad))
	(sintoma(nombre_sintoma "fiebre"))
	(sintoma(nombre_sintoma "dolor_cabeza")(gravedad "fuerte"))
	(test(< ?edad 14))
=>
	(assert(gripe))
	(open "diagnostico.txt" mydata "a")
	(printout mydata "Enfermedad diagnosticada: Gripe." crlf
			"La gripe es una infeccion de las vias respiratorias, causada por diversos virus de facil contagio" crlf
			"Suele causar la mayoria de las enfermedades durante los meses mas frios del año." crlf crlf)
	(close)
	(printout t "Enfermedad diagnosticada: Gripe" crlf)
)

(defrule regla_enf_16
	(paciente(edad ?edad))
	(sintoma(nombre_sintoma "fiebre"))
	( or    (sintoma(nombre_sintoma "mareos")(gravedad "leve"))
		(sintoma(nombre_sintoma "malestar")(gravedad "fuerte"))
		(sintoma(nombre_sintoma "inmunosupresion")(gravedad "fuerte"))
	)
	(test(< ?edad 14))
=>
	(assert(gripe))
	(open "diagnostico.txt" mydata "a")
	(printout mydata "Enfermedad diagnosticada: Gripe." crlf
			"La gripe es una infeccion de las vias respiratorias, causada por diversos virus de facil contagio" crlf
			"Suele causar la mayoria de las enfermedades durante los meses mas frios del año." crlf crlf)
	(close)
	(printout t "Enfermedad diagnosticada: Gripe" crlf)
)

(defrule regla_enf_17
	(paciente(edad ?edad))
	(sintoma(nombre_sintoma "picor_ano")(gravedad "leve"))
	(sintoma(nombre_sintoma "insonmio")(gravedad "leve"))
	(test(< ?edad 14))
=>
	(assert(enterobiasis))
	(open "diagnostico.txt" mydata "a")
	(printout mydata "Enfermedad diagnosticada: Enterobiasis." crlf
			"La enterobiasis es una infestacion por el Enterobius vermicularis." crlf
			"Se trata de un nematodo parasito del intestino grueso." crlf crlf)
	(close)
	(printout t "Enfermedad diagnosticada: Enterobiasis" crlf)
)

(defrule regla_enf_18
	(paciente(edad ?edad))
	(sintoma(nombre_sintoma "picor_ano")(gravedad "leve"))
	(sintoma(nombre_sintoma "fatiga")(gravedad "leve"))
	(test(< ?edad 14))
=>
	(assert(enterobiasis))
	(open "diagnostico.txt" mydata "a")
	(printout mydata "Enfermedad diagnosticada: Enterobiasis." crlf
			"La enterobiasis es una infestacion por el Enterobius vermicularis." crlf
			"Se trata de un nematodo parasito del intestino grueso." crlf crlf)
	(close)
	(printout t "Enfermedad diagnosticada: Enterobiasis" crlf)
)

(defrule regla_enf_19
	(paciente(edad ?edad))
	(sintoma(nombre_sintoma "diarrea")(gravedad "fuerte"))
	(sintoma(nombre_sintoma "vomitos")(gravedad "fuerte"))
	(test(< ?edad 14))
=>
	(assert(gastroenteritis))
	(open "diagnostico.txt" mydata "a")
	(printout mydata "Enfermedad diagnosticada: Gastroenteritis." crlf
			"La gastroenteritis es una inflamacion del aparato gastrointestinal debido a una infeccion o a una" crlf
			"intoxicacion por alimentos. Se caracteriza por la presencia de diarrea, fiebre y vomitos." crlf crlf)
	(close)
	(printout t "Enfermedad diagnosticada: Gastroenteritis" crlf)
)

(defrule regla_enf_20
	(paciente(edad ?edad))
	(sintoma(nombre_sintoma "fiebre")(gravedad "fuerte"))
	(sintoma(nombre_sintoma "vomitos")(gravedad "fuerte"))
	(sintoma(nombre_sintoma "dolor_cabeza"))
	(test(< ?edad 14))
=>
	(assert(malaria))
	(open "diagnostico.txt" mydata "a")
	(printout mydata "Enfermedad diagnosticada: Malaria." crlf
			"La malaria es una enfermedad potencialmente mortal causada por parasitos" crlf
			"que se transmiten al ser humano por la picadura de mosquitos." crlf crlf)
	(close)
	(printout t "Enfermedad diagnosticada: Malaria" crlf)
)

(defrule regla_enf_21
	(paciente(edad ?edad))
	(sintoma(nombre_sintoma "fiebre")(gravedad "fuerte"))
	(sintoma(nombre_sintoma "vomitos")(gravedad "fuerte"))
	(sintoma(nombre_sintoma "malestar")(gravedad "fuerte"))
	(test(< ?edad 14))
=>
	(assert(malaria))
	(open "diagnostico.txt" mydata "a")
	(printout mydata "Enfermedad diagnosticada: Malaria." crlf
			"La malaria es una enfermedad potencialmente mortal causada por parasitos" crlf
			"que se transmiten al ser humano por la picadura de mosquitos." crlf crlf)
	(close)
	(printout t "Enfermedad diagnosticada: Malaria" crlf)
)

(defrule regla_enf_22
	(paciente(edad ?edad))
	(sintoma(nombre_sintoma "fiebre")(gravedad "fuerte"))
	(sintoma(nombre_sintoma "tos")(gravedad "fuerte"))
	(sintoma(nombre_sintoma "problemas_pulmonares"))
	(sintoma(nombre_sintoma "fatiga")(gravedad "fuerte"))	
	(test(< ?edad 14))
=>
	(assert(neumonia))
	(open "diagnostico.txt" mydata "a")
	(printout mydata "Enfermedad diagnosticada: Neumonia." crlf
			"La neumonia es una infeccion en uno o ambos pulmones." crlf
			"Causa que los alveolos pulmonares se llenen de liquido o pus." crlf crlf)
	(close)
	(printout t "Enfermedad diagnosticada: Neumonia" crlf)
)

(defrule regla_enf_23
	(paciente(edad ?edad))
	(sintoma(nombre_sintoma "fiebre")(gravedad "fuerte"))
	(sintoma(nombre_sintoma "tos")(gravedad "fuerte"))
	(sintoma(nombre_sintoma "problemas_pulmonares"))
	(sintoma(nombre_sintoma "molestia_respirar"))	
	(test(< ?edad 14))
=>
	(assert(neumonia))
	(open "diagnostico.txt" mydata "a")
	(printout mydata "Enfermedad diagnosticada: Neumonia." crlf
			"La neumonia es una infeccion en uno o ambos pulmones." crlf
			"Causa que los alveolos pulmonares se llenen de liquido o pus." crlf crlf)
	(close)
	(printout t "Enfermedad diagnosticada: Neumonia" crlf)
)

(defrule regla_enf_24
	(paciente(edad ?edad))
	(sintoma(nombre_sintoma "fiebre")(gravedad "leve"))
	(sintoma(nombre_sintoma "tos")(gravedad "leve"))
	(sintoma(nombre_sintoma "dolor_cabeza")(gravedad "leve"))
	(test(< ?edad 14))
=>
	(assert(resfriado))
	(open "diagnostico.txt" mydata "a")
	(printout mydata "Enfermedad diagnosticada: Resfriado comun." crlf
			"El resfriado comun en la mayoria de los casos causa rinorrea o" crlf
			"secrecion nasal, congestion nasal y estornudo." crlf crlf)
	(close)
	(printout t "Enfermedad diagnosticada: Resfriado comun" crlf)
)

(defrule regla_enf_25
	(paciente(edad ?edad))
	(sintoma(nombre_sintoma "fiebre")(gravedad "leve"))
	(sintoma(nombre_sintoma "tos")(gravedad "leve"))
	(sintoma(nombre_sintoma "dolor_pecho")(gravedad "leve"))
	(test(< ?edad 14))
=>
	(assert(resfriado))
	(open "diagnostico.txt" mydata "a")
	(printout mydata "Enfermedad diagnosticada: Resfriado comun." crlf
			"El resfriado comun en la mayoria de los casos causa rinorrea o" crlf
			"secrecion nasal, congestion nasal y estornudo." crlf crlf)
	(close)
	(printout t "Enfermedad diagnosticada: Resfriado comun" crlf)
)

(defrule regla_enf_26
	(paciente(edad ?edad))
	(sintoma(nombre_sintoma "fatiga")(gravedad "leve"))
	(sintoma(nombre_sintoma "tos")(gravedad "leve"))
	(sintoma(nombre_sintoma "dolor_cabeza")(gravedad "leve"))
	(test(< ?edad 14))
=>
	(assert(resfriado))
	(open "diagnostico.txt" mydata "a")
	(printout mydata "Enfermedad diagnosticada: Resfriado comun." crlf
			"El resfriado comun en la mayoria de los casos causa rinorrea o" crlf
			"secrecion nasal, congestion nasal y estornudo." crlf crlf)
	(close)
	(printout t "Enfermedad diagnosticada: Resfriado comun" crlf)
)

(defrule regla_enf_27
	(paciente(edad ?edad))
	(sintoma(nombre_sintoma "picores")(gravedad "fuerte"))
	(sintoma(nombre_sintoma "piel_granosa")(gravedad "fuerte"))
	(sintoma(nombre_sintoma "piel_roja")(gravedad "fuerte"))
	(test(< ?edad 11))
	(test(> ?edad 2))
=>
	(assert(micosis))
	(open "diagnostico.txt" mydata "a")
	(printout mydata "Enfermedad diagnosticada: Micosis." crlf
			"La micosis es una infeccion producida por hongos microscopicos." crlf
			"Son afecciones que prosperan ante una baja de las defensas del sistema inmune." crlf crlf)
	(close)
	(printout t "Enfermedad diagnosticada: Micosis" crlf)
)

(defrule regla_enf_28
	(paciente(edad ?edad))
	(sintoma(nombre_sintoma "llaga_roja_nariz"))
	(sintoma(nombre_sintoma "piel_granosa"))
	(test(< ?edad 8))
=>
	(assert(impetigo))
	(open "diagnostico.txt" mydata "a")
	(printout mydata "Enfermedad diagnosticada: Impetigo." crlf
			"El impétigo es una infeccion cutanea muy contagiosa que afecta" crlf
			"principalmente a los bebes y a los niños pequeños." crlf crlf)
	(close)
	(printout t "Enfermedad diagnosticada: Impetigo" crlf)
)

(defrule regla_enf_29
	(paciente(edad ?edad))
	(sintoma(nombre_sintoma "llaga_roja_nariz"))
	(sintoma(nombre_sintoma "fiebre"))
	(test(< ?edad 8))
=>
	(assert(impetigo))
	(open "diagnostico.txt" mydata "a")
	(printout mydata "Enfermedad diagnosticada: Impetigo." crlf
			"El impétigo es una infeccion cutanea muy contagiosa que afecta" crlf
			"principalmente a los bebes y a los niños pequeños." crlf crlf)
	(close)
	(printout t "Enfermedad diagnosticada: Impetigo" crlf)
)

(defrule regla_enf_30
	(paciente(edad ?edad))
	(sintoma(nombre_sintoma "vomitos"))
	(sintoma(nombre_sintoma "picazon_interna"))
	(test(< ?edad 14))
=>
	(assert(ulcera_peptica))
	(open "diagnostico.txt" mydata "a")
	(printout mydata "Enfermedad diagnosticada: Ulcera Peptica." crlf
			"La causa mas comun de ulceras es una infeccion del estomago" crlf
			"por la bacteria llamada Helicobacter pylori." crlf crlf)
	(close)
	(printout t "Enfermedad diagnosticada: Ulcera Peptica" crlf)
)

(defrule regla_enf_31
	(paciente(edad ?edad))
	(sintoma(nombre_sintoma "vomitos"))
	(sintoma(nombre_sintoma "indigestion"))
	(test(< ?edad 14))
=>
	(assert(ulcera_peptica))
	(open "diagnostico.txt" mydata "a")
	(printout mydata "Enfermedad diagnosticada: Ulcera Peptica." crlf
			"La causa mas comun de ulceras es una infeccion del estomago" crlf
			"por la bacteria llamada Helicobacter pylori." crlf crlf)
	(close)
	(printout t "Enfermedad diagnosticada: Ulcera Peptica" crlf)
)

(defrule regla_enf_32
	(paciente(edad ?edad))
	(sintoma(nombre_sintoma "vomitos"))
	(sintoma(nombre_sintoma "tos"))
	(sintoma(nombre_sintoma "transpiracion"))
	(test(< ?edad 14))
=>
	(assert(tuberculosis))
	(open "diagnostico.txt" mydata "a")
	(printout mydata "Enfermedad diagnosticada: Tuberculosis." crlf
			"La tuberculosis es una infeccion bacteriana causada por un germen llamado" crlf
			"Mycobacterium tuberculosis. La bacteria suele atacar los pulmones." crlf crlf)
	(close)
	(printout t "Enfermedad diagnosticada: Tuberculosis" crlf)
)

(defrule regla_enf_33
	(paciente(edad ?edad))
	(sintoma(nombre_sintoma "vomitos"))
	(sintoma(nombre_sintoma "tos"))
	(sintoma(nombre_sintoma "fatiga")(gravedad "fuerte"))
	(test(< ?edad 14))
=>
	(assert(tuberculosis))
	(open "diagnostico.txt" mydata "a")
	(printout mydata "Enfermedad diagnosticada: Tuberculosis." crlf
			"La tuberculosis es una infeccion bacteriana causada por un germen llamado" crlf
			"Mycobacterium tuberculosis. La bacteria suele atacar los pulmones." crlf crlf)
	(close)
	(printout t "Enfermedad diagnosticada: Tuberculosis" crlf)
)

(defrule regla_enf_34
	(paciente(edad ?edad))
	(sintoma(nombre_sintoma "vomitos"))
	(sintoma(nombre_sintoma "malestar")(gravedad "fuerte"))
	(sintoma(nombre_sintoma "fiebre")(gravedad "leve"))
	(test(< ?edad 14))
=>
	(assert(hepatitisa))
	(open "diagnostico.txt" mydata "a")
	(printout mydata "Enfermedad diagnosticada: Hepatitis A." crlf
			"La hepatitis A es una infección del hígado sumamente contagiosa" crlf
			"causada por el virus de la hepatitis A.." crlf crlf)
	(close)
	(printout t "Enfermedad diagnosticada: Hepatitis A" crlf)
)

(defrule regla_enf_35
	(paciente(edad ?edad))
	(sintoma(nombre_sintoma "vomitos"))
	(sintoma(nombre_sintoma "perdida_apetito")(gravedad "fuerte"))
	(sintoma(nombre_sintoma "fiebre")(gravedad "leve"))
	(test(< ?edad 14))
=>
	(assert(hepatitisa))
	(open "diagnostico.txt" mydata "a")
	(printout mydata "Enfermedad diagnosticada: Hepatitis A." crlf
			"La hepatitis A es una infección del hígado sumamente contagiosa" crlf
			"causada por el virus de la hepatitis A.." crlf crlf)
	(close)
	(printout t "Enfermedad diagnosticada: Hepatitis A" crlf)
)

(defrule regla_enf_36
	(paciente(edad ?edad))
	(sintoma(nombre_sintoma "vomitos")(gravedad "fuerte"))
	(sintoma(nombre_sintoma "piel_granosa")(gravedad "fuerte"))
	(sintoma(nombre_sintoma "fiebre")(gravedad "fuerte"))
	(test(< ?edad 14))
=>
	(assert(dengue))
	(open "diagnostico.txt" mydata "a")
	(printout mydata "Enfermedad diagnosticada: Dengue." crlf
			"El dengue es una enfermedad producida por un virus de la familia de los flavivirus." crlf
			"Puede producir fiebre alta, dolores de cabeza, dolor en las articulaciones y vomitos" crlf crlf)
	(close)
	(printout t "Enfermedad diagnosticada: Dengue" crlf)
)

(defrule regla_enf_37
	(paciente(edad ?edad))
	(sintoma(nombre_sintoma "vomitos")(gravedad "fuerte"))
	(sintoma(nombre_sintoma "fatiga")(gravedad "fuerte"))
	(sintoma(nombre_sintoma "fiebre")(gravedad "fuerte"))
	(test(< ?edad 14))
=>
	(assert(dengue))
	(open "diagnostico.txt" mydata "a")
	(printout mydata "Enfermedad diagnosticada: Dengue." crlf
			"El dengue es una enfermedad producida por un virus de la familia de los flavivirus." crlf
			"Puede producir fiebre alta, dolores de cabeza, dolor en las articulaciones y vomitos" crlf crlf)
	(close)
	(printout t "Enfermedad diagnosticada: Dengue" crlf)
)

(defrule regla_enf_38
	(paciente(edad ?edad))
	(sintoma(nombre_sintoma "nauseas"))
	(sintoma(nombre_sintoma "fatiga")(gravedad "fuerte"))
	(sintoma(nombre_sintoma "fiebre"))
	(test(< ?edad 14))
=>
	(assert(tifoidea))
	(open "diagnostico.txt" mydata "a")
	(printout mydata "Enfermedad diagnosticada: Tifoidea." crlf
			"La fiebre tifoidea o fiebre enterica es una enfermedad infecciosa producida" crlf
			"por Salmonella enterica. El paciente suele presentar fiebre elevada" crlf crlf)
	(close)
	(printout t "Enfermedad diagnosticada: Tifoidea" crlf)
)

(defrule regla_enf_39
	(paciente(edad ?edad))
	(sintoma(nombre_sintoma "dolor_cabeza"))
	(sintoma(nombre_sintoma "fatiga")(gravedad "fuerte"))
	(sintoma(nombre_sintoma "fiebre"))
	(test(< ?edad 14))
=>
	(assert(tifoidea))
	(open "diagnostico.txt" mydata "a")
	(printout mydata "Enfermedad diagnosticada: Tifoidea." crlf
			"La fiebre tifoidea o fiebre enterica es una enfermedad infecciosa producida" crlf
			"por Salmonella enterica. El paciente suele presentar fiebre elevada" crlf crlf)
	(close)
	(printout t "Enfermedad diagnosticada: Tifoidea" crlf)
)

(defrule regla_enf_40
	(paciente(edad ?edad))
	(sintoma(nombre_sintoma "irritabilidad"))
	(sintoma(nombre_sintoma "fatiga")(gravedad "leve"))
	(test(< ?edad 14))
=>
	(assert(hipertiroidismo))
	(open "diagnostico.txt" mydata "a")
	(printout mydata "Enfermedad diagnosticada: Hipertiroidismo." crlf
			"Es una afeccion en la cual la glandula tiroides" crlf
			"produce demasiada hormona tiroidea." crlf crlf)
	(close)
	(printout t "Enfermedad diagnosticada: Hipertiroidismo" crlf)
)

(defrule regla_enf_41
	(paciente(edad ?edad))
	(sintoma(nombre_sintoma "irritabilidad"))
	(sintoma(nombre_sintoma "fatiga")(gravedad "fuerte"))
	(sintoma(nombre_sintoma "malestar"))
	(test(< ?edad 14))
=>
	(assert(hipotiroidismo))
	(open "diagnostico.txt" mydata "a")
	(printout mydata "Enfermedad diagnosticada: Hipotiroidismo." crlf
			"El hipotiroidismo es un trastorno en el cual la glandula tiroides " crlf
			"no produce la cantidad suficiente de ciertas hormonas cruciales." crlf crlf)
	(close)
	(printout t "Enfermedad diagnosticada: Hipotiroidismo" crlf)
)

;; ----- REGLAS PARA RECETAR UN TRATAMIENTO -----

(defrule regla_trat_1
	(paciente(patologia ~"alergia_lactosa"))
	(varicela)
=>
	(assert(aciclovir))
	(assert(hidratacion))
	(open "diagnostico.txt" mydata "a")
	(printout mydata "Tratamiento: Aciclovir e hidratacion." crlf)
	(close)
	(printout t "Tratamiento: Aciclovir e hidratacion." crlf)
)

(defrule regla_trat_2
	(paciente(patologia "alergia_lactosa"))
	(varicela)
=>
	(assert(hidratacion))
	(open "diagnostico.txt" mydata "a")
	(printout mydata "Tratamiento: Hidratacion." crlf)
	(close)
	(printout t "Tratamiento: Hidratacion." crlf)
)

(defrule regla_trat_3
	(sarampion)
=>
	(assert(ibuprofeno))
	(assert(reposo))
	(open "diagnostico.txt" mydata "a")
	(printout mydata "Tratamiento: Ibuprofeno y reposo." crlf)
	(close)
	(printout t "Tratamiento: Ibuprofeno y reposo." crlf)
)

(defrule regla_trat_4
	(paciente(patologia ~"danos_hepaticos"))
	(bronquiolitis)
=>
	(assert(paracetamol))
	(assert(reposo))
	(assert(ambiente_humedo))
	(open "diagnostico.txt" mydata "a")
	(printout mydata "Tratamiento: Paracetamol, reposo y humedecer ambiente." crlf)
	(close)
	(printout t "Tratamiento: Paracetamol, reposo y humedecer ambiente." crlf)
)

(defrule regla_trat_5
	(paciente(patologia "danos_hepaticos"))
	(bronquiolitis)
=>
	(assert(reposo))
	(assert(ambiente_humedo))
	(open "diagnostico.txt" mydata "a")
	(printout mydata "Tratamiento: Reposo y humedecer ambiente." crlf)
	(close)
	(printout t "Tratamiento: Reposo y humedecer ambiente." crlf)
)

(defrule regla_trat_6
	(faringoamigdalitis)
=>
	(assert(penicilina))
	(assert(hidratacion))
	(open "diagnostico.txt" mydata "a")
	(printout mydata "Tratamiento: Penicilina e hidratacion." crlf)
	(close)
	(printout t "Tratamiento: Penicilina e hidratacion." crlf)
)

(defrule regla_trat_7
	(paciente(patologia ~"danos_hepaticos"))
	(mononucleosis)
=>
	(assert(paracetamol))
	(assert(hospitalizacion))
	(open "diagnostico.txt" mydata "a")
	(printout mydata "Tratamiento: Paracetamol y hospitalizacion inmediata." crlf)
	(close)
	(printout t "Tratamiento: Paracetamol y hospitalizacion inmediata." crlf)
)

(defrule regla_trat_8
	(paciente(patologia "danos_hepaticos"))
	(mononucleosis)
=>
	(assert(hospitalizacion))
	(open "diagnostico.txt" mydata "a")
	(printout mydata "Tratamiento: Hospitalizacion inmediata." crlf)
	(close)
	(printout t "Tratamiento: Hospitalización inmediata." crlf)
)

(defrule regla_trat_9
	(paciente(patologia ~"problemas_cardiacos"))
	(enfermedad_kawasaki)
=>
	(assert(hospitalizacion))
	(assert(acido_acetilsalicilico))
	(open "diagnostico.txt" mydata "a")
	(printout mydata "Tratamiento: Hospitalizacion inmediata y acido acetilsalicilico." crlf)
	(close)
	(printout t "Tratamiento: Hospitalización inmediata y acido acetilsalicilico." crlf)
)

(defrule regla_trat_10
	(paciente(patologia "problemas_cardiacos"))
	(enfermedad_kawasaki)
=>
	(assert(hospitalizacion))
	(open "diagnostico.txt" mydata "a")
	(printout mydata "Tratamiento: Hospitalizacion inmediata." crlf)
	(close)
	(printout t "Tratamiento: Hospitalización inmediata." crlf)
)

(defrule regla_trat_11
	(paciente(patologia ~"diabetes"))
	(escarlatina)
=>
	(assert(amoxicilina))
	(assert(reposo))
	(open "diagnostico.txt" mydata "a")
	(printout mydata "Tratamiento: Amoxicilina y reposo." crlf)
	(close)
	(printout t "Tratamiento: Amoxicilina y reposo." crlf)
)

(defrule regla_trat_12
	(paciente(patologia "diabetes"))
	(escarlatina)
=>
	(assert(reposo))
	(open "diagnostico.txt" mydata "a")
	(printout mydata "Tratamiento: Reposo." crlf)
	(close)
	(printout t "Tratamiento: Reposo." crlf)
)

(defrule regla_trat_13
	(tos_ferina)
=>
	(assert(claritromicina))
	(assert(alimentacion_adecuada))
	(assert(reposo))
	(open "diagnostico.txt" mydata "a")
	(printout mydata "Tratamiento: Claritromicina, alimentacion adecuada y reposo." crlf)
	(close)
	(printout t "Tratamiento: Claritromicina, alimentacion adecuada y reposo." crlf)
)

(defrule regla_trat_14
	(paciente(patologia ~"danos_hepaticos"))
	(gripe)
=>
	(assert(paracetamol))
	(assert(hidratacion))
	(assert(reposo))
	(open "diagnostico.txt" mydata "a")
	(printout mydata "Tratamiento: Paracetamol, hidratacion y reposo." crlf)
	(close)
	(printout t "Tratamiento: Paracetamol, hidratacion y reposo." crlf)
)

(defrule regla_trat_15
	(paciente(patologia "danos_hepaticos"))
	(gripe)
=>
	(assert(hidratacion))
	(assert(reposo))
	(open "diagnostico.txt" mydata "a")
	(printout mydata "Tratamiento: Hidratacion y reposo." crlf)
	(close)
	(printout t "Tratamiento: Hidratacion y reposo." crlf)
)

(defrule regla_trat_16
	(paciente(patologia ~"asma"))
	(enterobiasis)
=>
	(assert(hidratacion))
	(assert(mebendazol))
	(open "diagnostico.txt" mydata "a")
	(printout mydata "Tratamiento: Hidratacion y mebendazol." crlf)
	(close)
	(printout t "Tratamiento: Hidratacion y mebendazol." crlf)
)

(defrule regla_trat_17
	(paciente(patologia "asma"))
	(enterobiasis)
=>
	(assert(hidratacion))
	(open "diagnostico.txt" mydata "a")
	(printout mydata "Tratamiento: Hidratacion." crlf)
	(close)
	(printout t "Tratamiento: Hidratacion." crlf)
)

(defrule regla_trat_18
	(paciente(patologia ~"problemas_cardiacos"))
	(gastroenteritis)
=>
	(assert(poleramida))
	(assert(hidratacion))
	(open "diagnostico.txt" mydata "a")
	(printout mydata "Tratamiento: Hidratacion y poleramida." crlf)
	(close)
	(printout t "Tratamiento: Hidratacion y poleramida." crlf)
)

(defrule regla_trat_19
	(paciente(patologia "problemas_cardiacos"))
	(gastroenteritis)
=>
	(assert(hidratacion))
	(open "diagnostico.txt" mydata "a")
	(printout mydata "Tratamiento: Hidratacion." crlf)
	(close)
	(printout t "Tratamiento: Hidratacion." crlf)
)

(defrule regla_trat_20
	(paciente(patologia ~"problemas_cardiacos"))
	(malaria)
=>
	(assert(hidratacion))
	(assert(artesimina))
	(assert(cloroquina))
	(open "diagnostico.txt" mydata "a")
	(printout mydata "Tratamiento: Cloroquina, artesimina e hidratacion." crlf)
	(close)
	(printout t "Tratamiento: Cloroquina, artesimina e hidratacion." crlf)
)

(defrule regla_trat_21
	(paciente(patologia "problemas_cardiacos"))
	(malaria)
=>
	(assert(hidratacion))
	(assert(artesimina))
	(open "diagnostico.txt" mydata "a")
	(printout mydata "Tratamiento: Artesimina e hidratacion." crlf)
	(close)
	(printout t "Tratamiento: Artesimina e hidratacion." crlf)
)

(defrule regla_trat_22
	(neumonia)
=>
	(assert(hidratacion))
	(assert(penicilina))
	(assert(reposo))
	(open "diagnostico.txt" mydata "a")
	(printout mydata "Tratamiento: Penicilina, reposo e hidratacion." crlf)
	(close)
	(printout t "Tratamiento: Penicilina, reposo e hidratacion." crlf)
)

(defrule regla_trat_23
	(resfriado)
=>
	(assert(hidratacion))
	(assert(reposo))
	(assert(dieta_blanda))
	(open "diagnostico.txt" mydata "a")
	(printout mydata "Tratamiento: No hacer uso de antibioticos. Reposo, hidratacion y dieta blanda." crlf)
	(close)
	(printout t "Tratamiento: No hacer uso de antibioticos. Reposo, hidratación y dieta blanda." crlf)
)

(defrule regla_trat_24
	(micosis)
=>
	(assert(miconazol))
	(printout t "Tratamiento: Miconazol." crlf)
)

(defrule regla_trat_25
	(impetigo)
=>
	(assert(tisuderma))
	(assert(humedecer_zona))
	(open "diagnostico.txt" mydata "a")
	(printout mydata "Tratamiento: Tisuderma y humedecer zona afectada." crlf)
	(close)
	(printout t "Tratamiento: Tisuderma y humedecer zona afectada." crlf)
)

(defrule regla_trat_26
	(ulcera_peptica)
=>
	(assert(esomeprazol))
	(assert(dieta_blanda))
	(assert(reposo))
	(open "diagnostico.txt" mydata "a")
	(printout mydata "Tratamiento: Esomeprazol, dieta blanda y reposo." crlf)
	(close)
	(printout t "Tratamiento: Esomeprazol, dieta blanda y reposo." crlf)
)

(defrule regla_trat_27
	(tuberculosis)
=>
	(assert(isoniacida))
	(assert(etambutol))
	(open "diagnostico.txt" mydata "a")
	(printout mydata "Tratamiento: Isoniacida y Etambutol." crlf)
	(close)
	(printout t "Tratamiento: Isoniacida y Etambutol." crlf)
)

(defrule regla_trat_28
	(hepatitisa)
=>
	(assert(reposo))
	(assert(hidratacion))
	(open "diagnostico.txt" mydata "a")
	(printout mydata "Tratamiento: Reposo e hidratacion." crlf)
	(close)
	(printout t "Tratamiento: Reposo e hidratacion." crlf)
)

(defrule regla_trat_29
	(paciente(patologia ~"danos_hepaticos"))
	(dengue)
=>
	(assert(reposo))
	(assert(paracetamol))
	(open "diagnostico.txt" mydata "a")
	(printout mydata "Tratamiento: Reposo y paracetamol en caso de fiebre alta." crlf)
	(close)
	(printout t "Tratamiento: Reposo y Paracetamol en caso de fiebre alta." crlf)
)

(defrule regla_trat_30
	(paciente(patologia "danos_hepaticos"))
	(dengue)
=>
	(assert(tylenol))
	(assert(reposo))
	(open "diagnostico.txt" mydata "a")
	(printout mydata "Tratamiento: Tylenol y reposo." crlf)
	(close)
	(printout t "Tratamiento: Tylenol y reposo." crlf)
)

(defrule regla_trat_31
	(tifoidea)
=>
	(assert(ciprofloxacino))
	(assert(reposo))
	(open "diagnostico.txt" mydata "a")
	(printout mydata "Tratamiento: Ciprofloxacino y Ceftriaxona." crlf)
	(close)
	(printout t "Tratamiento: Ciprofloxacino y Ceftriaxona." crlf)
)

(defrule regla_trat_32
	(hipertiroidismo)
=>
	(assert(propiltiouracilo))
	(assert(metimazol))
	(open "diagnostico.txt" mydata "a")
	(printout mydata "Tratamiento: Propiltiouracilo y Metimazol." crlf)
	(close)
	(printout t "Tratamiento: Propiltiouracilo y Metimazol." crlf)
)

(defrule regla_trat_33
	(hipotiroidismo)
=>
	(assert(levothroid))
	(assert(synthroid))
	(open "diagnostico.txt" mydata "a")
	(printout mydata "Tratamiento: Levothroid y Synthroid." crlf)
	(close)
	(printout t "Tratamiento: Levothroid y Synthroid." crlf)
)
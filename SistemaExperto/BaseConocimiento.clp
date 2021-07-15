(deftemplate paciente
	(slot nombre)
	(slot edad)
	(slot patologia))

(deftemplate sintoma
	(slot nombre)
	(slot gravedad))

;; ----- REGLAS PARA DIAGNÓSTICO DE ENFERMEDADES -----

(defrule regla_enf_1
	(paciente(edad ?edad))
	(sintoma(nombre picores)(gravedad fuerte))
	(sintoma(nombre piel_granosa)(gravedad leve))
	(sintoma(nombre piel_roja)(gravedad leve))
	(test(< ?edad 14))
=>
	(assert(varicela))
	(printout t "Enfermedad diagnosticada: Varicela." crlf)
)

(defrule regla_enf_2
	(paciente(edad ?edad))
	(sintoma(nombre picores)(gravedad fuerte))
	(sintoma(nombre piel_granosa)(gravedad leve))
	(sintoma(nombre ganglios_inflamados)(gravedad leve))
	(test(< ?edad 14))
=>
	(assert(varicela))
	(printout t "Enfermedad diagnosticada: Varicela." crlf)
)

(defrule regla_enf_3
	(paciente(edad ?edad))
	(sintoma(nombre fiebre))
	(sintoma(nombre piel_granosa)(gravedad fuerte))
	(test(< ?edad 5))
=>
	(assert(sarampion))
	(printout t "Enfermedad diagnosticada: Sarampion." crlf)	
)

(defrule regla_enf_4
	(paciente(edad ?edad))
	(sintoma(nombre tos)(gravedad fuerte))
	(sintoma(nombre diarrea)(gravedad leve))
	(sintoma(nombre piel_granosa)(gravedad fuerte))	
	(test(< ?edad 5))
=>
	(assert(sarampion))
	(printout t "Enfermedad diagnosticada: Sarampion." crlf)	
)

(defrule regla_enf_5
	(paciente(edad ?edad))
	(sintoma(nombre fiebre))
	(sintoma(nombre molestia_respirar)(gravedad leve))
	(sintoma(nombre jadeos)(gravedad leve))
	(test(< ?edad 14))
=>
	(assert(bronquiolitis))
	(printout t "Enfermedad diagnosticada: Bronquiolitis." crlf)
)

(defrule regla_enf_6
	(paciente(edad ?edad))
	(sintoma(nombre fiebre))
	(sintoma(nombre molestia_respirar)(gravedad leve))
	(sintoma(nombre insuficiencia_respiratoria)(gravedad fuerte))
	(test(< ?edad 14))
=>
	(assert(bronquiolitis))
	(printout t "Enfermedad diagnosticada: Bronquiolitis." crlf)
)

(defrule regla_enf_7
	(paciente(edad ?edad))
	(sintoma(nombre fiebre))
	(sintoma(nombre tos)(gravedad fuerte))
	(sintoma(nombre amigdalas_hinchadas)(gravedad fuerte))
	(test(< ?edad 14))
=>
	(assert(faringoamigdalitis))
	(printout t "Enfermedad diagnosticada: Faringoamidgalitis." crlf)
)

(defrule regla_enf_8
	(paciente(edad ?edad))
	(sintoma(nombre amigdalas_hinchadas)(gravedad fuerte))
	(sintoma(nombre amigdalas_rojas)(gravedad fuerte))
	(sintoma(nombre malestar)(gravedad leve))
	(test(< ?edad 14))
=>
	(assert(faringoamigdalitis))
	(printout t "Enfermedad diagnosticada: Faringoamidgalitis." crlf)
)

(defrule regla_enf_9
	(paciente(edad ?edad))
	(sintoma(nombre fatiga)(gravedad fuerte))
	(sintoma(nombre ganglios_inflamados)(gravedad fuerte))
	(sintoma(nombre dolor_garganta)(gravedad fuerte))
	(test(< ?edad 14))
=>
	(assert(mononucleosis))
	(printout t "Enfermedad diagnosticada: Mononucleosis" crlf)
)

(defrule regla_enf_10
	(paciente(edad ?edad))
	(sintoma(nombre fatiga)(gravedad fuerte))
	(sintoma(nombre ganglios_inflamados)(gravedad fuerte))
	(sintoma(nombre dolor_cabeza)(gravedad fuerte))
	(test(< ?edad 14))
=>
	(assert(mononucleosis))
	(printout t "Enfermedad diagnosticada: Mononucleosis" crlf)
)

(defrule regla_enf_11
	(paciente(edad ?edad))
	(sintoma(nombre problemas_cardiacos)(gravedad fuerte))
	(sintoma(nombre labios_secos)(gravedad fuerte))
	(sintoma(nombre labios_rojos)(gravedad fuerte))
	(test(< ?edad 5))
=>
	(assert(enfermedad_kawasaki))
	(printout t "Enfermedad diagnosticada: Enfermedad de Kawasaki" crlf)
)

(defrule regla_enf_12
	(paciente(edad ?edad))
	(sintoma(nombre problemas_cardiacos)(gravedad fuerte))
	(or	(sintoma(nombre labios_secos)(gravedad fuerte))
		(sintoma(nombre labios_rojos)(gravedad fuerte))
	)
	(sintoma(nombre piel_roja)(gravedad leve))
	(test(< ?edad 5))
=>
	(assert(enfermedad_kawasaki))
	(printout t "Enfermedad diagnosticada: Enfermedad de Kawasaki" crlf)
)

(defrule regla_enf_13
	(paciente(edad ?edad))
	(sintoma(nombre piel_roja)(gravedad fuerte))
	(sintoma(nombre piel_granosa)(gravedad fuerte))
	(sintoma(nombre fiebre)(gravedad fuerte))
	(test(< ?edad 14))
	(test(> ?edad 2))

=>
	(assert(escarlatina))
	(printout t "Enfermedad diagnosticada: Escarlatina" crlf)
)

(defrule regla_enf_14
	(paciente(edad ?edad))
	(sintoma(nombre tos)(gravedad fuerte))
	(sintoma(nombre vomitos)(gravedad leve))
	(sintoma(nombre problemas_pulmonares)(gravedad fuerte))
	(test(< ?edad 3))
=>
	(assert(tos_ferina))
	(printout t "Enfermedad diagnosticada: Tos ferina" crlf)
)

(defrule regla_enf_15
	(paciente(edad ?edad))
	(sintoma(nombre fiebre))
	(sintoma(nombre dolor_cabeza)(gravedad fuerte))
	(test(< ?edad 14))
=>
	(assert(gripe))
	(printout t "Enfermedad diagnosticada: Gripe" crlf)
)

(defrule regla_enf_16
	(paciente(edad ?edad))
	(sintoma(nombre fiebre))
	( or 	(sintoma(nombre mareos)(gravedad leve))
		(sintoma(nombre malestar)(gravedad fuerte))
		(sintoma(nombre inmunosupresion)(gravedad fuerte))
	)
	(test(< ?edad 14))
=>
	(assert(gripe))
	(printout t "Enfermedad diagnosticada: Gripe" crlf)
)

(defrule regla_enf_17
	(paciente(edad ?edad))
	(sintoma(nombre picor_ano)(gravedad leve))
	(sintoma(nombre insonmio)(gravedad leve))
	(test(< ?edad 14))
=>
	(assert(enterobiasis))
	(printout t "Enfermedad diagnosticada: Enterobiasis" crlf)
)

(defrule regla_enf_18
	(paciente(edad ?edad))
	(sintoma(nombre picor_ano)(gravedad leve))
	(sintoma(nombre fatiga)(gravedad leve))
	(test(< ?edad 14))
=>
	(assert(enterobiasis))
	(printout t "Enfermedad diagnosticada: Enterobiasis" crlf)
)

(defrule regla_enf_19
	(paciente(edad ?edad))
	(sintoma(nombre diarrea)(gravedad fuerte))
	(sintoma(nombre vomitos)(gravedad fuerte))
	(test(< ?edad 14))
=>
	(assert(gastroenteritis))
	(printout t "Enfermedad diagnosticada: Gastroenteritis" crlf)
)

(defrule regla_enf_20
	(paciente(edad ?edad))
	(sintoma(nombre fiebre)(gravedad fuerte))
	(sintoma(nombre vomitos)(gravedad fuerte))
	(sintoma(nombre dolor_cabeza))
	(test(< ?edad 14))
=>
	(assert(malaria))
	(printout t "Enfermedad diagnosticada: Malaria" crlf)
)

(defrule regla_enf_21
	(paciente(edad ?edad))
	(sintoma(nombre fiebre)(gravedad fuerte))
	(sintoma(nombre vomitos)(gravedad fuerte))
	(sintoma(nombre malestar)(gravedad fuerte))
	(test(< ?edad 14))
=>
	(assert(malaria))
	(printout t "Enfermedad diagnosticada: Malaria" crlf)
)

(defrule regla_enf_22
	(paciente(edad ?edad))
	(sintoma(nombre fiebre)(gravedad fuerte))
	(sintoma(nombre tos)(gravedad fuerte))
	(sintoma(nombre problemas_pulmonares))
	(sintoma(nombre fatiga)(gravedad fuerte))	
	(test(< ?edad 14))
=>
	(assert(neumonia))
	(printout t "Enfermedad diagnosticada: Neumonia" crlf)
)

(defrule regla_enf_23
	(paciente(edad ?edad))
	(sintoma(nombre fiebre)(gravedad fuerte))
	(sintoma(nombre tos)(gravedad fuerte))
	(sintoma(nombre problemas_pulmonares))
	(sintoma(nombre molestia_respirar))	
	(test(< ?edad 14))
=>
	(assert(neumonia))
	(printout t "Enfermedad diagnosticada: Neumonia" crlf)
)

(defrule regla_enf_24
	(paciente(edad ?edad))
	(sintoma(nombre fiebre)(gravedad leve))
	(sintoma(nombre tos)(gravedad leve))
	(sintoma(nombre dolor_cabeza)(gravedad leve))
	(test(< ?edad 14))
=>
	(assert(resfriado))
	(printout t "Enfermedad diagnosticada: Resfriado comun" crlf)
)

(defrule regla_enf_25
	(paciente(edad ?edad))
	(sintoma(nombre fiebre)(gravedad leve))
	(sintoma(nombre tos)(gravedad leve))
	(sintoma(nombre dolor_pecho)(gravedad leve))
	(test(< ?edad 14))
=>
	(assert(resfriado))
	(printout t "Enfermedad diagnosticada: Resfriado comun" crlf)
)

(defrule regla_enf_26
	(paciente(edad ?edad))
	(sintoma(nombre fatiga)(gravedad leve))
	(sintoma(nombre tos)(gravedad leve))
	(sintoma(nombre dolor_cabeza)(gravedad leve))
	(test(< ?edad 14))
=>
	(assert(resfriado))
	(printout t "Enfermedad diagnosticada: Resfriado comun" crlf)
)

(defrule regla_enf_27
	(paciente(edad ?edad))
	(sintoma(nombre picores)(gravedad fuerte))
	(sintoma(nombre piel_granosa)(gravedad fuerte))
	(sintoma(nombre piel_roja)(gravedad fuerte))
	(test(< ?edad 11))
	(test(> ?edad 2))
=>
	(assert(micosis))
	(printout t "Enfermedad diagnosticada: Micosis" crlf)
)

(defrule regla_enf_28
	(paciente(edad ?edad))
	(sintoma(nombre llaga_roja_nariz))
	(sintoma(nombre piel_granosa))
	(test(< ?edad 8))
=>
	(assert(impetigo))
	(printout t "Enfermedad diagnosticada: Impetigo" crlf)
)

(defrule regla_enf_29
	(paciente(edad ?edad))
	(sintoma(nombre llaga_roja_nariz))
	(sintoma(nombre fiebre))
	(test(< ?edad 8))
=>
	(assert(impetigo))
	(printout t "Enfermedad diagnosticada: Impetigo" crlf)
)

(defrule regla_enf_30
	(paciente(edad ?edad))
	(sintoma(nombre vomitos))
	(sintoma(nombre picazon_interna))
	(test(< ?edad 14))
=>
	(assert(ulcera_peptica))
	(printout t "Enfermedad diagnosticada: Ulcera Peptica" crlf)
)

(defrule regla_enf_31
	(paciente(edad ?edad))
	(sintoma(nombre vomitos))
	(sintoma(nombre indigestion))
	(test(< ?edad 14))
=>
	(assert(ulcera_peptica))
	(printout t "Enfermedad diagnosticada: Ulcera Peptica" crlf)
)

(defrule regla_enf_32
	(paciente(edad ?edad))
	(sintoma(nombre vomitos))
	(sintoma(nombre tos))
	(sintoma(nombre transpiracion))
	(test(< ?edad 14))
=>
	(assert(tuberculosis))
	(printout t "Enfermedad diagnosticada: Tuberculosis" crlf)
)

(defrule regla_enf_33
	(paciente(edad ?edad))
	(sintoma(nombre vomitos))
	(sintoma(nombre tos))
	(sintoma(nombre fatiga)(gravedad fuerte))
	(test(< ?edad 14))
=>
	(assert(tuberculosis))
	(printout t "Enfermedad diagnosticada: Tuberculosis" crlf)
)

(defrule regla_enf_34
	(paciente(edad ?edad))
	(sintoma(nombre vomitos))
	(sintoma(nombre malestar)(gravedad fuerte))
	(sintoma(nombre fiebre)(gravedad leve))
	(test(< ?edad 14))
=>
	(assert(hepatitisa))
	(printout t "Enfermedad diagnosticada: Hepatitis A" crlf)
)

(defrule regla_enf_35
	(paciente(edad ?edad))
	(sintoma(nombre vomitos))
	(sintoma(nombre perdida_apetito)(gravedad fuerte))
	(sintoma(nombre fiebre)(gravedad leve))
	(test(< ?edad 14))
=>
	(assert(hepatitisa))
	(printout t "Enfermedad diagnosticada: Hepatitis A" crlf)
)

(defrule regla_enf_36
	(paciente(edad ?edad))
	(sintoma(nombre vomitos)(gravedad fuerte))
	(sintoma(nombre piel_granosa)(gravedad fuerte))
	(sintoma(nombre fiebre)(gravedad fuerte))
	(test(< ?edad 14))
=>
	(assert(dengue))
	(printout t "Enfermedad diagnosticada: Dengue" crlf)
)

(defrule regla_enf_37
	(paciente(edad ?edad))
	(sintoma(nombre vomitos)(gravedad fuerte))
	(sintoma(nombre fatiga)(gravedad fuerte))
	(sintoma(nombre fiebre)(gravedad fuerte))
	(test(< ?edad 14))
=>
	(assert(dengue))
	(printout t "Enfermedad diagnosticada: Dengue" crlf)
)

(defrule regla_enf_38
	(paciente(edad ?edad))
	(sintoma(nombre nauseas))
	(sintoma(nombre fatiga)(gravedad fuerte))
	(sintoma(nombre fiebre))
	(test(< ?edad 14))
=>
	(assert(tifoidea))
	(printout t "Enfermedad diagnosticada: Tifoidea" crlf)
)

(defrule regla_enf_39
	(paciente(edad ?edad))
	(sintoma(nombre dolor_cabeza))
	(sintoma(nombre fatiga)(gravedad fuerte))
	(sintoma(nombre fiebre))
	(test(< ?edad 14))
=>
	(assert(tifoidea))
	(printout t "Enfermedad diagnosticada: Tifoidea" crlf)
)

(defrule regla_enf_40
	(paciente(edad ?edad))
	(sintoma(nombre irritabilidad))
	(sintoma(nombre fatiga)(gravedad leve))
	(test(< ?edad 14))
=>
	(assert(hipertiroidismo))
	(printout t "Enfermedad diagnosticada: Hipertiroidismo" crlf)
)

(defrule regla_enf_41
	(paciente(edad ?edad))
	(sintoma(nombre irritabilidad))
	(sintoma(nombre fatiga)(gravedad fuerte))
	(sintoma(nombre malestar))
	(test(< ?edad 14))
=>
	(assert(hipotiroidismo))
	(printout t "Enfermedad diagnosticada: Hipotiroidismo" crlf)
)

;; ----- REGLAS PARA RECETAR UN TRATAMIENTO -----

(defrule regla_trat_1
	(paciente(patologia ~alergia_lactosa))
	(varicela)
=>
	(assert(aciclovir))
	(assert(hidratacion))
	(printout t "Tratamiento: Aciclovir e hidratacion." crlf)
)

(defrule regla_trat_2
	(paciente(patologia alergia_lactosa))
	(varicela)
=>
	(assert(hidratacion))
	(printout t "Tratamiento: Hidratacion." crlf)
)

(defrule regla_trat_3
	(sarampion)
=>
	(assert(ibuprofeno))
	(assert(reposo))
	(printout t "Tratamiento: Ibuprofeno y reposo." crlf)
)

(defrule regla_trat_4
	(paciente(patologia ~danos_hepaticos))
	(bronquiolitis)
=>
	(assert(paracetamol))
	(assert(reposo))
	(assert(ambiente_humedo))
	(printout t "Tratamiento: Paracetamol, reposo y humedecer ambiente." crlf)
)

(defrule regla_trat_5
	(paciente(patologia danos_hepaticos))
	(bronquiolitis)
=>
	(assert(reposo))
	(assert(ambiente_humedo))
	(printout t "Tratamiento: Reposo y humedecer ambiente." crlf)
)

(defrule regla_trat_6
	(faringoamigdalitis)
=>
	(assert(penicilina))
	(assert(hidratacion))
	(printout t "Tratamiento: Penicilina e hidratacion." crlf)
)

(defrule regla_trat_7
	(paciente(patologia ~danos_hepaticos))
	(mononucleosis)
=>
	(assert(paracetamol))
	(assert(hospitalizacion))
	(printout t "Tratamiento: Paracetamol y hospitalizacion inmediata." crlf)
)

(defrule regla_trat_8
	(paciente(patologia danos_hepaticos))
	(mononucleosis)
=>
	(assert(hospitalizacion))
	(printout t "Tratamiento: Hospitalización inmediata." crlf)
)

(defrule regla_trat_9
	(paciente(patologia ~problemas_cardiacos))
	(enfermedad_kawasaki)
=>
	(assert(hospitalizacion))
	(assert(acido_acetilsalicilico))
	(printout t "Tratamiento: Hospitalización inmediata y acido acetilsalicilico." crlf)
)

(defrule regla_trat_10
	(paciente(patologia problemas_cardiacos))
	(enfermedad_kawasaki)
=>
	(assert(hospitalizacion))
	(printout t "Tratamiento: Hospitalización inmediata." crlf)
)

(defrule regla_trat_11
	(paciente(patologia ~diabetes))
	(escarlatina)
=>
	(assert(amoxicilina))
	(assert(reposo))
	(printout t "Tratamiento: Amoxicilina y reposo." crlf)
)

(defrule regla_trat_12
	(paciente(patologia diabetes))
	(escarlatina)
=>
	(assert(reposo))
	(printout t "Tratamiento: Reposo." crlf)
)

(defrule regla_trat_13
	(tos_ferina)
=>
	(assert(claritromicina))
	(assert(alimentacion_adecuada))
	(assert(reposo))
	(printout t "Tratamiento: Claritromicina, alimentacion adecuada y reposo." crlf)
)

(defrule regla_trat_14
	(paciente(patologia ~danos_hepaticos))
	(gripe)
=>
	(assert(paracetamol))
	(assert(hidratacion))
	(assert(reposo))
	(printout t "Tratamiento: Paracetamol, hidratacion y reposo." crlf)
)

(defrule regla_trat_15
	(paciente(patologia danos_hepaticos))
	(gripe)
=>
	(assert(hidratacion))
	(assert(reposo))
	(printout t "Tratamiento: Hidratacion y reposo." crlf)
)

(defrule regla_trat_16
	(paciente(patologia ~asma))
	(enterobiasis)
=>
	(assert(hidratacion))
	(assert(mebendazol))
	(printout t "Tratamiento: Hidratacion y mebendazol." crlf)
)

(defrule regla_trat_17
	(paciente(patologia asma))
	(enterobiasis)
=>
	(assert(hidratacion))
	(printout t "Tratamiento: Hidratacion." crlf)
)

(defrule regla_trat_18
	(paciente(patologia ~problemas_cardiacos))
	(gastroenteritis)
=>
	(assert(poleramida))
	(assert(hidratacion))
	(printout t "Tratamiento: Hidratacion y poleramida." crlf)
)

(defrule regla_trat_19
	(paciente(patologia problemas_cardiacos))
	(gastroenteritis)
=>
	(assert(hidratacion))
	(printout t "Tratamiento: Hidratacion." crlf)
)

(defrule regla_trat_20
	(paciente(patologia ~problemas_cardiacos))
	(malaria)
=>
	(assert(hidratacion))
	(assert(artesimina))
	(assert(cloroquina))
	(printout t "Tratamiento: Cloroquina, artesimina e hidratacion." crlf)
)

(defrule regla_trat_21
	(paciente(patologia problemas_cardiacos))
	(malaria)
=>
	(assert(hidratacion))
	(assert(artesimina))
	(printout t "Tratamiento: Artesimina e hidratacion." crlf)
)

(defrule regla_trat_22
	(neumonia)
=>
	(assert(hidratacion))
	(assert(penicilina))
	(assert(reposo))
	(printout t "Tratamiento: Penicilina, reposo e hidratacion." crlf)
)

(defrule regla_trat_23
	(resfriado)
=>
	(assert(hidratacion))
	(assert(reposo))
	(assert(dieta_blanda))
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
	(printout t "Tratamiento: Tisuderma y humedecer zona afectada." crlf)
)

(defrule regla_trat_26
	(ulcera_peptica)
=>
	(assert(esomeprazol))
	(assert(dieta_blanda))
	(assert(reposo))
	(printout t "Tratamiento: Esomeprazol, dieta blanda y reposo." crlf)
)

(defrule regla_trat_27
	(tuberculosis)
=>
	(assert(isoniacida))
	(assert(etambutol))
	(printout t "Tratamiento: Isoniacida y Etambutol." crlf)
)

(defrule regla_trat_28
	(hepatitisa)
=>
	(assert(reposo))
	(assert(hidratacion))
	(printout t "Tratamiento: Reposo e hidratacion." crlf)
)

(defrule regla_trat_29
	(paciente(patologia ~danos_hepaticos))
	(dengue)
=>
	(assert(reposo))
	(assert(paracetamol))
	(printout t "Tratamiento: Reposo y Paracetamol en caso de fiebre alta." crlf)
)

(defrule regla_trat_30
	(paciente(patologia danos_hepaticos))
	(dengue)
=>
	(assert(tylenol))
	(assert(reposo))
	(printout t "Tratamiento: Tylenol y reposo." crlf)
)

(defrule regla_trat_31
	(tifoidea)
=>
	(assert(ciprofloxacino))
	(assert(reposo))
	(printout t "Tratamiento: Ciprofloxacino y Ceftriaxona." crlf)
)

(defrule regla_trat_32
	(hipertiroidismo)
=>
	(assert(propiltiouracilo))
	(assert(metimazol))
	(printout t "Tratamiento: Propiltiouracilo y Metimazol." crlf)
)

(defrule regla_trat_33
	(hipotiroidismo)
=>
	(assert(levothroid))
	(assert(synthroid))
	(printout t "Tratamiento: Levothroid y Synthroid." crlf)
)


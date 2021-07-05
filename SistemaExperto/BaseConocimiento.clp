(deftemplate paciente
	(slot nombre)
	(slot edad)
	(slot patologia))

(deftemplate sintoma
	(slot nombre)
	(slot gravedad))

;; ----- REGLAS PARA DIAGNÓSTICO DE ENFERMEDADES -----

(defrule regla_1
	(paciente(edad ?edad))
	(sintoma(nombre picores)(gravedad fuerte))
	(sintoma(nombre piel_granosa)(gravedad leve))
	(sintoma(nombre piel_roja)(gravedad leve))
	(test(< ?edad 13))
=>
	(assert(varicela))
	(printout t "Enfermedad diagnosticada: Varicela." crlf)
)

(defrule regla_2
	(paciente(edad ?edad))
	(sintoma(nombre picores)(gravedad fuerte))
	(sintoma(nombre piel_granosa)(gravedad leve))
	(sintoma(nombre piel_roja)(gravedad leve))
	( or 	(sintoma(nombre fiebre)(gravedad leve))
		(sintoma(nombre fiebre)(gravedad fuerte))
		(sintoma(nombre dolor_cabeza)(gravedad fuerte))
		(sintoma(nombre malestar)(gravedad leve))		
	)
	(test(< ?edad 13))
=>
	(assert(varicela))
	(printout t "Enfermedad diagnosticada: Varicela." crlf)
)

(defrule regla_3
	(paciente(edad ?edad))
	( or 	(sintoma(nombre fiebre)(gravedad leve))
		(sintoma(nombre fiebre)(gravedad fuerte))
	)
	(sintoma(nombre piel_granosa)(gravedad fuerte))
	(test(< ?edad 5))
=>
	(assert(sarampion))
	(printout t "Enfermedad diagnosticada: Sarampion." crlf)	
)

(defrule regla_4
	(paciente(edad ?edad))
	( or 	(sintoma(nombre fiebre)(gravedad leve))
		(sintoma(nombre fiebre)(gravedad fuerte))
	)	
	(sintoma(nombre piel_granosa)(gravedad fuerte))
	( or	(sintoma(nombre tos)(gravedad fuerte))
		(sintoma(nombre diarrea)(gravedad leve))
		(sintoma(nombre inmunosupresion)(gravedad fuerte))
	)
	
	(test(< ?edad 5))
=>
	(assert(sarampion))
	(printout t "Enfermedad diagnosticada: Sarampion." crlf)	
)


(defrule regla_5
	(paciente(edad ?edad))
	( or 	(sintoma(nombre fiebre)(gravedad leve))
		(sintoma(nombre fiebre)(gravedad fuerte))
	)
	(sintoma(nombre molestia_respirar)(gravedad leve))
	(sintoma(nombre jadeos)(gravedad leve))
	(test(< ?edad 13))
=>
	(assert(bronquiolitis))
	(printout t "Enfermedad diagnosticada: Bronquiolitis." crlf)
)

(defrule regla_6
	(paciente(edad ?edad))
	( or 	(sintoma(nombre fiebre)(gravedad leve))
		(sintoma(nombre fiebre)(gravedad fuerte))
	)
	(sintoma(nombre molestia_respirar)(gravedad leve))
	(sintoma(nombre jadeos)(gravedad leve))
	(sintoma(nombre insuficiencia_respiratoria)(gravedad fuerte))
	(test(< ?edad 13))
=>
	(assert(bronquiolitis))
	(printout t "Enfermedad diagnosticada: Bronquiolitis." crlf)
)

(defrule regla_7
	(paciente(edad ?edad))
	( or 	(sintoma(nombre fiebre)(gravedad leve))
		(sintoma(nombre fiebre)(gravedad fuerte))
	)
	(sintoma(nombre tos)(gravedad fuerte))
	(sintoma(nombre amigdalas_hinchadas)(gravedad fuerte))
	(test(< ?edad 13))
=>
	(assert(faringoamigdalitis))
	(printout t "Enfermedad diagnosticada: Faringoamidgalitis." crlf)
)

(defrule regla_8
	(paciente(edad ?edad))
	( or 	(sintoma(nombre fiebre)(gravedad leve))
		(sintoma(nombre fiebre)(gravedad fuerte))
	)
	(sintoma(nombre tos)(gravedad fuerte))
	(sintoma(nombre amigdalas_hinchadas)(gravedad fuerte))
	( or	(sintoma(nombre amigdalas_rojas)(gravedad fuerte))
		(sintoma(nombre malestar)(gravedad leve))
	)
	(test(< ?edad 13))
=>
	(assert(faringoamigdalitis))
	(printout t "Enfermedad diagnosticada: Faringoamidgalitis." crlf)
)

(defrule regla_9
	(paciente(edad ?edad))
	(sintoma(nombre fatiga)(gravedad fuerte))
	(sintoma(nombre ganglios_inflamados)(gravedad fuerte))
	(sintoma(nombre dolor_garganta)(gravedad fuerte))
	(test(< ?edad 13))
=>
	(assert(mononucleosis))
	(printout t "Enfermedad diagnosticada: Mononucleosis" crlf)
)

(defrule regla_10
	(paciente(edad ?edad))
	(sintoma(nombre fatiga)(gravedad fuerte))
	(sintoma(nombre ganglios_inflamados)(gravedad fuerte))
	(sintoma(nombre dolor_garganta)(gravedad fuerte))
	(sintoma(nombre dolor_cabeza)(gravedad fuerte))
	(test(< ?edad 13))
=>
	(assert(mononucleosis))
	(printout t "Enfermedad diagnosticada: Mononucleosis" crlf)
)

(defrule regla_11
	(paciente(edad ?edad))
	(sintoma(nombre problemas_cardiacos)(gravedad fuerte))
	(sintoma(nombre labios_secos)(gravedad fuerte))
	(sintoma(nombre labios_rojos)(gravedad fuerte))
	(test(< ?edad 5))
=>
	(assert(enfermedad_kawasaki))
	(printout t "Enfermedad diagnosticada: Enfermedad de kawasaki" crlf)
)

(defrule regla_12
	(paciente(edad ?edad))
	(sintoma(nombre problemas_cardiacos)(gravedad fuerte))
	(sintoma(nombre labios_secos)(gravedad fuerte))
	(sintoma(nombre labios_rojos)(gravedad fuerte))
	( or 	(sintoma(nombre fiebre)(gravedad leve))
		(sintoma(nombre fiebre)(gravedad fuerte))
		(sintoma(nombre piel_roja)(gravedad fuerte))
	)
	(test(< ?edad 5))
=>
	(assert(enfermedad_kawasaki))
	(printout t "Enfermedad diagnosticada: Enfermedad de kawasaki" crlf)
)

(defrule regla_13
	(paciente(edad ?edad))
	(sintoma(nombre piel_roja)(gravedad fuerte))
	(sintoma(nombre piel_granosa)(gravedad fuerte))
	(sintoma(nombre fiebre)(gravedad fuerte))
	(test(< ?edad 13))
	(test(> ?edad 2))
=>
	(assert(escarlatina))
	(printout t "Enfermedad diagnosticada: Escarlatina" crlf)
)

(defrule regla_14
	(paciente(edad ?edad))
	(sintoma(nombre tos)(gravedad fuerte))
	(sintoma(nombre vomitos)(gravedad leve))
	(sintoma(nombre problemas_pulmonares)(gravedad fuerte))
	(test(< ?edad 3))
=>
	(assert(tos_ferina))
	(printout t "Enfermedad diagnosticada: Tos ferina" crlf)
)

(defrule regla_15
	(paciente(edad ?edad))
	(sintoma(nombre tos)(gravedad fuerte))
	(sintoma(nombre vomitos)(gravedad leve))
	(sintoma(nombre problemas_pulmonares)(gravedad fuerte))
	(sintoma(nombre diarrea)(gravedad leve))
	(test(< ?edad 3))
=>
	(assert(tos_ferina))
	(printout t "Enfermedad diagnosticada: Tos ferina" crlf)
)

(defrule regla_16
	(paciente(edad ?edad))
	( or 	(sintoma(nombre fiebre)(gravedad leve))
		(sintoma(nombre fiebre)(gravedad fuerte))
	)
	(sintoma(nombre dolor_cabeza)(gravedad fuerte))
	(test(< ?edad 13))
=>
	(assert(gripe))
	(printout t "Enfermedad diagnosticada: Gripe" crlf)
)

(defrule regla_17
	(paciente(edad ?edad))
	( or 	(sintoma(nombre fiebre)(gravedad leve))
		(sintoma(nombre fiebre)(gravedad fuerte))
	)
	(sintoma(nombre dolor_cabeza)(gravedad fuerte))
	( or 	(sintoma(nombre mareos)(gravedad leve)))
		(sintoma(nombre debilidad_muscular)(gravedad fuerte))
		(sintoma(nombre inmunosupresion)(gravedad fuerte))
	)
	(test(< ?edad 13))
=>
	(assert(gripe))
	(printout t "Enfermedad diagnosticada: Gripe" crlf)
)

(defrule regla_18
	(paciente(edad ?edad))
	(sintoma(nombre picor_ano)(gravedad leve))
	(sintoma(nombre insonmio)(gravedad leve))
	(test(< ?edad 13))
=>
	(assert(enterobiasis))
	(printout t "Enfermedad diagnosticada: Lombrices" crlf)
)

(defrule regla_19
	(paciente(edad ?edad))
	(sintoma(nombre picor_ano)(gravedad leve))
	(sintoma(nombre insonmio)(gravedad leve))
	(sintoma(nombre fatiga)(gravedad leve))
	(test(< ?edad 13))
=>
	(assert(enterobiasis))
	(printout t "Enfermedad diagnosticada: Enterobiasis" crlf)
)

(defrule regla_20
	(paciente(edad ?edad))
	(sintoma(nombre diarrea)(gravedad fuerte))
	(sintoma(nombre vomitos)(gravedad fuerte))
	(test(< ?edad 13))
=>
	(assert(gastroenteritis))
	(printout t "Enfermedad diagnosticada: Gastroenteritis" crlf)
)

;; ----- REGLAS PARA RECETAR UN TRATAMIENTO -----

(defrule regla_23
	(paciente(patologia ~alergia_lactosa))
	(varicela)
=>
	(assert(aciclovir))
	(assert(hidratacion))
	(printout t "Tratamiento: Aciclovir e hidratacion." crlf)
)

(defrule regla_24
	(paciente(patologia alergia_lactosa))
	(varicela)
=>
	(assert(hidratacion))
	(printout t "Tratamiento: Hidratacion." crlf)
)

(defrule regla_25
	(sarampion)
=>
	(assert(ibuprofeno))
	(assert(reposo))
	(printout t "Tratamiento: Ibuprofeno y reposo." crlf)
)

(defrule regla_26
	(paciente(patologia ~danos_hepaticos))
	(bronquiolitis)
=>
	(assert(paracetamol))
	(assert(reposo))
	(assert(ambiente_humedo))
	(printout t "Tratamiento: Paracetamol, reposo y humedecer ambiente." crlf)
)

(defrule regla_27
	(paciente(patologia danos_hepaticos))
	(bronquiolitis)
=>
	(assert(reposo))
	(assert(ambiente_humedo))
	(printout t "Tratamiento: Reposo y humedecer ambiente." crlf)
)

(defrule regla_28
	(faringoamigdalitis)
=>
	(assert(penicilina))
	(assert(hidratacion))
	(printout t "Tratamiento: Penicilina e hidratacion." crlf)
)

(defrule regla_29
	(paciente(patologia ~danos_hepaticos))
	(mononucleosis)
=>
	(assert(paracetamol))
	(assert(hospitalizacion))
	(printout t "Tratamiento: Paracetamol y hospitalizacion inmediata." crlf)
)

(defrule regla_30
	(paciente(patologia danos_hepaticos))
	(mononucleosis)
=>
	(assert(hospitalizacion))
	(printout t "Tratamiento: Hospitalización inmediata." crlf)
)

(defrule regla_31
	(paciente(patologia ~problemas_cardiacos))
	(enfermedad_kawasaki)
=>
	(assert(hospitalizacion))
	(assert(acido_acetilsalicilico))
	(printout t "Tratamiento: Hospitalización inmediata y acido acetilsalicilico." crlf)
)

(defrule regla_32
	(paciente(patologia problemas_cardiacos))
	(enfermedad_kawasaki)
=>
	(assert(hospitalizacion))
	(printout t "Tratamiento: Hospitalización inmediata." crlf)
)

(defrule regla_33
	(paciente(patologia ~diabetes))
	(escarlatina)
=>
	(assert(amoxicilina))
	(assert(reposo))
	(printout t "Tratamiento: Amoxicilina y reposo." crlf)
)

(defrule regla_34
	(paciente(patologia diabetes))
	(escarlatina)
=>
	(assert(reposo))
	(printout t "Tratamiento: Reposo." crlf)
)

(defrule regla_35
	(tos_ferina)
=>
	(assert(claritromicina))
	(assert(alimentacion_adecuada))
	(assert(reposo))
	(printout t "Tratamiento: Claritromicina, alimentacion adecuada y reposo." crlf)
)

(defrule regla_36
	(paciente(patologia ~danos_hepaticos))
	(gripe)
=>
	(assert(paracetamol))
	(assert(hidratacion))
	(assert(reposo))
	(printout t "Tratamiento: Paracetamol, hidratacion y reposo." crlf)
)

(defrule regla_37
	(paciente(patologia danos_hepaticos))
	(gripe)
=>
	(assert(hidratacion))
	(assert(reposo))
	(printout t "Tratamiento: Hidratacion y reposo." crlf)
)

(defrule regla_38
	(paciente(patologia ~asma))
	(lombrices)
=>
	(assert(hidratacion))
	(assert(mebendazol))
	(printout t "Tratamiento: Hidratacion y mebendazol." crlf)
)

(defrule regla_39
	(paciente(patologia asma))
	(enterobiasis)
=>
	(assert(hidratacion))
	(printout t "Tratamiento: Hidratacion." crlf)
)

(defrule regla_40
	(paciente(patologia ~problemas_cardiacos))
	(gastroenteritis)
=>
	(assert(poleramida))
	(assert(hidratacion))
	(printout t "Tratamiento: Hidratacion y poleramida." crlf)
)

(defrule regla_41
	(paciente(patologia problemas_cardiacos))
	(gastroenteritis)
=>
	(assert(hidratacion))
	(printout t "Tratamiento: Hidratacion." crlf)
)
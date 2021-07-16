import sys
import os
import clips #Clipspy

from PyQt5 import uic
from PyQt5.QtWidgets import QMainWindow, QApplication, QMessageBox, QDialog
from PyQt5 import QtCore

class pedinf(QMainWindow):

    def __init__(self):
        super().__init__()
        ui_path = os.path.dirname(os.path.abspath(__file__)) # Conseguimos el directorio actual de este archivo .py        
        self.setWindowFlags(QtCore.Qt.WindowMinimizeButtonHint | QtCore.Qt.WindowCloseButtonHint) 
        uic.loadUi(ui_path + "\\Presentacion\\pedinf_main.ui", self)  # Como el archivo .ui está en el mismo directorio, podemos acceder a él así.
        self.setFixedSize(711,665)
        self.cbx_edad.addItems(["0","1","2","3","4","5","6","7","8","9","10","11","12","13"])
        self.btn_diagnostico.clicked.connect(self.preparar_diagnostico)
        self.btn_diagnostico.clicked.connect(self.diagnostico)
        self.btn_limpiar.clicked.connect(self.limpiar_campos)
        self.btn_ayuda.clicked.connect(self.abrir_ayuda)

        checkbox = [self.cb_alergia, self.cb_asma, self.cb_corazon, self.cb_diabetes, self.cb_hepaticos, self.cb_g1, self.cb_g2, self.cb_g3, self.cb_g4, self.cb_g5,
                    self.cb_g6, self.cb_g7, self.cb_g8, self.cb_g9, self.cb_g10, self.cb_g11, self.cb_g12, self.cb_g13, self.cb_g14, self.cb_g15, self.cb_g16, self.cb_g17,
                    self.cb_g18, self.cb_g19, self.cb_g20, self.cb_g21, self.cb_g22, self.cb_g23, self.cb_g24, self.cb_g25, self.cb_g26, self.cb_g27, self.cb_g28, self.cb_g29, 
                    self.cb_g30, self.cb_l1, self.cb_l2, self.cb_l3, self.cb_l4, self.cb_l5, self.cb_l6, self.cb_l7, self.cb_l8, self.cb_l9, self.cb_l10, self.cb_l11, self.cb_l12,           
                    self.cb_l13, self.cb_l14, self.cb_l15, self.cb_l16, self.cb_l17, self.cb_l18, self.cb_l19, self.cb_l20, self.cb_l21, self.cb_l22, self.cb_l23, self.cb_l24,
                    self.cb_l25, self.cb_l26, self.cb_l27, self.cb_l28, self.cb_l29, self.cb_l30]

        for i in checkbox:
            i.stateChanged.connect(self.uncheck)

    def diagnostico(self):

        campos = self.comprobar_campos() # Comprobar si los campos son correctos.

        if campos == False: # Si no son correctos, mostramos un error y vaciamos los campos.
            msg = QMessageBox()
            msg.setIcon(QMessageBox.Critical)
            msg.setText("Error en los campos")
            msg.setInformativeText("Algún campo obligatorio está vacío o su contenido no es correcto. Inténtelo de nuevo.")
            msg.setWindowTitle("PedInf: Error")
            msg.exec_()
            self.limpiar_campos()
        else: # Si son correctos, se inicia el proceso de diágnostico.
            ############# PATOLOGÍAS ###############
            patologia_cb = "ninguna"
            if self.cb_corazon.isChecked() == True: patologia_cb = "problemas_cardiacos"
            if self.cb_hepaticos.isChecked() == True: patologia_cb = "danos_hepaticos"
            if self.cb_asma.isChecked() == True: patologia_cb = "asma"
            if self.cb_diabetes.isChecked() == True: patologia_cb = "diabetes"
            if self.cb_alergia.isChecked() == True: patologia_cb = "alergia_lactosa"
            ########################################      
            
            print('Creando diagnóstico')

            env = clips.Environment()

            template_string_1 = """
                (deftemplate paciente
                    (slot nombre (type STRING))
                    (slot edad (type INTEGER))
                    (slot patologia (type STRING))
                )
                """
            template_string_2 = """
                (deftemplate sintoma
                    (slot nombre_sintoma (type STRING))
                    (slot gravedad (type STRING)))
                """

            env.build(template_string_1)
            env.build(template_string_2)
            template_1 = env.find_template('paciente')
            template_2 = env.find_template('sintoma')

            # Añadir el primer hecho, referente a los datos del paciente.
            fact1 = template_1.assert_fact(nombre = self.le_nombre.text(), edad = int(self.cbx_edad.currentText()), patologia = patologia_cb)

            ui_path = os.path.dirname(os.path.abspath(__file__)) # Conseguimos el directorio actual de este archivo .py  
            env.load(ui_path + '\\BaseConocimientoClipspy.clp') ## Cargando reglas.

            ################### SINTOMAS ###################
            # Ahora añadimos los hechos correspondientes a los síntomas que presenta el paciente.
            if self.cb_g1.isChecked(): template_2.assert_fact(nombre_sintoma = 'picores', gravedad = 'fuerte')
            if self.cb_l1.isChecked(): template_2.assert_fact(nombre_sintoma = 'picores', gravedad = 'leve')
            if self.cb_g2.isChecked(): template_2.assert_fact(nombre_sintoma = 'piel_granosa', gravedad = 'fuerte')
            if self.cb_l2.isChecked(): template_2.assert_fact(nombre_sintoma = 'piel_granosa', gravedad = 'leve')
            if self.cb_g3.isChecked(): template_2.assert_fact(nombre_sintoma = 'piel_roja', gravedad = 'fuerte')
            if self.cb_l3.isChecked(): template_2.assert_fact(nombre_sintoma = 'piel_roja', gravedad = 'leve')
            if self.cb_g4.isChecked(): template_2.assert_fact(nombre_sintoma = 'fiebre', gravedad = 'fuerte')
            if self.cb_l4.isChecked(): template_2.assert_fact(nombre_sintoma = 'fiebre', gravedad = 'leve')
            if self.cb_g5.isChecked(): template_2.assert_fact(nombre_sintoma = 'dolor_cabeza', gravedad = 'fuerte')
            if self.cb_l5.isChecked(): template_2.assert_fact(nombre_sintoma = 'dolor_cabeza', gravedad = 'leve')
            if self.cb_g6.isChecked(): template_2.assert_fact(nombre_sintoma = 'malestar', gravedad = 'fuerte')
            if self.cb_l6.isChecked(): template_2.assert_fact(nombre_sintoma = 'malestar', gravedad = 'leve')
            if self.cb_g7.isChecked(): template_2.assert_fact(nombre_sintoma = 'molestia_respirar', gravedad = 'fuerte')
            if self.cb_l7.isChecked(): template_2.assert_fact(nombre_sintoma = 'molestia_respirar', gravedad = 'leve')
            if self.cb_g8.isChecked(): template_2.assert_fact(nombre_sintoma = 'jadeos', gravedad = 'fuerte')
            if self.cb_l8.isChecked(): template_2.assert_fact(nombre_sintoma = 'jadeos', gravedad = 'leve')
            if self.cb_g9.isChecked(): template_2.assert_fact(nombre_sintoma = 'insuficiencia_respiratoria', gravedad = 'fuerte')
            if self.cb_l9.isChecked(): template_2.assert_fact(nombre_sintoma = 'insuficiencia_respiratoria', gravedad = 'leve')
            if self.cb_g10.isChecked(): template_2.assert_fact(nombre_sintoma = 'tos', gravedad = 'fuerte')
            if self.cb_l10.isChecked(): template_2.assert_fact(nombre_sintoma = 'tos', gravedad = 'leve')
            if self.cb_g11.isChecked(): template_2.assert_fact(nombre_sintoma = 'amigdalas_hinchadas', gravedad = 'fuerte')
            if self.cb_l11.isChecked(): template_2.assert_fact(nombre_sintoma = 'amigdalas_hinchadas', gravedad = 'leve')
            if self.cb_g12.isChecked(): template_2.assert_fact(nombre_sintoma = 'fatiga', gravedad = 'fuerte')
            if self.cb_l12.isChecked(): template_2.assert_fact(nombre_sintoma = 'fatiga', gravedad = 'leve')
            if self.cb_g13.isChecked(): template_2.assert_fact(nombre_sintoma = 'ganglios_inflamados', gravedad = 'fuerte')
            if self.cb_l13.isChecked(): template_2.assert_fact(nombre_sintoma = 'ganglios_inflamados', gravedad = 'leve')
            if self.cb_g14.isChecked(): template_2.assert_fact(nombre_sintoma = 'dolor_garganta', gravedad = 'fuerte')
            if self.cb_l14.isChecked(): template_2.assert_fact(nombre_sintoma = 'dolor_garganta', gravedad = 'leve')
            if self.cb_g15.isChecked(): template_2.assert_fact(nombre_sintoma = 'problemas_cardiacos', gravedad = 'fuerte')
            if self.cb_l15.isChecked(): template_2.assert_fact(nombre_sintoma = 'problemas_cardiacos', gravedad = 'leve')
            if self.cb_g16.isChecked(): template_2.assert_fact(nombre_sintoma = 'labios_secos', gravedad = 'fuerte')
            if self.cb_l16.isChecked(): template_2.assert_fact(nombre_sintoma = 'labios_secos', gravedad = 'leve')
            if self.cb_g17.isChecked(): template_2.assert_fact(nombre_sintoma = 'labios_rojos', gravedad = 'fuerte')
            if self.cb_l17.isChecked(): template_2.assert_fact(nombre_sintoma = 'labios_rojos', gravedad = 'leve')
            if self.cb_g18.isChecked(): template_2.assert_fact(nombre_sintoma = 'vomitos', gravedad = 'fuerte')
            if self.cb_l18.isChecked(): template_2.assert_fact(nombre_sintoma = 'vomitos', gravedad = 'leve')
            if self.cb_g19.isChecked(): template_2.assert_fact(nombre_sintoma = 'diarrea', gravedad = 'fuerte')
            if self.cb_l19.isChecked(): template_2.assert_fact(nombre_sintoma = 'diarrea', gravedad = 'leve')
            if self.cb_g20.isChecked(): template_2.assert_fact(nombre_sintoma = 'problemas_pulmonares', gravedad = 'fuerte')
            if self.cb_l20.isChecked(): template_2.assert_fact(nombre_sintoma = 'problemas_pulmonares', gravedad = 'leve')
            if self.cb_g21.isChecked(): template_2.assert_fact(nombre_sintoma = 'picor_ano', gravedad = 'fuerte')
            if self.cb_l21.isChecked(): template_2.assert_fact(nombre_sintoma = 'picor_ano', gravedad = 'leve')
            if self.cb_g22.isChecked(): template_2.assert_fact(nombre_sintoma = 'insonmio', gravedad = 'fuerte')
            if self.cb_l22.isChecked(): template_2.assert_fact(nombre_sintoma = 'insonmio', gravedad = 'leve')
            if self.cb_g23.isChecked(): template_2.assert_fact(nombre_sintoma = 'llaga_roja_nariz', gravedad = 'fuerte')
            if self.cb_l23.isChecked(): template_2.assert_fact(nombre_sintoma = 'llaga_roja_nariz', gravedad = 'leve')
            if self.cb_g24.isChecked(): template_2.assert_fact(nombre_sintoma = 'indigestion', gravedad = 'fuerte')
            if self.cb_l24.isChecked(): template_2.assert_fact(nombre_sintoma = 'indigestion', gravedad = 'leve')
            if self.cb_g25.isChecked(): template_2.assert_fact(nombre_sintoma = 'picazon_interna', gravedad = 'fuerte')
            if self.cb_l25.isChecked(): template_2.assert_fact(nombre_sintoma = 'picazon_interna', gravedad = 'leve')
            if self.cb_g26.isChecked(): template_2.assert_fact(nombre_sintoma = 'transpiracion', gravedad = 'fuerte')
            if self.cb_l26.isChecked(): template_2.assert_fact(nombre_sintoma = 'transpiracion', gravedad = 'leve')
            if self.cb_g27.isChecked(): template_2.assert_fact(nombre_sintoma = 'nauseas', gravedad = 'fuerte')
            if self.cb_l27.isChecked(): template_2.assert_fact(nombre_sintoma = 'nauseas', gravedad = 'leve')
            if self.cb_g28.isChecked(): template_2.assert_fact(nombre_sintoma = 'perdida_apetito', gravedad = 'fuerte')
            if self.cb_l28.isChecked(): template_2.assert_fact(nombre_sintoma = 'perdida_apetito', gravedad = 'leve')
            if self.cb_g29.isChecked(): template_2.assert_fact(nombre_sintoma = 'irritabilidad', gravedad = 'fuerte')
            if self.cb_l29.isChecked(): template_2.assert_fact(nombre_sintoma = 'irritabilidad', gravedad = 'leve')
            if self.cb_g30.isChecked(): template_2.assert_fact(nombre_sintoma = 'inmunosupresion', gravedad = 'fuerte')
            if self.cb_l30.isChecked(): template_2.assert_fact(nombre_sintoma = 'inmunosupresion', gravedad = 'leve')
            ################################################

            print('Facts')
            for fact in env.facts():
                print(fact)
        
            print('Diagnostico')
            env.run()
            self.lbl_alerta.setText("Diagnóstico creado. Consúltalo en el archivo diagnóstico.txt")
        
    def limpiar_campos(self):
        self.le_nombre.setText("")
        self.cbx_edad.setCurrentIndex(0)
        self.lbl_alerta.setText("")

        # Definimos una lista con todos los checkbox, para iterarla posteriormente.
        checkbox = [self.cb_alergia, self.cb_asma, self.cb_corazon, self.cb_diabetes, self.cb_hepaticos, self.cb_g1, self.cb_g2, self.cb_g3, self.cb_g4, self.cb_g5,
                    self.cb_g6, self.cb_g7, self.cb_g8, self.cb_g9, self.cb_g10, self.cb_g11, self.cb_g12, self.cb_g13, self.cb_g14, self.cb_g15, self.cb_g16, self.cb_g17,
                    self.cb_g18, self.cb_g19, self.cb_g20, self.cb_g21, self.cb_g22, self.cb_g23, self.cb_g24, self.cb_g25, self.cb_g26, self.cb_g27, self.cb_g28, self.cb_g29, 
                    self.cb_g30, self.cb_l1, self.cb_l2, self.cb_l3, self.cb_l4, self.cb_l5, self.cb_l6, self.cb_l7, self.cb_l8, self.cb_l9, self.cb_l10, self.cb_l11, self.cb_l12,           
                    self.cb_l13, self.cb_l14, self.cb_l15, self.cb_l16, self.cb_l17, self.cb_l18, self.cb_l19, self.cb_l20, self.cb_l21, self.cb_l22, self.cb_l23, self.cb_l24,
                    self.cb_l25, self.cb_l26, self.cb_l27, self.cb_l28, self.cb_l29, self.cb_l30]
        
        for i in checkbox:
            i.setChecked(False)

    def comprobar_campos(self):
        campos = True
        if not self.le_nombre.text(): campos = False

        return campos

    def uncheck(self, state):
  
        if state == QtCore.Qt.Checked:
            if self.sender() == self.cb_alergia:
                self.cb_asma.setChecked(False)
                self.cb_corazon.setChecked(False)
                self.cb_diabetes.setChecked(False)
                self.cb_hepaticos.setChecked(False)

            if self.sender() == self.cb_asma:
                self.cb_alergia.setChecked(False)
                self.cb_corazon.setChecked(False)
                self.cb_diabetes.setChecked(False)
                self.cb_hepaticos.setChecked(False)

            if self.sender() == self.cb_corazon:
                self.cb_asma.setChecked(False)
                self.cb_alergia.setChecked(False)
                self.cb_diabetes.setChecked(False)
                self.cb_hepaticos.setChecked(False)

            if self.sender() == self.cb_diabetes:
                self.cb_asma.setChecked(False)
                self.cb_corazon.setChecked(False)
                self.cb_alergia.setChecked(False)
                self.cb_hepaticos.setChecked(False)

            if self.sender() == self.cb_hepaticos:
                self.cb_asma.setChecked(False)
                self.cb_corazon.setChecked(False)
                self.cb_diabetes.setChecked(False)
                self.cb_alergia.setChecked(False)
            
            if self.sender() == self.cb_g1: self.cb_l1.setChecked(False)
            if self.sender() == self.cb_g2: self.cb_l2.setChecked(False)
            if self.sender() == self.cb_g3: self.cb_l3.setChecked(False)
            if self.sender() == self.cb_g4: self.cb_l4.setChecked(False)
            if self.sender() == self.cb_g5: self.cb_l5.setChecked(False)
            if self.sender() == self.cb_g6: self.cb_l6.setChecked(False)
            if self.sender() == self.cb_g7: self.cb_l7.setChecked(False)
            if self.sender() == self.cb_g8: self.cb_l8.setChecked(False)
            if self.sender() == self.cb_g9: self.cb_l9.setChecked(False)
            if self.sender() == self.cb_g10: self.cb_l10.setChecked(False)
            if self.sender() == self.cb_g11: self.cb_l11.setChecked(False)
            if self.sender() == self.cb_g12: self.cb_l12.setChecked(False)
            if self.sender() == self.cb_g13: self.cb_l13.setChecked(False)
            if self.sender() == self.cb_g14: self.cb_l14.setChecked(False)
            if self.sender() == self.cb_g15: self.cb_l15.setChecked(False)
            if self.sender() == self.cb_g16: self.cb_l16.setChecked(False)
            if self.sender() == self.cb_g17: self.cb_l17.setChecked(False)
            if self.sender() == self.cb_g18: self.cb_l18.setChecked(False)
            if self.sender() == self.cb_g19: self.cb_l19.setChecked(False)
            if self.sender() == self.cb_g20: self.cb_l20.setChecked(False)
            if self.sender() == self.cb_g21: self.cb_l21.setChecked(False)
            if self.sender() == self.cb_g22: self.cb_l22.setChecked(False)
            if self.sender() == self.cb_g23: self.cb_l23.setChecked(False)
            if self.sender() == self.cb_g24: self.cb_l24.setChecked(False)
            if self.sender() == self.cb_g25: self.cb_l25.setChecked(False)
            if self.sender() == self.cb_g26: self.cb_l26.setChecked(False)
            if self.sender() == self.cb_g27: self.cb_l27.setChecked(False)
            if self.sender() == self.cb_g28: self.cb_l28.setChecked(False)
            if self.sender() == self.cb_g29: self.cb_l29.setChecked(False)
            if self.sender() == self.cb_g30: self.cb_l30.setChecked(False)

            if self.sender() == self.cb_l1: self.cb_g1.setChecked(False)
            if self.sender() == self.cb_l2: self.cb_g2.setChecked(False)
            if self.sender() == self.cb_l3: self.cb_g3.setChecked(False)
            if self.sender() == self.cb_l4: self.cb_g4.setChecked(False)
            if self.sender() == self.cb_l5: self.cb_g5.setChecked(False)
            if self.sender() == self.cb_l6: self.cb_g6.setChecked(False)
            if self.sender() == self.cb_l7: self.cb_g7.setChecked(False)
            if self.sender() == self.cb_l8: self.cb_g8.setChecked(False)
            if self.sender() == self.cb_l9: self.cb_g9.setChecked(False)
            if self.sender() == self.cb_l10: self.cb_g10.setChecked(False)
            if self.sender() == self.cb_l11: self.cb_g11.setChecked(False)
            if self.sender() == self.cb_l12: self.cb_g12.setChecked(False)
            if self.sender() == self.cb_l13: self.cb_g13.setChecked(False)
            if self.sender() == self.cb_l14: self.cb_g14.setChecked(False)
            if self.sender() == self.cb_l15: self.cb_g15.setChecked(False)
            if self.sender() == self.cb_l16: self.cb_g16.setChecked(False)
            if self.sender() == self.cb_l17: self.cb_g17.setChecked(False)
            if self.sender() == self.cb_l18: self.cb_g18.setChecked(False)
            if self.sender() == self.cb_l19: self.cb_g19.setChecked(False)
            if self.sender() == self.cb_l20: self.cb_g20.setChecked(False)
            if self.sender() == self.cb_l21: self.cb_g21.setChecked(False)
            if self.sender() == self.cb_l22: self.cb_g22.setChecked(False)
            if self.sender() == self.cb_l23: self.cb_g23.setChecked(False)
            if self.sender() == self.cb_l24: self.cb_g24.setChecked(False)
            if self.sender() == self.cb_l25: self.cb_g25.setChecked(False)
            if self.sender() == self.cb_l26: self.cb_g26.setChecked(False)
            if self.sender() == self.cb_l27: self.cb_g27.setChecked(False)
            if self.sender() == self.cb_l28: self.cb_g28.setChecked(False)
            if self.sender() == self.cb_l29: self.cb_g29.setChecked(False)
            if self.sender() == self.cb_l30: self.cb_g30.setChecked(False)

    def preparar_diagnostico(self):

        patologia = "No presenta"
        if self.cb_corazon.isChecked() == True: patologia = "Problemas cardiacos"
        if self.cb_hepaticos.isChecked() == True: patologia = "Daños hepáticos"
        if self.cb_asma.isChecked() == True: patologia = "Asma"
        if self.cb_diabetes.isChecked() == True: patologia = "Diabetes"
        if self.cb_alergia.isChecked() == True: patologia = "Alergia a la lactosa"

        ui_path = os.path.dirname(os.path.abspath(__file__)) # Conseguimos el directorio actual de este archivo .py  
        f = open (ui_path + '\\diagnostico.txt','w') ## Creamos un fichero para escribir el diagnóstico.
        f.write('--- DATOS PACIENTE ---\nNombre: ' + self.le_nombre.text() + '.\nEdad: ' + self.cbx_edad.currentText() + ' años.\nPatología: ' + patologia + '.\n\n--- DIAGNÓSTICO ---\n')
        f.close()

    def abrir_ayuda(self):
        self.ayuda = pedinf_ayuda()
        self.ayuda.exec_()

class pedinf_ayuda(QDialog):
    def __init__(self):
        super().__init__()
        ui_path = os.path.dirname(os.path.abspath(__file__)) # Conseguimos el directorio actual de este archivo .py        
        self.setWindowFlags(QtCore.Qt.WindowMinimizeButtonHint | QtCore.Qt.WindowCloseButtonHint) 
        uic.loadUi(ui_path + "\\Presentacion\\pedinf_help.ui", self)  # Como el archivo .ui está en el mismo directorio, podemos acceder a él así.
        self.setFixedSize(485,855)

if __name__ == '__main__':
    app = QApplication(sys.argv)
    GUI = pedinf()
    GUI.show()
    sys.exit(app.exec_())
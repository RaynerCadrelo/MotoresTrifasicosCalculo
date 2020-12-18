import QtQuick 2.9
import QtQuick.Controls 2.2

ApplicationWindow {
    id: ventanaPrincipal
    visible: true
    width: 640
    height: 480
    title: qsTr("Cálculo Motores Trifásicos")
    property int margen: 150
    property int letra: 15
    property int ancho: 130

    ScrollView {
        anchors.fill: parent
        ScrollBar.horizontal.policy: ScrollBar.AlwaysOff
        ScrollBar.horizontal.interactive: false
        clip: true

        Column {
            id: column
            topPadding: 12
            leftPadding: 7
            anchors.fill: parent
            spacing: 7

            Row{
                Text {
                    text: qsTr("Largo Estator: ")
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: letra
                    width: margen
                }
                TextField {
                    id: textoLargoEstator
                    text: qsTr("")
                    width: ancho
                    inputMethodHints: Qt.ImhFormattedNumbersOnly
                }
                Text {
                    text: qsTr(" cm")
                    anchors.verticalCenter: parent.verticalCenter
                }
            }

            Row{
                Text {
                    text: qsTr("Diámetro Estator: ")
                    width: margen
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: letra
                }
                TextField {
                    id: textoDiametroEstator
                    text: qsTr("")
                    width: ancho
                    inputMethodHints: Qt.ImhFormattedNumbersOnly
                }
                Text {
                    text: qsTr(" cm")
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
            Row{
                Text {
                    text: qsTr("Cantidad de Ranuras: ")
                    font.pixelSize: letra
                    width: margen
                    anchors.verticalCenter: parent.verticalCenter
                }
                ComboBox {
                    id: comboBoxCantidadRanuras
                    width: ancho
                    model: ListModel {
                              id: modeloCantidadRanuras
                              ListElement { text: "12" }
                              ListElement { text: "18" }
                              ListElement { text: "24" }
                              ListElement { text: "30" }
                              ListElement { text: "36" }
                              ListElement { text: "48" }
                              ListElement { text: "54" }
                              ListElement { text: "60" }
                              ListElement { text: "72" }
                              ListElement { text: "90" }
                              ListElement { text: "96" }
                          }
                    onCurrentTextChanged: {
                        modeloNumeroPolos.clear()
                        if(currentText=="12" || currentText=="18" || currentText=="24" || currentText=="30" || currentText=="36" || currentText=="48")
                            modeloNumeroPolos.append({"key": "2 polos", "value": 2})
                        if(currentText=="24" || currentText=="36" || currentText=="48" || currentText=="60" || currentText=="72" || currentText=="96")
                            modeloNumeroPolos.append({"key": "4 polos", "value": 4})
                        if(currentText=="36" || currentText=="54" || currentText=="72" || currentText=="90")
                            modeloNumeroPolos.append({"key": "6 polos", "value": 6})
                        if(currentText=="48" || currentText=="72" || currentText=="96")
                            modeloNumeroPolos.append({"key": "8 polos", "value": 8})
                        comboBoxNumeroPolos.currentIndex=0
                        //
                        pasoMedio()
                    }
                    function pasoMedio(){
                        modeloPasoMedio.clear()
                        if((comboBoxNumeroPolos.currentText=="2 polos" && currentText=="12") || (comboBoxNumeroPolos.currentText=="4 polos" && currentText=="24") || (comboBoxNumeroPolos.currentText=="6 polos" && currentText=="36") || (comboBoxNumeroPolos.currentText=="8 polos" && currentText=="48")){
                            modeloPasoMedio.append({"text": "1:7"})
                            modeloPasoMedio.append({"text": "1:6"})
                            modeloPasoMedio.append({"text": "1:5"})
                            modeloPasoMedio.append({"text": "1:4"})
                        }
                        if((comboBoxNumeroPolos.currentText=="2 polos" && currentText=="18") || (comboBoxNumeroPolos.currentText=="4 polos" && currentText=="36") || (comboBoxNumeroPolos.currentText=="6 polos" && currentText=="54") || (comboBoxNumeroPolos.currentText=="8 polos" && currentText=="72")){
                            modeloPasoMedio.append({"text": "1:10"})
                            modeloPasoMedio.append({"text": "1:9"})
                            modeloPasoMedio.append({"text": "1:8"})
                            modeloPasoMedio.append({"text": "1:7"})
                            modeloPasoMedio.append({"text": "1:6"})
                        }
                        if((comboBoxNumeroPolos.currentText=="2 polos" && currentText=="24") || (comboBoxNumeroPolos.currentText=="4 polos" && currentText=="48") || (comboBoxNumeroPolos.currentText=="6 polos" && currentText=="72") || (comboBoxNumeroPolos.currentText=="8 polos" && currentText=="96")){
                            modeloPasoMedio.append({"text": "1:13"})
                            modeloPasoMedio.append({"text": "1:12"})
                            modeloPasoMedio.append({"text": "1:11"})
                            modeloPasoMedio.append({"text": "1:10"})
                            modeloPasoMedio.append({"text": "1:9"})
                            modeloPasoMedio.append({"text": "1:8"})
                            modeloPasoMedio.append({"text": "1:7"})
                        }
                        if((comboBoxNumeroPolos.currentText=="2 polos" && currentText=="30") || (comboBoxNumeroPolos.currentText=="4 polos" && currentText=="60") || (comboBoxNumeroPolos.currentText=="6 polos" && currentText=="90")){
                            modeloPasoMedio.append({"text": "1:16"})
                            modeloPasoMedio.append({"text": "1:15"})
                            modeloPasoMedio.append({"text": "1:14"})
                            modeloPasoMedio.append({"text": "1:13"})
                            modeloPasoMedio.append({"text": "1:12"})
                            modeloPasoMedio.append({"text": "1:11"})
                            modeloPasoMedio.append({"text": "1:10"})
                            modeloPasoMedio.append({"text": "1:9"})
                        }
                        if((comboBoxNumeroPolos.currentText=="2 polos" && currentText=="36") || (comboBoxNumeroPolos.currentText=="4 polos" && currentText=="72")){
                            modeloPasoMedio.append({"text": "1:19"})
                            modeloPasoMedio.append({"text": "1:18"})
                            modeloPasoMedio.append({"text": "1:17"})
                            modeloPasoMedio.append({"text": "1:16"})
                            modeloPasoMedio.append({"text": "1:15"})
                            modeloPasoMedio.append({"text": "1:14"})
                            modeloPasoMedio.append({"text": "1:13"})
                            modeloPasoMedio.append({"text": "1:12"})
                            modeloPasoMedio.append({"text": "1:11"})
                        }
                        if((comboBoxNumeroPolos.currentText=="2 polos" && currentText=="48") || (comboBoxNumeroPolos.currentText=="4 polos" && currentText=="96")){
                            modeloPasoMedio.append({"text": "1:25"})
                            modeloPasoMedio.append({"text": "1:24"})
                            modeloPasoMedio.append({"text": "1:23"})
                            modeloPasoMedio.append({"text": "1:22"})
                            modeloPasoMedio.append({"text": "1:21"})
                            modeloPasoMedio.append({"text": "1:20"})
                            modeloPasoMedio.append({"text": "1:19"})
                            modeloPasoMedio.append({"text": "1:18"})
                            modeloPasoMedio.append({"text": "1:17"})
                            modeloPasoMedio.append({"text": "1:16"})
                            modeloPasoMedio.append({"text": "1:15"})
                            modeloPasoMedio.append({"text": "1:14"})
                        }
                        comboBoxPasoMedio.currentIndex=0
                    }
                }
                Text {
                    text: qsTr(" ranuras")
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
            Row{
                Text {
                    text: qsTr("Número de polos: ")
                    font.pixelSize: letra
                    width: margen
                    anchors.verticalCenter: parent.verticalCenter

                }
                ComboBox {
                    id: comboBoxNumeroPolos
                    textRole: "key"
                    width: ancho
                    model: ListModel {
                              id: modeloNumeroPolos
                              ListElement { key: "2 polos"; value: 2 }
                          }
                    onCurrentTextChanged: comboBoxCantidadRanuras.pasoMedio()
                }
            }

            Row{
                Text {
                    text: qsTr("Paso Medio: ")
                    font.pixelSize: letra
                    width: margen
                    anchors.verticalCenter: parent.verticalCenter
                }
                ComboBox {
                    id: comboBoxPasoMedio
                    width: ancho
                    model: ListModel {
                              id: modeloPasoMedio
                              ListElement { text: "1:4" }
                              ListElement { text: "1:5" }
                              ListElement { text: "1:6" }
                              ListElement { text: "1:7" }
                              ListElement { text: "1:8" }
                              ListElement { text: "1:9" }

                              ListElement { text: "1:10" }
                              ListElement { text: "1:11" }
                              ListElement { text: "1:12" }
                              ListElement { text: "1:13" }
                              ListElement { text: "1:14" }
                              ListElement { text: "1:15" }

                              ListElement { text: "1:16" }
                              ListElement { text: "1:17" }
                              ListElement { text: "1:18" }
                              ListElement { text: "1:19" }
                              ListElement { text: "1:20" }
                              ListElement { text: "1:21" }
                              ListElement { text: "1:22" }
                              ListElement { text: "1:23" }
                              ListElement { text: "1:24" }
                              ListElement { text: "1:25" }
                          }
                }
            }

            Row{
                Text {
                    text: qsTr("Tensión: ")
                    font.pixelSize: letra
                    width: margen
                    anchors.verticalCenter: parent.verticalCenter
                }
                ComboBox {
                    id: comboBoxVoltajes
                    width: ancho
                    model: ListModel {
                              id: modeloVoltajes
                              ListElement { text: "208" }
                              ListElement { text: "220" }
                              ListElement { text: "230" }
                              ListElement { text: "240" }
                              ListElement { text: "380" }
                              ListElement { text: "440" }
                          }
                }
                Text {
                    text: qsTr(" volts")
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
            Row{
                Text {
                    text: qsTr("Corriente: ")
                    font.pixelSize: letra
                    width: margen
                    anchors.verticalCenter: parent.verticalCenter
                }
                TextField {
                    id: textoCorriente
                    width: ancho
                    text: qsTr("")
                    inputMethodHints: Qt.ImhFormattedNumbersOnly
                }
                Text {
                    text: qsTr(" Amperes")
                    font.pixelSize: letra
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
            Row{
                Text {
                    text: qsTr("Frecuencia: ")
                    font.pixelSize: letra
                    width: margen
                    anchors.verticalCenter: parent.verticalCenter
                }
                ComboBox {
                    id: comboBoxFrecuencia
                    width: ancho
                    model: ListModel {
                              id: modeloFrecuencia
                              ListElement { text: "50" }
                              ListElement { text: "60" }
                          }
                }
                Text {
                    text: qsTr(" Hz")
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
            //--------------- Datos del bobinado
            Row{
                Text {
                    text: qsTr("Alambres en Paralelo: ")
                    font.pixelSize: letra
                    width: margen
                    anchors.verticalCenter: parent.verticalCenter
                }
                ComboBox {
                    id: comboBoxAlambresParalelo
                    width: ancho
                    model: ListModel {
                              id: modeloAlambresParalelo
                              ListElement { text: "1" }
                              ListElement { text: "2" }
                              ListElement { text: "3" }
                              ListElement { text: "4" }
                          }
                }
            }
            Row{
                Text {
                    text: qsTr("Capas por Ranura: ")
                    font.pixelSize: letra
                    width: margen
                    anchors.verticalCenter: parent.verticalCenter
                }
                ComboBox {
                    id: comboBoxCapasRanura
                    textRole: "key"
                    width: ancho
                    model: ListModel {
                              id: modeloCapasRanura
                              ListElement { key: "1 capa";  value:2}
                              ListElement { key: "2 capas"; value:1}
                          }
                }
            }
            Row{
                Text {
                    text: qsTr("Conexión: ")
                    font.pixelSize: letra
                    width: margen
                    anchors.verticalCenter: parent.verticalCenter
                }
                ComboBox {
                    id: comboBoxConexion
                    textRole: "key"
                    width: ancho
                    model: ListModel {
                              id: modeloConexion
                              ListElement { key: "Delta"; value: 1}
                              ListElement { key: "Estrella"; value: 1.73 }
                          }
                }
            }
            Row{
                Text {
                    text: qsTr("Inducción estimada\ndel entrehierro: ")
                    font.pixelSize: letra
                    width: margen
                    anchors.verticalCenter: parent.verticalCenter
                }
                ComboBox {
                    id: comboBoxInduccionEntrehierro
                    width: 200
                    textRole: "key"
                    model: ListModel {
                              id: modeloInduccionEntrehierro
                              ListElement { key: "Motor Antiguo (4 KGs)"; value: 4 }
                              ListElement { key: "Motor Moderno (5 KGs)"; value: 5 }
                          }
                }
            }
            Row{
                Text {
                    text: qsTr("Densidad de corriente \n para motores de: ")
                    font.pixelSize: letra
                    width: margen
                    anchors.verticalCenter: parent.verticalCenter
                }
                ComboBox {
                    id: comboBoxDensidadCorriente
                    width: 200
                    textRole: "key"
                    model: ListModel {
                              id: modeloDensidadCorriente
                              ListElement { key: " 0 - 10 HP ( 7 A/mm2 )"; value: 7 }
                              ListElement { key: "10 - 50 HP ( 5.5 A/mm2 )"; value: 5.5}
                          }
                }
            }
            Button{
                text: "Calcular"

                anchors.horizontalCenter: parent.horizontalCenter
                font.bold: true
                onClicked: {
                    calcular()
                }
            }
            Row{
                spacing: 7
                Text {
                    text: qsTr("Número de espiras\n por bobina: ")
                    font.bold: true
                    anchors.verticalCenter: parent.verticalCenter
                }
                Text {
                    id:labelNumeroEspiras
                    text: qsTr("")
                    anchors.verticalCenter: parent.verticalCenter
                    color: "red"
                    font.bold: true
                    width: 120
                }
            }
            Row{
                Text {
                    text: qsTr("Sección del Alambre: ")
                    font.bold: true
                    anchors.verticalCenter: parent.verticalCenter
                }
                Text {
                    id:labelSeccionAlambre
                    text: qsTr("")
                    anchors.verticalCenter: parent.verticalCenter
                    font.bold: true
                    color: "red"
                    width: 120
                }
            }
            Row{
                Text {
                    text: qsTr("Diámetro del Alambre: ")
                    font.bold: true
                    anchors.verticalCenter: parent.verticalCenter
                }
                Text {
                    id:labelDiametroAlambre
                    text: qsTr("")
                    anchors.verticalCenter: parent.verticalCenter
                    font.bold: true
                    color: "red"
                    width: 120
                }
            }
        }
    }
    Component.onCompleted: {
    }
    function calcular(){
        var pasoPolar=Math.PI*textoDiametroEstator.text/modeloNumeroPolos.get(comboBoxNumeroPolos.currentIndex).value
        var flujoMagnetico=modeloInduccionEntrehierro.get(comboBoxInduccionEntrehierro.currentIndex).value * pasoPolar * textoLargoEstator.text/1000
        var varFactorBobinado=factorBobinado(modeloNumeroPolos.get(comboBoxNumeroPolos.currentIndex).value,comboBoxCantidadRanuras.currentText, comboBoxPasoMedio.currentText)
        var espirasPorFase= (50 * comboBoxVoltajes.currentText * modeloCapasRanura.get(comboBoxCapasRanura.currentIndex).value * comboBoxAlambresParalelo.currentText)/(2.22 * flujoMagnetico * comboBoxFrecuencia.currentText * varFactorBobinado * modeloConexion.get(comboBoxConexion.currentIndex).value)
        var espiras=3*espirasPorFase/comboBoxCantidadRanuras.currentText
        espiras*=factorIncremento(modeloNumeroPolos.get(comboBoxNumeroPolos.currentIndex).value,comboBoxCantidadRanuras.currentText, comboBoxPasoMedio.currentText)
        var seccion=textoCorriente.text * modeloConexion.get(comboBoxConexion.currentIndex).value/(modeloDensidadCorriente.get(comboBoxDensidadCorriente.currentIndex).value * 1.73 * comboBoxAlambresParalelo.currentText)
        var diametro=Math.sqrt(seccion/Math.PI)*2

        labelNumeroEspiras.text= Number(espiras).toFixed(0)
        labelSeccionAlambre.text=Number(seccion).toFixed(3)+" mm2"
        labelDiametroAlambre.text= Number(diametro).toFixed(3) + " mm"
//        console.log(espiras)
    }
    function factorBobinado(polos,ranuras,pasoMedio){
        if((polos==2 && ranuras==12) || (polos==4 && ranuras==24) || (polos==6 && ranuras==36) || (polos==8 && ranuras==48)){
            if(pasoMedio=="1:7")
                return 0.966 //0%
            if(pasoMedio=="1:4")
                return 0.684 //41.2%
            if(pasoMedio=="1:6")
                return 0.934 //3.6%
            if(pasoMedio=="1:5")
                return 0.837 //15.4%
        }
        if((polos==2 && ranuras==18) || (polos==4 && ranuras==36) || (polos==6 && ranuras==54) || (polos==8 && ranuras==72)){
            if(pasoMedio=="1:10")
                return 0.96 //0%
            if(pasoMedio=="1:7")
                return 0.832 //15.2%
            if(pasoMedio=="1:9")
                return 0.945 //1.5%
            if(pasoMedio=="1:6")
                return 0.735 //30.8%
            if(pasoMedio=="1:8")
                return 0.902 //6.4%
        }
        if((polos==2 && ranuras==24) || (polos==4 && ranuras==48) || (polos==6 && ranuras==72) || (polos==8 && ranuras==96)){
            if(pasoMedio=="1:13")
                return 0.958 //0%
            if(pasoMedio=="1:10")
                return 0.885 //8.2%
            if(pasoMedio=="1:7")
                return 0.678 //41%
            if(pasoMedio=="1:12")
                return 0.946 //1.2%
            if(pasoMedio=="1:9")
                return 0.83 //15.4%
            if(pasoMedio=="1:11")
                return 0.926 //3.6%
            if(pasoMedio=="1:8")
                return 0.76 //26%
        }
        if((polos==2 && ranuras==30) || (polos==4 && ranuras==60) || (polos==6 && ranuras==90)){
            if(pasoMedio=="1:16")
                return 0.957 //0%
            if(pasoMedio=="1:13")
                return 0.91 //5.1%
            if(pasoMedio=="1:10")
                return 0.774 //23.6%
            if(pasoMedio=="1:15")
                return 0.947 //1%
            if(pasoMedio=="1:12")
                return 0.874 //9.5%
            if(pasoMedio=="1:9")
                return 0.71 //35%
            if(pasoMedio=="1:14")
                return 0.935 //2.3%
            if(pasoMedio=="1:11")
                return 0.829 //15.2%
        }
        if((polos==2 && ranuras==36) || (polos==4 && ranuras==72)){
            if(pasoMedio=="1:19")
                return 0.956 //0%
            if(pasoMedio=="1:16")
                return 0.923 //3.5%
            if(pasoMedio=="1:13")
                return 0.829 //15.2%

            if(pasoMedio=="1:18")
                return 0.948 //0.8%
            if(pasoMedio=="1:15")
                return 0.898 //6.3%
            if(pasoMedio=="1:12")
                return 0.783 //22%

            if(pasoMedio=="1:17")
                return 0.942 //1.5%
            if(pasoMedio=="1:14")
                return 0.866 //10.2%
            if(pasoMedio=="1:11")
                return 0.732 //30.8%
        }
        if((polos==2 && ranuras==48) || (polos==4 && ranuras==96)){
            if(pasoMedio=="1:25")
                return 0.955 //0%
            if(pasoMedio=="1:24")
                return 0.948 //0.8%
            if(pasoMedio=="1:23")
                return 0.944 //1.2%
            if(pasoMedio=="1:22")
                return 0.937 //1.9%
            if(pasoMedio=="1:21")
                return 0.923 //3.3%
            if(pasoMedio=="1:20")
                return 0.902 //6%
            if(pasoMedio=="1:19")
                return 0.881 //8.2%
            if(pasoMedio=="1:18")
                return 0.856 //11.4%
            if(pasoMedio=="1:17")
                return 0.827 //15.2%
            if(pasoMedio=="1:16")
                return 0.794 //20.2%
            if(pasoMedio=="1:15")
                return 0.757 //26%
            if(pasoMedio=="1:14")
                return 0.716 //33.1%
        }
    }
    function factorIncremento(polos,ranuras,pasoMedio){
        if((polos==2 && ranuras==12) || (polos==4 && ranuras==24) || (polos==6 && ranuras==36) || (polos==8 && ranuras==48)){
            if(pasoMedio=="1:7")
                return 1
            if(pasoMedio=="1:4")
                return 1.412
            if(pasoMedio=="1:6")
                return 1.036
            if(pasoMedio=="1:5")
                return 1.154
        }
        if((polos==2 && ranuras==18) || (polos==4 && ranuras==36) || (polos==6 && ranuras==54) || (polos==8 && ranuras==72)){
            if(pasoMedio=="1:10")
                return 1
            if(pasoMedio=="1:7")
                return 1.152
            if(pasoMedio=="1:9")
                return 1.015
            if(pasoMedio=="1:6")
                return 1.308
            if(pasoMedio=="1:8")
                return 1.064
        }
        if((polos==2 && ranuras==24) || (polos==4 && ranuras==48) || (polos==6 && ranuras==72) || (polos==8 && ranuras==96)){
            if(pasoMedio=="1:13")
                return 1
            if(pasoMedio=="1:10")
                return 1.082
            if(pasoMedio=="1:7")
                return 1.41
            if(pasoMedio=="1:12")
                return 1.012
            if(pasoMedio=="1:9")
                return 1.154
            if(pasoMedio=="1:11")
                return 1.036
            if(pasoMedio=="1:8")
                return 1.26
        }
        if((polos==2 && ranuras==30) || (polos==4 && ranuras==60) || (polos==6 && ranuras==90)){
            if(pasoMedio=="1:16")
                return 1
            if(pasoMedio=="1:13")
                return 1.051
            if(pasoMedio=="1:10")
                return 1.236
            if(pasoMedio=="1:15")
                return 1.01
            if(pasoMedio=="1:12")
                return 1.095
            if(pasoMedio=="1:9")
                return 1.35
            if(pasoMedio=="1:14")
                return 1.023
            if(pasoMedio=="1:11")
                return 1.152
        }
        if((polos==2 && ranuras==36) || (polos==4 && ranuras==72)){
            if(pasoMedio=="1:19")
                return 1
            if(pasoMedio=="1:16")
                return 1.035
            if(pasoMedio=="1:13")
                return 1.152

            if(pasoMedio=="1:18")
                return 1.008
            if(pasoMedio=="1:15")
                return 1.063
            if(pasoMedio=="1:12")
                return 1.22

            if(pasoMedio=="1:17")
                return 1.015
            if(pasoMedio=="1:14")
                return 1.102
            if(pasoMedio=="1:11")
                return 1.308
        }
        if((polos==2 && ranuras==48) || (polos==4 && ranuras==96)){
            if(pasoMedio=="1:25")
                return 1
            if(pasoMedio=="1:24")
                return 1.008
            if(pasoMedio=="1:23")
                return 1.012
            if(pasoMedio=="1:22")
                return 1.019
            if(pasoMedio=="1:21")
                return 1.033
            if(pasoMedio=="1:20")
                return 1.06
            if(pasoMedio=="1:19")
                return 1.082
            if(pasoMedio=="1:18")
                return 1.114
            if(pasoMedio=="1:17")
                return 1.152
            if(pasoMedio=="1:16")
                return 1.202
            if(pasoMedio=="1:15")
                return 1.26
            if(pasoMedio=="1:14")
                return 1.331
        }

    }
}

//
//  ViewController.swift
//  licativo
//
//  Created by Nadia Bordoni on 02/03/20.
//  Copyright © 2020 Nadia Bordoni. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    var valorMensalInt = 0
    var qtdeCinema = 0
    var qtdeViagem = 0
    var qtdeBarzinho = 0
    var qtdeShow = 0
    var qtdeCafe = 0
    var qtdeParque = 0
    var qtdeTeatro = 0
    var qtdeBoliche = 0
    var qtdeFastFood = 0
    var listaImprimir = [String]()
    var imprimirGastos = ""
    var somaImprimir = ""
    var valorImp = ""
    var historicos: [Historico] = []
    //se eu quero mudar depois esse valor, devo colocar variavel?
    let cinema = 13
    let viagem = 180
    let barzinho = 40
    let show = 290
    let cafe = 32
    let parque = 37
    let teatro = 35
    let boliche = 80
    let fastFood = 20
    var valorSalvar = 0
   
    
    //Outlets
    @IBOutlet var continha: UIView!
    @IBOutlet var outletViagem: UIButton!
    @IBOutlet var outletFastFood: UIButton!
    @IBOutlet var outletBoliche: UIButton!
    @IBOutlet var outletCafe: UIButton!
    @IBOutlet var outletParque: UIButton!
    @IBOutlet var outletTeatro: UIButton!
    @IBOutlet var outletShow: UIButton!
    @IBOutlet var outletBarzinho: UIButton!
    @IBOutlet var outletCinema: UIButton!
    @IBOutlet var outletAC: UIButton!
    @IBOutlet var outletIgual: UIButton!
    @IBOutlet var outletHistory: UIButton!
    @IBOutlet var textField: UITextField!
    @IBOutlet var textoContinha: UILabel!
    @IBOutlet var resultado: UILabel!
    @IBOutlet weak var stepperC: UIStepper!
    @IBOutlet weak var labelCinema: UILabel!
    @IBOutlet weak var bolinhaCinema: UIImageView!
    @IBOutlet weak var stepperV: UIStepper!
    @IBOutlet weak var bolinhaViagem: UIImageView!
    @IBOutlet weak var labelViagem: UILabel!
    @IBOutlet weak var stepperBa: UIStepper!
    @IBOutlet weak var bolinhaBarzinho: UIImageView!
    @IBOutlet weak var labelBarzinho: UILabel!
    @IBOutlet weak var stepperS: UIStepper!
    @IBOutlet weak var bolinhaShow: UIImageView!
    @IBOutlet weak var labelShow: UILabel!
    @IBOutlet weak var stepperCf: UIStepper!
    @IBOutlet weak var bolinhaCafe: UIImageView!
    @IBOutlet weak var labelCafe: UILabel!
    @IBOutlet weak var stepperP: UIStepper!
    @IBOutlet weak var bolinhaParque: UIImageView!
    @IBOutlet weak var labelParque: UILabel!
    @IBOutlet weak var stepperT: UIStepper!
    @IBOutlet weak var bolinhaTeatro: UIImageView!
    @IBOutlet weak var labelTeatro: UILabel!
    @IBOutlet weak var stepperBol: UIStepper!
    @IBOutlet weak var bolinhaBoliche: UIImageView!
    @IBOutlet weak var labelBoliche: UILabel!
    @IBOutlet weak var stepperF: UIStepper!
    @IBOutlet weak var bolinhaFastFood: UIImageView!
    @IBOutlet weak var labelFastFood: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard (_:)))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    //GESTURE
    @objc func dismissKeyboard(_ sender:UITapGestureRecognizer){
        textField.resignFirstResponder()
        desaparecerStepper()
        aparecerBotao()
    }
    //TEXTFIELD
    func lerTextfield() {
        /* ler valor colocado pelo usuario e salvar como inteiro
         valor usado em todo o programa */
        let valorMensal = textField.text!
        valorMensalInt = Int(valorMensal) ?? 0
    }
    
    func mudarTextField(){
        let novoTextField = String(valorMensalInt)
        if valorMensalInt == 0 {
            textField.text = ""
        }
        else  {
            textField.text = novoTextField
        }
        
    }
    
    //LABEL
    func impLista(){
        let juntei = listaImprimir.joined(separator: "\n")
        textoContinha.text = juntei
    }
    
    func mudarResultado(){
        resultado.text = imprimirGastos
    }
    func apagarLabel(){
        listaImprimir.removeAll()
        resultado.text = ""
        textoContinha.text = ""
    }
    @IBAction func botaoFechar() {
        apagarLabel()
        continha.isHidden = true
        outletIgual.isEnabled = true
        outletAC.isEnabled = true
        aparecerBotao()
        desaparecerStepper()
    }
    
    
    //BOTOES
    @IBAction func botaoAc() {
        //perguntar se esse é o jeito certo de zerar o textField
        textField.resignFirstResponder()
        textField.isEnabled = true
        apagar()
    }
    
    @IBAction func stepperCinema(_ sender: UIStepper) {
        outletCinema.isEnabled = false
        lerTextfield()
        if valorMensalInt >= cinema {
            let subtrair = valorMensalInt - cinema
            valorMensalInt = subtrair
            qtdeCinema = Int(sender.value)
            mudarTextField()
        }
        if stepperC.value > 0 {
            bolinhaCinema.isHidden = false
            labelCinema.isHidden = false
            labelCinema.text = Int(sender.value).description
        } else{
            bolinhaCinema.isHidden = true
            labelCinema.isHidden = true
        }
    }
    
    @IBAction func botaoCinema() {
        textField.resignFirstResponder()
        aparecerBotao()
        desaparecerStepper()
        if textField.text != "" {
            textField.isEnabled = false
        }
        stepperC.isHidden = false
    }
    
    @IBAction func stepperViagem(_ sender: UIStepper) {
        outletViagem.isEnabled = false
        lerTextfield()
        if valorMensalInt >= viagem {
            let subtrair = valorMensalInt - viagem
            valorMensalInt = subtrair
            qtdeViagem = Int(sender.value)
            mudarTextField()
        }
        if stepperV.value > 0 {
            bolinhaViagem.isHidden = false
            labelViagem.isHidden = false
            labelCinema.text = Int(sender.value).description
        } else{
            bolinhaViagem.isHidden = true
            labelViagem.isHidden = true
        }
        
    }
    @IBAction func botaoViagem() {
        textField.resignFirstResponder()
        aparecerBotao()
        
        if textField.text != "" {
            textField.isEnabled = false
        }
        stepperV.isHidden = false
        
    }
    
    @IBAction func stepperBarzinho(_ sender: UIStepper) {
        outletBarzinho.isEnabled = false
        lerTextfield()
        if valorMensalInt >= barzinho {
            let subtrair = valorMensalInt - barzinho
            valorMensalInt = subtrair
            qtdeBarzinho = Int(sender.value)
            mudarTextField()
        }
        if stepperBa.value > 0 {
            bolinhaBarzinho.isHidden = false
            labelBarzinho.isHidden = false
            labelBarzinho.text = Int(sender.value).description
        } else{
            bolinhaBarzinho.isHidden = true
            labelBarzinho.isHidden = true
        }
    }
    @IBAction func botaoBarzinho() {
        textField.resignFirstResponder()
        aparecerBotao()
        
        if textField.text != "" {
            textField.isEnabled = false
        }
        stepperBa.isHidden = false
    }
    
    @IBAction func StepperShow(_ sender: UIStepper) {
        outletShow.isEnabled = false
        lerTextfield()
        if valorMensalInt >= show {
            let subtrair = valorMensalInt - show
            valorMensalInt = subtrair
            qtdeViagem = Int(sender.value)
            mudarTextField()
        }
        if stepperS.value > 0 {
            bolinhaShow.isHidden = false
            labelShow.isHidden = false
            labelShow.text = Int(sender.value).description
        } else{
            bolinhaShow.isHidden = true
            labelShow.isHidden = true
        }
    }
    @IBAction func botaoShow() {
        textField.resignFirstResponder()
        aparecerBotao()
        
        if textField.text != "" {
            textField.isEnabled = false
        }
        stepperS.isHidden = false
    }
    
    @IBAction func stepperCafe(_ sender: UIStepper) {
        outletCafe.isEnabled = false
        lerTextfield()
        if valorMensalInt >= cafe {
            let subtrair = valorMensalInt - cafe
            valorMensalInt = subtrair
            qtdeCafe = Int(sender.value)
            mudarTextField()
        }
        if stepperCf.value > 0 {
            bolinhaCafe.isHidden = false
            labelCafe.isHidden = false
            labelCafe.text = Int(sender.value).description
        } else{
            bolinhaCafe.isHidden = true
            labelCafe.isHidden = true
        }
    }
    @IBAction func botaoCafe() {
        textField.resignFirstResponder()
        aparecerBotao()
        
        if textField.text != "" {
            textField.isEnabled = false
        }
        stepperCf.isHidden = false
    }
    
    @IBAction func stepperParque(_ sender: UIStepper) {
        outletParque.isEnabled = false
        lerTextfield()
        if valorMensalInt >= parque {
            let subtrair = valorMensalInt - parque
            valorMensalInt = subtrair
            qtdeParque = Int(sender.value)
            mudarTextField()
        }
        if stepperP.value > 0 {
            bolinhaParque.isHidden = false
            labelParque.isHidden = false
            labelParque.text = (sender.value).description
        } else{
            bolinhaParque.isHidden = true
            labelParque.isHidden = true
        }
        
    }
    @IBAction func botaoParque() {
        textField.resignFirstResponder()
        aparecerBotao()
        
        if textField.text != "" {
            textField.isEnabled = false
        }
        stepperP.isHidden = false
    }
    
    @IBAction func stepperTeatro(_ sender: UIStepper) {
        outletTeatro.isEnabled = false
        lerTextfield()
        if valorMensalInt >= teatro {
            let subtrair = valorMensalInt - teatro
            valorMensalInt = subtrair
            qtdeTeatro = Int(sender.value)
            mudarTextField()
        }
        if stepperT.value > 0 {
            bolinhaTeatro.isHidden = false
            labelTeatro.isHidden = false
            labelTeatro.text = (sender.value).description
        } else{
            bolinhaTeatro.isHidden = true
            labelTeatro.isHidden = true
        }
    }
    @IBAction func botaoTeatro() {
        aparecerBotao()
        
        if textField.text != "" {
            textField.isEnabled = false
        }
        stepperP.isHidden = false
    }
    
    @IBAction func StepperBoliche(_ sender: UIStepper) {
        outletBoliche.isEnabled = false
        lerTextfield()
        if valorMensalInt >= boliche {
            let subtrair = valorMensalInt - boliche
            valorMensalInt = subtrair
            qtdeBoliche = Int(sender.value)
            mudarTextField()
        }
        if stepperBol.value > 0 {
            bolinhaBoliche.isHidden = false
            labelBoliche.isHidden = false
            labelBoliche.text = (sender.value).description
        } else{
            bolinhaBoliche.isHidden = true
            labelBoliche.isHidden = true
        }
    }
    @IBAction func botaoBoliche() {
        aparecerBotao()
        
        if textField.text != "" {
            textField.isEnabled = false
        }
        stepperBol.isHidden = false
    }
    
    @IBAction func stepperFastFood(_ sender: UIStepper) {
        outletFastFood.isEnabled = false
        lerTextfield()
        if valorMensalInt >= fastFood {
            let subtrair = valorMensalInt - fastFood
            valorMensalInt = subtrair
            qtdeFastFood = Int(sender.value)
            mudarTextField()
        }
        if stepperF.value > 0 {
            bolinhaFastFood.isHidden = false
            labelFastFood.isHidden = false
            labelFastFood.text = (sender.value).description
        } else{
            bolinhaFastFood.isHidden = true
            labelFastFood.isHidden = true
        }
    }
    @IBAction func botaoFastFood() {
        aparecerBotao()
        
        if textField.text != "" {
            textField.isEnabled = false
        }
        stepperF.isHidden = false
    }
    
    
    @IBAction func botaoIgual() {
        /* aparecer pop up com escolhas feitas pelo usuario (quantidade, role escolhido, funcao multiplicar
         aparecer resultado do gasto (usar funcao de soma)
         aparecer sub de valor imputado por valor gasto
         */
        if textField.text != "" {
            textField.isEnabled = false
        }
        continha.isHidden = false
        outletIgual.isEnabled = false
        outletAC.isEnabled = false
        outletCinema.isEnabled = false
        outletViagem.isEnabled = false
        outletBarzinho.isEnabled = false
        outletShow.isEnabled = false
        outletCafe.isEnabled = false
        outletParque.isEnabled = false
        outletTeatro.isEnabled = false
        outletBoliche.isEnabled = false
        outletFastFood.isEnabled = false
        outletHistory.isEnabled = false
        
        if qtdeCinema > 0 {
            let newQtdecinema = String(qtdeCinema)
            let mult = String(qtdeCinema * cinema)
            listaImprimir.append(newQtdecinema + " x " + "cinema" + " =  R$ " + mult)
        }
        if qtdeViagem > 0 {
            let newQtdeViagem = String(qtdeViagem)
            let mult = String(qtdeViagem * viagem)
            listaImprimir.append(newQtdeViagem + " x " + "viagem" + " =  R$ " + mult)
        }
        if qtdeBarzinho > 0 {
            let newQtdeBar = String(qtdeBarzinho)
            let mult = String(qtdeBarzinho * barzinho)
            listaImprimir.append(newQtdeBar + " x " + "barzinho" + " =  R$ " + mult)
        }
        if qtdeShow > 0 {
            let newQtdeShow = String(qtdeShow)
            let mult = String(qtdeShow * show)
            listaImprimir.append(newQtdeShow + " x " + "show" + " =  R$ " + mult)
        }
        if qtdeCafe > 0 {
            let newQtdeCafe = String(qtdeCafe)
            let mult = String(qtdeCafe * cafe)
            listaImprimir.append(newQtdeCafe + " x " + "cafe" + " =  R$ " + mult)
        }
        if qtdeParque > 0 {
            let newQtdeParque = String(qtdeParque)
            let mult = String(qtdeParque * parque)
            listaImprimir.append(newQtdeParque + " x " + "parque" + " =  R$ " + mult)
        }
        if qtdeTeatro > 0{
            let newQtdeTeatro = String(qtdeTeatro)
            let mult = String(qtdeTeatro * teatro)
            listaImprimir.append(newQtdeTeatro + " x " + "teatro" + " =  R$ " + mult)
        }
        if qtdeBoliche > 0 {
            let newQtdeBoliche = String(qtdeBoliche)
            let mult = String(qtdeBoliche * boliche)
            listaImprimir.append(newQtdeBoliche + " x " + "boliche" + " =  R$ " + mult)
        }
        if qtdeFastFood > 0 {
            let newQtdeFastFood = String(qtdeFastFood)
            let mult = String(qtdeFastFood * fastFood)
            listaImprimir.append(newQtdeFastFood + " x " + "fast food" + " =  R$ " + mult)
        }
        impLista()
        somaImprimir = somaTotal()
        if somaImprimir != "" {
            imprimirGastos = "Gastos  " + somaImprimir
            mudarResultado()
        } else {
            apagarLabel()
        }
        
    }
    
    
    //FUNCOES GERAIS
    func somaTotal() -> String {
        // faz soma de todos os gastos selecionados pelo usuario e retorna uma string pra imprimir na label
        let soma = (qtdeCinema * cinema) + (qtdeViagem * viagem) + (qtdeBarzinho * barzinho) + (qtdeCafe * cafe) + (qtdeParque * parque) + (qtdeTeatro * teatro) + (qtdeBoliche * boliche) + (qtdeFastFood * fastFood)
        var retorno = ""
        if soma > 0 {
            retorno = String(soma)
        }
        return retorno
    }
    func apagar(){
        // apagar as coisas selecionadas antes de apertar ˜=˜, apagar todos os contadores e setar o textfield pra vazio
        // nao ta zerando os gastos
        valorMensalInt = 0
        qtdeCinema = 0
        stepperC.value = 0
        qtdeViagem = 0
        stepperV.value = 0
        qtdeBarzinho = 0
        stepperBa.value = 0
        qtdeShow = 0
        stepperS.value = 0
        qtdeCafe = 0
        stepperCf.value = 0
        qtdeParque = 0
        stepperP.value = 0
        qtdeTeatro = 0
        stepperT.value = 0
        qtdeBoliche = 0
        stepperBol.value = 0
        qtdeFastFood = 0
        stepperF.value = 0
        somaImprimir = ""
        mudarTextField()
    }
    
    @IBAction func botaoSalvar() {
        let hist = Historico(role: listaImprimir, valorMensal: valorSalvar, valorGasto: somaImprimir)
        historicos.append(hist)
        continha.isHidden = true
        outletIgual.isEnabled = true
        outletAC.isEnabled = true
        outletCinema.isEnabled = true
        outletViagem.isEnabled = true
        outletBarzinho.isEnabled = true
        outletShow.isEnabled = true
        outletCafe.isEnabled = true
        outletParque.isEnabled = true
        outletTeatro.isEnabled = true
        outletBoliche.isEnabled = true
        outletFastFood.isEnabled = true
        outletHistory.isEnabled = true
    }
    func aparecerBotao(){
        outletCinema.isEnabled = true
        outletViagem.isEnabled = true
        outletBarzinho.isEnabled = true
        outletShow.isEnabled = true
        outletCafe.isEnabled = true
        outletParque.isEnabled = true
        outletTeatro.isEnabled = true
        outletBoliche.isEnabled = true
        outletFastFood.isEnabled = true
    }
    func desaparecerStepper(){
        stepperC.isHidden = true
        stepperV.isHidden = true
        stepperBa.isHidden = true
        stepperS.isHidden = true
        stepperCf.isHidden = true
        stepperP.isHidden = true
        stepperT.isHidden = true
        stepperBol.isHidden = true
        stepperF.isHidden = true
    }
    
}


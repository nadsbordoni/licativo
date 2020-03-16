//
//  ViewController.swift
//  licativo
//
//  Created by Nadia Bordoni on 02/03/20.
//  Copyright © 2020 Nadia Bordoni. All rights reserved.
//

import UIKit

class Historico {
    var role: [String]
    var valorMensal: Int
    var valorGasto: String
    
    init(role: [String], valorMensal: Int, valorGasto: String) {
        self.role = role
        self.valorMensal = valorMensal
        self.valorGasto = valorGasto
    }
}
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
    var historicos: [Historico] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard (_:)))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    //TEXTFIELD
    @IBOutlet var textField: UITextField!
    @objc func dismissKeyboard(_ sender:UITapGestureRecognizer){
        textField.resignFirstResponder()
    }
    
    func lerTextfield() {
        // ler valor colocado pelo usuario e salvar como inteiro
        //valor usado em todo o programa
        let valorMensal = textField.text!
        valorMensalInt = Int(valorMensal) ?? 0
        //valor que preciso no fim
        /*let valorM = textField.text!
        valorImp = valorM
        valorSalvar = Int(valorM) ?? 0 */
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
    @IBOutlet var textoContinha: UILabel!
    func impLista(){
        let juntei = listaImprimir.joined(separator: "\n")
        textoContinha.text = juntei
    }
    
    @IBOutlet var resultado: UILabel!
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
    
    
    //BOTOES
    @IBAction func botaoAc() {
        //perguntar se esse é o jeito certo de zerar o textField
        textField.resignFirstResponder()
        textField.isEnabled = true
        apagar()
    }
    
    @IBAction func botaoCinema() {
        textField.resignFirstResponder()
        if textField.text != "" {
            textField.isEnabled = false
        }
        lerTextfield()
        if valorMensalInt >= cinema {
            let subtrair = valorMensalInt - cinema
            valorMensalInt = subtrair
            qtdeCinema += 1
            mudarTextField()
        }
        
    }
    
    @IBAction func botaoViagem() {
        textField.resignFirstResponder()
        if textField.text != "" {
            textField.isEnabled = false
        }
        lerTextfield()
        if valorMensalInt >= viagem {
            let subtrair = valorMensalInt - viagem
            valorMensalInt = subtrair
            qtdeViagem += 1
            mudarTextField()
        }
    }
    
    @IBAction func botaoBarzinho() {
        textField.resignFirstResponder()
        if textField.text != "" {
            textField.isEnabled = false
        }
        lerTextfield()
        if valorMensalInt >= barzinho {
            let subtrair = valorMensalInt - barzinho
            valorMensalInt = subtrair
            qtdeBarzinho += 1
            mudarTextField()
        }
    }
    
    @IBAction func botaoShow() {
        textField.resignFirstResponder()
       if textField.text != "" {
            textField.isEnabled = false
        }
        lerTextfield()
        if valorMensalInt >= show {
            let subtrair = valorMensalInt - show
            valorMensalInt = subtrair
            qtdeShow += 1
            mudarTextField()
        }
    }
    
    @IBAction func botaoCafe() {
        textField.resignFirstResponder()
        if textField.text != "" {
            textField.isEnabled = false
        }
        lerTextfield()
        if valorMensalInt >= cafe{
            let subtrair = valorMensalInt - cafe
            valorMensalInt = subtrair
            qtdeCafe += 1
            mudarTextField()
        }
    }
    
    @IBAction func botaoParque() {
        textField.resignFirstResponder()
        if textField.text != "" {
            textField.isEnabled = false
        }
        lerTextfield()
        if valorMensalInt >= parque {
            let subtrair = valorMensalInt - parque
            valorMensalInt = subtrair
            qtdeParque += 1
            mudarTextField()
        }
    }
    
    @IBAction func botaoTeatro() {
        if textField.text != "" {
            textField.isEnabled = false
        }
        lerTextfield()
        if valorMensalInt >= teatro {
            let subtrair = valorMensalInt - teatro
            valorMensalInt = subtrair
            qtdeTeatro += 1
            mudarTextField()
        }
    }
    
    @IBAction func botaoBoliche() {
       if textField.text != "" {
            textField.isEnabled = false
        }
        lerTextfield()
        if valorMensalInt >= boliche {
            let subtrair = valorMensalInt - boliche
            valorMensalInt = subtrair
            qtdeBoliche += 1
            mudarTextField()
        }
    }
    
    @IBAction func botaoFastFood() {
        if textField.text != "" {
            textField.isEnabled = false
        }
        lerTextfield()
        if valorMensalInt >= fastFood {
            let subtrair = valorMensalInt - fastFood
            valorMensalInt = subtrair
            qtdeFastFood += 1
            mudarTextField()
        }
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
        qtdeViagem = 0
        qtdeBarzinho = 0
        qtdeShow = 0
        qtdeCafe = 0
        qtdeParque = 0
        qtdeTeatro = 0
        qtdeBoliche = 0
        qtdeFastFood = 0
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
    func History() {
        // historico
        // eu vou morrer
    }
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
}


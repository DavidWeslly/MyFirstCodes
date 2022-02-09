//
//  ViewController.swift
//  IMC
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tfpeso: UITextField!
    @IBOutlet weak var tfaltura: UITextField!
    @IBOutlet weak var lbresultado: UILabel!
    @IBOutlet weak var imageresult: UIImageView!
    @IBOutlet weak var viresult: UIView!
    @IBOutlet weak var UbCalculate: UIButton!
    @IBOutlet weak var lbImc: UILabel!
    
    var imc:  Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        UbCalculate.layer.cornerRadius = 15
        UbCalculate.layer.masksToBounds = true
    }

    @IBAction func calcular(_ sender: Any) {
        if let peso = Double(tfpeso.text!), let altura = Double(tfaltura.text!){
            imc = peso / (altura * altura)
            lbImc.text = String(format: "%.2f", imc)
            
            showResults()
         
            
        }
        
    }
    func showResults (){
        var result: String = ""
        var image: String = ""
        switch imc {
            case 0..<16:
                result = "Magreza"
                image = "magreza"
            case 16..<18.5:
                result = "Abaixo do Peso"
                image = "abaixo"
            case 18.5..<25:
                result = "Peso ideal"
                image = "ideal"
            case 25..<30:
                result = "Acima do Peso"
                image = "sobre"
            default:
                result = "Obesidade"
                image = "obesidade"
        }
        lbresultado.text = result
        imageresult.image = UIImage(named: image)
        viresult.isHidden = false
        view.endEditing(true)
        
    }
}


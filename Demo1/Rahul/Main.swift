//
//  ViewController.swift
//  Rahul
//
//  Created by PCQ196 on 20/12/20.
//

import UIKit

class Main: UIViewController {
    
    //
    @IBOutlet var lblAns: UILabel!
    
    // num buttons outlets
    @IBOutlet var btn0: UIButton!
    @IBOutlet var btn1: UIButton!
    @IBOutlet var btn2: UIButton!
    @IBOutlet var btn3: UIButton!
    @IBOutlet var btn4: UIButton!
    @IBOutlet var btn5: UIButton!
    @IBOutlet var btn6: UIButton!
    @IBOutlet var btn7: UIButton!
    @IBOutlet var btn8: UIButton!
    @IBOutlet var btn9: UIButton!
    @IBOutlet var btnDot: UIButton!
    
    // operation buttons outlets
    @IBOutlet var btnPlus: UIButton!
    @IBOutlet var btnMinus: UIButton!
    @IBOutlet var btnMulti: UIButton!
    @IBOutlet var btnDiv: UIButton!
    @IBOutlet var btnEqu: UIButton!
    @IBOutlet var btnClear: UIButton!
    
    // variables
    var numStack: [String] = []
    var answer: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func updateLbl(){
        lblAns.text = "\(numStack.joined())"
    }
    
    func doEqual(){
        
        var operand1 = Double()
        var operand2 = Double()
        let equationStr: String = numStack.joined()
        
        if equationStr.components(separatedBy: "+").count > 1{
            operand1 = Double(equationStr.components(separatedBy: "+")[0]) ?? 0
            operand2 = Double(equationStr.components(separatedBy: "+")[1]) ?? 0
            answer = operand1 + operand2
            
        } else if equationStr.components(separatedBy: "*").count > 1{
            operand1 = Double(equationStr.components(separatedBy: "*")[0]) ?? 1.0
            operand2 = Double(equationStr.components(separatedBy: "*")[1]) ?? 1.0
            answer = operand1 * operand2
            
        } else if equationStr.components(separatedBy: "/").count > 1{
            operand1 = Double(equationStr.components(separatedBy: "/")[0]) ?? 0
            operand2 = Double(equationStr.components(separatedBy: "/")[1]) ?? 1.0
            answer = operand1 / operand2
            
        } else if equationStr.components(separatedBy: "-").count > 1{
            operand1 = Double(equationStr.components(separatedBy: "-")[0]) ?? 0
            operand2 = Double(equationStr.components(separatedBy: "-")[1]) ?? 0
            answer = operand1 - operand2
           
        }
        
        guard !(answer.isNaN || answer.isInfinite) else {
            lblAns.text = "Invalid"
            numStack.removeAll()
            return
            
        }
        if floor(answer) == answer{
            lblAns.text = "\(Int(answer))"
            numStack.removeAll()
            numStack.append("\(Int(answer))")
            
        } else {
            lblAns.text = "\(answer)"
            numStack.removeAll()
            numStack.append("\(answer)")
        }
        
        
    }
    
    @IBAction func btnPress(sender: UIButton){
        
        if sender == btn0{
            if numStack.count != 1 {
                numStack.append("0")
            }
        }
        if sender == btn1{
            numStack.append("1")
        }
        if sender == btn2{
            numStack.append("2")
        }
        if sender == btn3{
            numStack.append("3")
        }
        if sender == btn4{
            numStack.append("4")
        }
        if sender == btn5{
            numStack.append("5")
        }
        if sender == btn6{
            numStack.append("6")
        }
        if sender == btn7{
            numStack.append("7")
        }
        if sender == btn8{
            numStack.append("8")
        }
        if sender == btn9{
            numStack.append("9")
        }
        if sender == btnDot{
            numStack.append(".")
        }
        if sender == btnPlus{
            numStack.append("+")
        }
        if sender == btnMinus{
            numStack.append("-")
        }
        if sender == btnMulti{
            numStack.append("*")
        }
        if sender == btnDiv{
            numStack.append("/")
        }
        if sender == btnEqu{
            self.doEqual()
            return
        }
        if sender == btnClear{
            numStack.removeAll()
            answer = 0
            lblAns.text = "0"
            return
        }
        
        updateLbl()
        
    }


}


//
//  ViewController.swift
//  Calculadora
//
//  Created by Daniel Sanabria on 14/03/18.
//  Copyright © 2018 Daniel Sanabria. All rights reserved.
//

import UIKit

enum Operation:String{
    case Add = "+"
    case Subtract = "-"
    case Divide = "/"
    case Multiply = "*"
    case NULL = "Null"
}

class ViewController: UIViewController {

    @IBOutlet weak var outputLbl: UILabel!
    @IBOutlet var addItemView: UIView!
    @IBOutlet weak var visualEffectView: UIVisualEffectView!
    @IBOutlet weak var buttonsCalculator: UIStackView!
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var bgImage: UIImageView!
    @IBOutlet weak var diviButton: RoundButton!
    @IBOutlet weak var multButton: RoundButton!
    @IBOutlet weak var subButton: RoundButton!
    @IBOutlet weak var adcButton: RoundButton!
    @IBOutlet weak var equalButton: RoundButton!
    
    
    
    var runningNumber = ""
    var leftValue = ""
    var rightValue = ""
    var result = ""
    var currentOperation:Operation = .NULL
    var effect:UIVisualEffect!
    var menuShowing = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        outputLbl.text = "0"
        effect = visualEffectView.effect
        self.outputLbl.isHidden = true
        self.buttonsCalculator.isHidden = true
    //    self.pasteButton.isHidden = true
      //  self.copyButton.isHidden = true
        self.navigationController?.navigationBar.isHidden = true
        menuView.layer.shadowOpacity = 1
        menuView.layer.shadowRadius = 6
        menuView.layer.backgroundColor = nil
        visualEffectView.effect = nil
        addItemView.layer.cornerRadius = 5
        self.leadingConstraint.constant = -165
        self.view.bringSubview(toFront: menuView)
        
        UIView.animate(withDuration: 2.0, animations: {
            self.visualEffectView.effect = self.effect
            self.view.layoutIfNeeded()
        }){(succes:Bool) in
            self.outputLbl.isHidden = false
          //  self.pasteButton.isHidden = false
         //   self.copyButton.isHidden = false
            self.buttonsCalculator.isHidden = false
            self.navigationController?.navigationBar.isHidden = false
            self.animateButtons()
            
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func animateButtons(){
        let stacks = self.buttonsCalculator.subviews
        for stack in stacks {
            stack.transform = CGAffineTransform(translationX: view.frame.width, y:0)
        }
        var delay = 0.5
        for stack in stacks {
            UIView.animate(withDuration: 0.3, delay: delay, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: [], animations: {stack.transform = .identity})
        delay += 0.2
        }
    }
    
    func animateIn(){
        self.view.addSubview(addItemView)
        addItemView.center = self.view.center
        addItemView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        UIView.animate(withDuration: 0.4){
            self.outputLbl.isHidden = true
            self.buttonsCalculator.isHidden = true
            self.navigationController?.navigationBar.isHidden = true
            self.menuView.isHidden = true
            self.visualEffectView.effect = nil
            self.addItemView.alpha = 1
            self.addItemView.transform = CGAffineTransform.identity
        }
    }
    
    func animateOut() {
        UIView.animate(withDuration: 0.3, animations: {
            self.addItemView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            self.addItemView.alpha = 0
            self.visualEffectView.effect = self.effect
        }) { (success:Bool) in
            self.addItemView.removeFromSuperview()
            self.outputLbl.isHidden = false
            self.buttonsCalculator.isHidden = false
            self.menuView.isHidden = false
            self.navigationController?.navigationBar.isHidden = false
        }
    }
    
    @IBAction func pasteButtonAct(_ sender: Any) {
    }
    @IBAction func copyButtonAct(_ sender: Any) {
    }
    @IBAction func menuBg(_ sender: Any) {
        if(menuShowing){
            leadingConstraint.constant = -163
        } else {
            leadingConstraint.constant = 0
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
        }
        
        menuShowing = !menuShowing
    }
    @IBAction func menuUniforme1(_ sender: Any) {
       
        if(!menuShowing){
            leadingConstraint.constant = 0
        } else {
            leadingConstraint.constant = -163
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            }) { (success:Bool) in
         //       self.copyButton.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
         //       self.pasteButton.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                self.outputLbl.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                self.diviButton.layer.backgroundColor = #colorLiteral(red: 0.8563808693, green: 0.8412599117, blue: 0, alpha: 1)
                self.multButton.layer.backgroundColor =
                    #colorLiteral(red: 0.8563808693, green: 0.8412599117, blue: 0, alpha: 1)
                self.subButton.layer.backgroundColor = #colorLiteral(red: 0.8563808693, green: 0.8412599117, blue: 0, alpha: 1)
                self.adcButton.layer.backgroundColor = #colorLiteral(red: 0.8563808693, green: 0.8412599117, blue: 0, alpha: 1)
                self.equalButton.layer.backgroundColor = #colorLiteral(red: 0.8563808693, green: 0.8412599117, blue: 0, alpha: 1)
                self.bgImage.image = #imageLiteral(resourceName: "bg2")
                self.viewDidLoad()
            }
        menuShowing = !menuShowing
        }
    }
        
    @IBAction func menuUniforme2(_ sender: Any) {
        if(!menuShowing){
            leadingConstraint.constant = 0
        } else {
            leadingConstraint.constant = -163
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            }) { (success:Bool) in
       //         self.copyButton.backgroundColor = #colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1)
//                self.pasteButton.backgroundColor = #colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1)
                self.outputLbl.textColor = #colorLiteral(red: 0.8563808693, green: 0.8412599117, blue: 0, alpha: 1)
                self.diviButton.layer.backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
                self.multButton.layer.backgroundColor =
                    #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
                self.subButton.layer.backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
                self.adcButton.layer.backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
                self.equalButton.layer.backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
                self.bgImage.image = #imageLiteral(resourceName: "bg")
                self.viewDidLoad()
            }
            menuShowing = !menuShowing
        }
    }
    @IBAction func menuUniforme3(_ sender: Any) {
        if(!menuShowing){
            leadingConstraint.constant = 0
        } else {
            leadingConstraint.constant = -163
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            }) { (success:Bool) in
                self.outputLbl.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                self.diviButton.layer.backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
                self.multButton.layer.backgroundColor =
                    #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
                self.subButton.layer.backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
                self.adcButton.layer.backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
                self.equalButton.layer.backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
                self.bgImage.image = #imageLiteral(resourceName: "bg3")
                self.viewDidLoad()
            }
            menuShowing = !menuShowing
        }
    }
    
    
    
    @IBAction func refresh(_ sender: Any) {
        animateIn()
    }
    @IBAction func dismissPopUp(_ sender: Any) {
        animateOut()
    }
    
    @IBAction func numberPressed(_ sender: RoundButton) {
        if runningNumber.count <= 8 {
            runningNumber += "\(sender.tag)"
            outputLbl.text = runningNumber
        }
    }
    
    @IBAction func allClearPressed(_ sender: RoundButton) {
        runningNumber = ""
        leftValue = ""
        rightValue = ""
        result = ""
        currentOperation = .NULL
        outputLbl.text = "0"
    }
   
    @IBAction func dotPressed(_ sender: RoundButton) {
        if runningNumber.count <= 7 {
            runningNumber += "."
            outputLbl.text = runningNumber
        }
    }
    @IBAction func divdPressed(_ sender: RoundButton) {
        operation(operation: .Divide)
    }
    @IBAction func multPressed(_ sender: RoundButton) {
        operation(operation: .Multiply)
    }
    @IBAction func minPresses(_ sender: RoundButton) {
        operation(operation: .Subtract)
    }
    @IBAction func sumPressed(_ sender: RoundButton) {
        operation(operation: .Add)
    }
    @IBAction func equalPressed(_ sender: RoundButton) {
        operation(operation: currentOperation)
    }
    
    func operation(operation: Operation) {
        if currentOperation != .NULL {
            if runningNumber != "" {
                rightValue = runningNumber
                runningNumber = ""
                
                if currentOperation == .Add {
                    result = "\(Double(leftValue)! + Double(rightValue)!)"
                }else if currentOperation == .Subtract {
                    result = "\(Double(leftValue)! - Double(rightValue)!)"
                }else if currentOperation == .Multiply {
                    result = "\(Double(leftValue)! * Double(rightValue)!)"
                }else if currentOperation == .Divide {
                    result = "\(Double(leftValue)! / Double(rightValue)!)"
                }
                leftValue = result
                if (Double(result)!.truncatingRemainder(dividingBy: 1) == 0){
                    result = "\(Int(Double(result)!))"
                }
                outputLbl.text = result
            }
            currentOperation = operation
            
        }else {
            leftValue = runningNumber
            runningNumber = ""
            currentOperation = operation
        }
    }
    
}


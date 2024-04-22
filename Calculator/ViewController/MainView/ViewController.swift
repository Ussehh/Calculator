//
//  ViewController.swift
//  Calculator
//
//  Created by Никита Абаев on 29.10.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private let dispaly   = UITextField()
    private let displayView = UIView()
    private let mainVStak = UIStackView()
    
    // MARK: Properties
    var service: CalcService?

    //MARK: ViewController lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        service = CalcService(displayView: self)
        view.backgroundColor = AppColors.background
        
        configureAppearance()
    }
// MARK: medoths
    func updateDisplay(text: String) {
        DispatchQueue.main.async {
            self.dispaly.text = text
        }
    }
    @objc func buttonPressed(_ sender: UIButton) {
       switch sender.tag {
                case 0...9:
                    service?.numberAction(number: sender.tag)
                case 10:
                    service?.dot()
                case 11:
                    service?.makeResult()
                case 12:
                    service?.addition()
                case 13:
                    service?.substraction()
                case 14:
                    service?.multiplication()
                case 15:
                    service?.acAction()
                case 16:
                    service?.changeSign()
                case 17:
                    service?.percent()
                case 18:
                    service?.division()
                default:
                    break
                }
    }
}

private extension ViewController {
  func configureAppearance() {
      setupDisplayView()
      setupButtons()
      setupMainVStack()
    }
    
    func setupMainVStack() {
        mainVStak.axis = .vertical
        mainVStak.frame = CGRect(x: 0, y: 60, width: Constants.screenWidth,height: Constants.screenHight - 60)
        
        self.view.addSubview(mainVStak)
    }
    
    func setupDisplayView() {
        displayView.frame = CGRect(x: 0, y: 0, width: Int(Constants.screenWidth), height: Int(Constants.screenHight) - (85 * 5) - 60 - 30)
        
        
        dispaly.frame = CGRect(x: 15, y: 15, width: displayView.frame.width - 39, height: displayView.frame.height - 55)
        dispaly.textAlignment = .right
        dispaly.contentVerticalAlignment = .bottom
        dispaly.text = "0"
        dispaly.textColor = .white
        dispaly.font = UIFont.boldSystemFont(ofSize: 80)
        
        displayView.addSubview(dispaly)
        mainVStak.addSubview(displayView)
    }
    
    
    func setupLine1() {
        let line1 = createHSack(yP: Int(displayView.frame.height) - 40)
        let acButton = createButton(order: 0, title: "AC", tag: 15)
        acButton.addTarget(self, action: #selector(buttonPressed(_:)), for:  .touchUpInside)
        acButton.backgroundColor = AppColors.topButtons
        acButton.setTitleColor(.black, for: .normal)
        let changeSingButton = createButton(order: 1, title: "+/-", tag: 16)
        changeSingButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        changeSingButton.backgroundColor = AppColors.topButtons
        changeSingButton.setTitleColor(.black, for: .normal)
        let percentButton = createButton(order: 2, title: "%", tag: 17)
        percentButton.addTarget(self, action: #selector(buttonPressed(_:)), for:  .touchUpInside)
        percentButton.backgroundColor = AppColors.topButtons
        percentButton.setTitleColor(.black, for: .normal)
        let divButton = createButton(order: 3, title: "÷", tag: 18)
        divButton.addTarget(self, action: #selector(buttonPressed(_:)), for:  .touchUpInside)
        divButton.backgroundColor = AppColors.actions
        divButton.setTitleColor(.black, for: .normal)
                       
        line1.addSubview(acButton)
        line1.addSubview(changeSingButton)
        line1.addSubview(percentButton)
        line1.addSubview(divButton)
        
        mainVStak.addSubview(line1)
    }
    
    func setupLine2() {
        let line2 = createHSack(yP: Int(displayView.frame.height) + 80 - 30)
        let sevenButton = createButton(order: 0, title: "7", tag: 7)
        sevenButton.addTarget(self, action: #selector(buttonPressed(_:)), for:  .touchUpInside)
        let  eightButton = createButton(order: 1, title: "8", tag: 8)
        eightButton.addTarget(self, action: #selector(buttonPressed(_:)), for:  .touchUpInside)
        let nineButton = createButton(order: 2, title: "9", tag: 9)
        nineButton.addTarget(self, action: #selector(buttonPressed(_:)), for:  .touchUpInside)
        let multButton = createButton(order: 3, title: "×", tag: 14)
        multButton.addTarget(self, action: #selector(buttonPressed(_:)), for:  .touchUpInside)
        multButton.backgroundColor = AppColors.actions
        multButton.setTitleColor(.black, for: .normal)
       
        line2.addSubview(sevenButton)
        line2.addSubview(eightButton)
        line2.addSubview(nineButton)
        line2.addSubview(multButton)
        
        mainVStak.addSubview(line2)
    }
    
    func setupline3() {
        let line3 = createHSack(yP: Int(displayView.frame.height) + 80 + 80 - 20)
        let fourButton = createButton(order: 0, title: "4", tag: 4)
        fourButton.addTarget(self, action: #selector(buttonPressed(_:)), for:  .touchUpInside)
        let fiveButton = createButton(order: 1, title: "5", tag: 5)
        fiveButton.addTarget(self, action: #selector(buttonPressed(_:)), for:  .touchUpInside)
        let sixButton = createButton(order: 2, title: "6", tag: 6)
        sixButton.addTarget(self, action: #selector(buttonPressed(_:)), for:  .touchUpInside)
        let minusButton = createButton(order: 3, title: "-", tag: 13)
        minusButton.addTarget(self, action: #selector(buttonPressed(_:)), for:  .touchUpInside)
        minusButton.backgroundColor = AppColors.actions
        minusButton.setTitleColor(.black, for: .normal)
        
        line3.addSubview(fourButton)
        line3.addSubview(fiveButton)
        line3.addSubview(sixButton)
        line3.addSubview(minusButton)
        mainVStak.addSubview(line3)
    }
    
    func setupLine4() {
        let line4 = createHSack(yP: Int(displayView.frame.height) + 80 + 80 + 80  - 10)
        let oneButton = createButton(order: 0, title: "1", tag: 1)
        oneButton.addTarget(self, action: #selector(buttonPressed(_:)), for:  .touchUpInside)
        let twoButton = createButton(order: 1, title: "2", tag: 2)
        twoButton.addTarget(self, action: #selector(buttonPressed(_:)), for:  .touchUpInside)
        let threeButton = createButton(order: 2, title: "3", tag: 3)
        threeButton.addTarget(self, action: #selector(buttonPressed(_:)), for:  .touchUpInside)
        let plusButton = createButton(order: 3, title: "+", tag: 12)
        plusButton.addTarget(self, action: #selector(buttonPressed(_:)), for:  .touchUpInside)
        plusButton.backgroundColor = AppColors.actions
        plusButton.setTitleColor(.black, for: .normal)
        
        line4.addSubview(oneButton)
        line4.addSubview(twoButton)
        line4.addSubview(threeButton)
        line4.addSubview(plusButton)
        
        mainVStak.addSubview(line4)
    }
    
    func setupLine5() {
        let line5 = createHSack(yP: Int(displayView.frame.height) + 80 + 80 + 80 + 80 )
        
        let zeroButton = createButton(order: 0, title: "0", tag: 0)
        zeroButton.frame = CGRect(x: 9, y: 0, width: Int(Constants.screenWidth)/4*2 - 15, height: 80)
        zeroButton.addTarget(self, action: #selector(buttonPressed(_:)), for:  .touchUpInside)
        line5.addSubview(zeroButton)
        
        let dotButton = createButton(order: 2, title: ".", tag: 10)
        dotButton.addTarget(self, action: #selector(buttonPressed(_:)), for:  .touchUpInside)
        let equalsButton = createButton(order: 3, title: "=", tag: 11)
        equalsButton.addTarget(self, action: #selector(buttonPressed(_:)), for:  .touchUpInside)
        equalsButton.backgroundColor = AppColors.actions
        equalsButton.setTitleColor(.black, for: .normal)
        
        line5.addSubview(dotButton)
        line5.addSubview(equalsButton)
        
        
        mainVStak.addSubview(line5)
    }
    
    func setupButtons() {
        setupLine1()
        setupLine2()
        setupline3()
        setupLine4()
        setupLine5()
    }
   
    
    
     func createButton(order: Int, title: String, tag: Int) -> UIButton {
         let button = UIButton (frame: CGRect(x: (0+Int (Constants.screenWidth/4)*order + 9), y: 0,
                                              width: 78, height: 78))
         button.layer.cornerRadius = 39
         button.setTitle(title, for: .normal)
         button.backgroundColor = AppColors.Buttons
         button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
         button.setTitleColor(.white, for: .normal)
         button.tag = tag
         return button
     }
    
    func return0() {
        
    }
    
    func createHSack(yP: Int) -> UIStackView {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.frame = CGRect(x: 0, y: yP, width: Int(Constants.screenWidth), height: 80)
        return stack
    }
    
}



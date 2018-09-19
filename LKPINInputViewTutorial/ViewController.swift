//ViewController.swift
/*
 * LKPINInputViewTutorial
 * Created by penumutchu.prasad@gmail.com on 19/09/18
 * Is a product created by abnboys
 * For the  in the LKPINInputViewTutorial
 
 * Here the permission is granted to this file with free of use anywhere in the IOS Projects.
 * Copyright © 2018 ABNBoys.com All rights reserved.
*/

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var ibPinView: LKPINView!

    var pinsView: LKPINView!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()


        setupPINView()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        ibPinView.becomeFirstResponder()
        
    }
    
    private func setupPINView() {
        
        pinsView = LKPINView.init(frame: .zero)
        pinsView.translatesAutoresizingMaskIntoConstraints = false
        pinsView.tag = 11
        pinsView.addTarget(self, action: #selector(onPINEditing(_:)), for: .editingDidEnd)
        imgView.addSubview(pinsView)
        
        imgView.addConstraints([
            
            pinsView.centerXAnchor.constraint(equalTo: imgView.centerXAnchor),
            pinsView.widthAnchor.constraint(equalTo: imgView.widthAnchor, multiplier: 0.9),
            pinsView.heightAnchor.constraint(equalToConstant: 35),
            pinsView.bottomAnchor.constraint(equalTo: imgView.bottomAnchor, constant: -50)
            
            ])
        
    }
   
    @IBAction func onPINEditing(_ sender: LKPINView) {
        
        if sender.tag == 11 {
            print("Programatically :: PIN is ---> \(sender.pinString)")
            
        } else {
            print("IBDesign :: PIN is ---> \(sender.pinString)")
            sender.resignFirstResponder()
            pinsView.becomeFirstResponder()
        }
        
        print("**************************************")
        
    }


}


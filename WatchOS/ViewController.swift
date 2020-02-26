//
//  ViewController.swift
//  WatchOS
//
//  Created by Catia Miranda de Souza on 19/02/20.
//  Copyright © 2020 Catia Miranda de Souza. All rights reserved.
//

import UIKit
import WatchConnectivity

class ViewController: UIViewController,WCSessionDelegate{
  
    @IBOutlet weak var cont: UILabel!
    
    var contador: Int = 0
    var wcSession: WCSession! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        wcSession = WCSession.default
        wcSession.delegate = self
        wcSession.activate()
        configBordas()
       
    }
    
    @IBAction func buttonMais(_ sender: Any) {
        
        let num = cont.text!
        let message = ["message" : num]
        
        contador += 1
        cont.text! = String(contador)
        
        wcSession.sendMessage(message, replyHandler: nil) { (error) in
            print(error.localizedDescription)
        }
       
    }
    @IBAction func buttonMenos(_ sender: Any) {
        let num = cont.text!
        let message = ["message" : num]
        
        if contador > 0{
            contador -= 1
            cont.text = String(contador)
            
            wcSession.sendMessage(message, replyHandler: nil) { (error) in
                print(error.localizedDescription)
            }
        }
    }
    func configBordas(){
        cont.layer.cornerRadius = 15
        cont.layer.masksToBounds = true
    }
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
          
      }
      
      func sessionDidBecomeInactive(_ session: WCSession) {
          
      }
      
      func sessionDidDeactivate(_ session: WCSession) {
          
      }
}



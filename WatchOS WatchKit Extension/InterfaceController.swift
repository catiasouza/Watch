//
//  InterfaceController.swift
//  WatchOS WatchKit Extension
//
//  Created by Catia Miranda de Souza on 19/02/20.
//  Copyright © 2020 Catia Miranda de Souza. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity


class InterfaceController: WKInterfaceController, WCSessionDelegate {
    
    @IBOutlet weak var contador: WKInterfaceLabel!
    var cont: Int = 0
    var soma: Int = 0
    
    var wcSession: WCSession!
   
    override func didDeactivate() {
        super.didDeactivate()
    }
    override func willActivate() {
        
        wcSession = WCSession.default
        wcSession.delegate = self
        wcSession.activate()
    }
    
    @IBAction func diminui() {
        
        if(cont > 0){
            cont -= 1
            contador.setText(String(cont))
        }
    }
    
    
    @IBAction func aumenta() {
        cont += 1
        contador.setText(String(cont))
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
       
        let text = message["message"] as! String
        self.contador.setText(text)
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
        
    }
}

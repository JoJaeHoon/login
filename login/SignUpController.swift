//
//  SignUpController.swift
//  login
//
//  Created by imgtech on 2018. 5. 9..
//  Copyright © 2018년 jjh. All rights reserved.
//

import UIKit
import RealmSwift

class Member : Object{
    @objc dynamic var email : String?
    @objc dynamic var password : String?
    @objc dynamic var isWhetherToJoin : Int = 0
    
//    override static func primaryKey() -> String?{
//        return "email"
//    }
}

class SignUpController: UIViewController{

    var location = CGPoint(x: 0, y: 0)
    @IBOutlet var fullScreen: UIView!
    @IBOutlet weak var popupView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        popupView.layer.cornerRadius = 10
        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let touchLocation = touch.location(in: popupView)
        
        if popupView.bounds.contains(touchLocation) == false {
             dismiss(animated: true, completion: nil)
        }
       
    }
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBAction func memberSave(_ sender: Any) {
        let member = Member()
        member.email = email.text
        member.password = password.text
        let realm = try! Realm()
        try? realm.write {
            realm.add(member)
        }
    }
    
}

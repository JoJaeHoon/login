//
//  ViewController.swift
//  login
//
//  Created by imgtech on 2018. 5. 5..
//  Copyright © 2018년 jjh. All rights reserved.
//

import UIKit
//import RealmSwift
//class MemberBean : Object{
//    @objc dynamic var userId = ""
//    //@objc dynamic var password = ""
//    @objc dynamic var age = 0
//}
//
//class MemberStore : Object {
//    @objc dynamic var userId = ""
//    var members = List<MemberBean>()
//}

class ViewController: UIViewController {
    @IBOutlet weak var iosTitle: UILabel!

    @IBOutlet weak var userId: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBAction func iosLogin(_ sender: Any) {
        iosTitle.text = "Hello world!"
        performSegue(withIdentifier: "loginCheck", sender:self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //var viewController2 = segue.destination as! ViewController2
        
    }
    
//    func member(userId: String, password: String){
//        let member = MemberBean()
//
//        member.userId = userId
//        member.password = password
//
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        let member = MemberBean()
//
//        member.userId = "jjh"
//        member.age = 1
//        
//        let realm = try! Realm()
//        let rM = realm.objects(MemberBean)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


//
//  AddController.swift
//  login
//
//  Created by imgtech on 2018. 5. 7..
//  Copyright © 2018년 jjh. All rights reserved.
//

import UIKit
import RealmSwift

class Contents : Object {
    @objc dynamic var comment = ""
}

class AddController: UIViewController
    , UIImagePickerControllerDelegate
    , UINavigationControllerDelegate{

    @IBOutlet weak var popupView: UIView!
    @IBOutlet weak var contentsImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        popupView.layer.cornerRadius = 10
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func imageUpload(_ sender: Any) {
        let myPickerController = UIImagePickerController()
        myPickerController.delegate = self
        myPickerController.sourceType = UIImagePickerControllerSourceType.photoLibrary
        myPickerController.allowsEditing = false
        self.present(myPickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        {
            contentsImage.image = image
        }
        else
        {
            
        }
        self.dismiss(animated: true, completion: nil)
//        contentsImage.image = info[UIImagePickerControllerOriginalImage] as? UIImage
//        contentsImage.backgroundColor = UIColor.clear
//        self.dismiss(animated: true, completion: nil)
//
//        self.upload()
    }
    
    func upload(){
        //var image = UIImageJPEGRepresentation(contentsImage, 1)
        
//        if(image == nil) {
//            return
//        }
    }
    
    @IBOutlet weak var comment: UITextView!
    @IBAction func documentSave(_ sender: Any) {
        let contents = Contents()
        contents.comment = comment.text

        let realm = try! Realm()
        try? realm.write{
            realm.add(contents)
        }
        
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        dismiss(animated: true, completion: nil)
        
        
        ViewController2.shared?.contentsTable.reloadData()
        
        _ = self.storyboard?.instantiateViewController(withIdentifier: "view2Id")
        //present(view!, animated: true, completion: nil)
        
    }
    
    @IBAction func documentClose(_ sender: UIButton) {
        let view = self.storyboard?.instantiateViewController(withIdentifier: "viewId")
        present(view!, animated: true, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let touchLocation = touch.location(in: popupView)
        
        if popupView.bounds.contains(touchLocation) == false {
            dismiss(animated: true, completion: nil)
        }
        
    }
    
}

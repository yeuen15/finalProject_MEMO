//
//  SaveViewController.swift
//  finalProject2_Yeeun
//
//  Created by yeuen on 22/06/2019.
//  Copyright © 2019 yeuen. All rights reserved.
//

import UIKit
import CoreData

class SaveViewController: UIViewController {
    @IBOutlet var textClass: UITextField!
    @IBOutlet var textName: UITextField!
    @IBOutlet var textDay: UITextField!
    @IBOutlet var textRoom: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func getContext () -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func savePressed(_ sender: UIBarButtonItem) {
        let context = getContext()
        let entity = NSEntityDescription.entity(forEntityName: "Class", in: context)
        // class record를 새로 생성함
        let object = NSManagedObject(entity: entity!, insertInto: context)
        object.setValue(textName.text, forKey: "name")
        object.setValue(textClass.text, forKey: "myclass")
        object.setValue(textDay.text, forKey: "day")
        object.setValue(textRoom.text, forKey: "room")
        
        do {
            try context.save()
            print("saved!")
        } catch let error as NSError {
            print("Could not save \(error), \(error.userInfo)")
        }
        // 현재의View를 없애고 이전 화면으로 복귀
        self.navigationController?.popViewController(animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

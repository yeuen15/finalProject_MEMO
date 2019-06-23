//
//  addMemoViewController.swift
//  finalProject2_Yeeun
//
//  Created by yeuen on 22/06/2019.
//  Copyright © 2019 yeuen. All rights reserved.
//

import UIKit
import CoreData

class addMemoViewController: UIViewController {

    @IBOutlet var bigText: UITextField!     //제목을 저장할 변수
    
    @IBOutlet var memoText: UITextView!     //메모를 저장할 변수
    
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
        // friend record를 새로 생성함
        let object = NSManagedObject(entity: entity!, insertInto: context)
        object.setValue(bigText.text, forKey: "bigText")
        object.setValue(memoText.text, forKey: "memoText")

        do {
            try context.save()
            print("saved!")
        } catch let error as NSError {
            print("Could not save \(error), \(error.userInfo)")
        }
        // 현재의View를 없애고 이전 화면으로 복귀
        self.navigationController?.popViewController(animated: true)
    }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */




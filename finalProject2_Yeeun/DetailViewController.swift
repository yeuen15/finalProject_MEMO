//
//  DetailViewController.swift
//  finalProject2_Yeeun
//
//  Created by yeuen on 22/06/2019.
//  Copyright © 2019 yeuen. All rights reserved.
//

import UIKit
import CoreData

class DetailViewController: UIViewController {

    @IBOutlet var detailBigText: UITextField!
    @IBOutlet var detailMemoText: UITextView!
    
    var detailMemo: NSManagedObject?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let memo = detailMemo {
            detailBigText.text = memo.value(forKey: "bigText") as? String
            detailMemoText.text = memo.value(forKey: "memoText") as? String
            
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

}

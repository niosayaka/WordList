//
//  AddViewController.swift
//  WordList
//
//  Created by 丹尾　沙也花 on 2018/04/12.
//  Copyright © 2018年 Lifeistech. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    
    @IBOutlet var englishTextField: UITextField!
    @IBOutlet var japaneseTextField: UITextField!
    
    var wordArray: [Dictionary<String, String>] = []
    
    let saveData = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if saveData.array(forKey: "WORD") != nil{
            wordArray = saveData.array(forKey: "WORD") as! [Dictionary<String, String>]
        }
    }
    
    @IBAction func saveWord() {
        let wordDictionary = ["english": englishTextField.text!, "japanese": japaneseTextField.text!]
        
        wordArray.append(wordDictionary)
        saveData.set(wordArray, forKey: "WORD")
        
        let alert = UIAlertController(
            title: "保存完了",
            message: "単語の保存が完了しました",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(
            title: "OK",
            style: .default,
            handler: nil
        ))
        self.present(alert, animated: true, completion: nil)
        englishTextField.text = ""
        japaneseTextField.text = ""
        

        // Do any additional setup after loading the view
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

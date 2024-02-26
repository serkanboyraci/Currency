//
//  ViewController.swift
//  Currency
//
//  Created by Ali serkan Boyracı  on 26.02.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cadLabel: UILabel!
    @IBOutlet weak var chfLabel: UILabel!
    @IBOutlet weak var gbpLabel: UILabel!
    @IBOutlet weak var jpyLabel: UILabel!
    @IBOutlet weak var usdLabel: UILabel!
    @IBOutlet weak var tryLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func getRates(_ sender: Any) {
        //1 reguest & session
        // 2 response & Data
        // 3 parsing & JSON serialization
        
        
        // 1
        let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/CurrencyData/main/currency.json")
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url!) { (data, response, error) in // what you write in pranathesis, you can use it in code blocks
            if error != nil {
                let alert = UIAlertController(title: "Error!", message: error?.localizedDescription, preferredStyle: .alert)
                let okButton = UIAlertAction(title: "OK", style: .default)
                alert.addAction(okButton)
                self.present(alert, animated: true)
            } else {
                
        //2
                if data != nil {
                    do {
                        let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! Dictionary<String, Any>
                        // ASYNC
                        DispatchQueue.main.async {
                            if let rates = jsonResponse["rates"] as? [String : Any] {
                                //print(rates)
                                if let cad = rates["CAD"] as? Double { //to take value we must cast as a Double or String
                                    self.cadLabel.text = "CAD: \(cad)"
                                }
                                if let chf = rates["CHF"] as? Double { //to take value we must cast as a Double or String
                                    self.chfLabel.text = "CHF: \(chf)"
                                }
                                if let gbp = rates["GBP"] as? Double { //to take value we must cast as a Double or String
                                    self.gbpLabel.text = "GBP: \(gbp)"
                                }
                                if let jpy = rates["JPY"] as? Double { //to take value we must cast as a Double or String
                                    self.jpyLabel.text = "JPY: \(jpy)"
                                }
                                if let usd = rates["USD"] as? Double { //to take value we must cast as a Double or String
                                    self.usdLabel.text = "USD: \(usd)"
                                }
                                if let trl = rates["TRY"] as? Double { //to take value we must cast as a Double or String
                                    self.tryLabel.text = "TRY: \(trl)"
                                }
                            }
                            if let date = jsonResponse["date"] as? String {
                                self.dateLabel.text = "Date: \(date)"
                                
                            }
                        }
                        
                    } catch {
                        print("error!")
                    }
                   
                    
                    
                }
                
                
                
                
                
                
                
            }
        }
        task.resume() // to run smoothly to work task.
        
        
    }
    

}


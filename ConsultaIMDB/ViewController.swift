//
//  ViewController.swift
//  ConsultaIMDB
//
//  Created by Alejandro Barreto on 1/12/15.
//  Copyright © 2015 Arbo Corporation. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var imdbCode: UITextField!
    
    var results: NSDictionary?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //obtieneTitulo()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func consultarPrecio(sender: AnyObject) {
        let urls = "http://www.omdbapi.com/?i=\(imdbCode.text!)&plot=short&r=json"
        print (urls)
        Alamofire.request(.GET, urls).responseJSON
            { respuesta in
                
                if respuesta.result.isSuccess{
                    if let data = respuesta.result.value{
                        if  data["Response"]!!.description != "False"{
                            self.results = data as? NSDictionary
                            self.performSegueWithIdentifier("results", sender: nil)
                        }else{
                            let alertController = UIAlertController(title: "Pelicula invalida", message:
                                "Debe introducir un codigo valido", preferredStyle: UIAlertControllerStyle.Alert)
                            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
                            
                            self.presentViewController(alertController, animated: true, completion: nil)
                        }
                    }
                }
        }
        
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let resultsViewController = segue.destinationViewController as! QueryResultViewController;
        resultsViewController.results = self.results
    }


}


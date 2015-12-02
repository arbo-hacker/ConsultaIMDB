//
//  QueryResultViewController.swift
//  ConsultaIMDB
//
//  Created by Johan Hernandez on 12/1/15.
//  Copyright © 2015 Arbo Corporation. All rights reserved.
//

import UIKit

class QueryResultViewController: UIViewController {
    var results:NSDictionary?
    @IBOutlet weak var titulo: UILabel!
    @IBOutlet weak var año: UILabel!
    @IBOutlet weak var duracion: UILabel!
    @IBOutlet weak var genero: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        let data = self.results!
        self.titulo.text = data["Title"]!.description
        self.año.text = String( data["Year"]!.description)
        self.duracion.text = String( data["Runtime"]!.description)
        self.genero.text = String( data["Genre"]!.description)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

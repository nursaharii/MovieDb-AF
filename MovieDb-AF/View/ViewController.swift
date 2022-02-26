//
//  ViewController.swift
//  MovieDb-AF
//
//  Created by Nurşah on 26.02.2022.
//

import UIKit

class ViewController: UIViewController {
    
   // lazy var carousel =
    var category = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toListVC" {
            let destinationVC = segue.destination as! TableViewController
            destinationVC.category = category
        }
    }

    @IBAction func upcomingBtn(_ sender: Any) {
        category = 1
        performSegue(withIdentifier: "toListVC", sender: nil)
    }
    
    @IBAction func nowplayingBtn(_ sender: Any) {
        category = 2
        performSegue(withIdentifier: "toListVC", sender: nil)
    }
    @IBAction func popularBtn(_ sender: Any) {
        category = 3
        performSegue(withIdentifier: "toListVC", sender: nil)
    }
    @IBAction func topratedBtn(_ sender: Any) {
        category = 4
        performSegue(withIdentifier: "toListVC", sender: nil)
    }
    
}


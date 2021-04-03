//
//  MainViewController.swift
//  GB_Maps
//
//  Created by Alexander Myskin on 03.04.2021.
//

import UIKit

class MainViewController: UIViewController {

    @IBAction func showMap(_ sender: Any) {
        performSegue(withIdentifier: "toMap", sender: sender)
    }

    @IBAction func logout(_ sender: Any) {
        UserDefaults.standard.set(false, forKey: "isLogin")
        performSegue(withIdentifier: "toLaunch", sender: sender)
    }
}

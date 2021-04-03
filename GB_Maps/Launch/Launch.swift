//
//  Launch.swift
//  GB_Maps
//
//  Created by Alexander Myskin on 03.04.2021.
//

import UIKit

class Launch: UIViewController {

    override func viewDidAppear(_ animated: Bool) {
        if UserDefaults.standard.bool(forKey: "isLogin") {
            performSegue(withIdentifier: "toMain", sender: self)
        } else {
            performSegue(withIdentifier: "toAuth", sender: self)
        }
    }
}

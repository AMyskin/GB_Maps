//
//  MainViewController.swift
//  GB_Maps
//
//  Created by Alexander Myskin on 03.04.2021.
//

import UIKit

class MainViewController: UIViewController {

    var usselesExampleVariable = ""

    @IBAction func showMap(_ sender: Any) {
        router.toMap(usseles: "пример")
    }
    
    @IBAction func logout(_ sender: Any) {
        UserDefaults.standard.set(false, forKey: "isLogin")
        router.toLaunch()
    }
    @IBOutlet weak var router: MainRouter!


    override func viewDidLoad() {
        view.backgroundColor = .white
    }
}

final class MainRouter: BaseRouter {
    func toMap(usseles: String) {
        let controller = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(MainViewController.self)

        //controller.usselesExampleVariable = usseles

        show(controller)
    }

    func toLaunch() {
        let controller = UIStoryboard(name: "Auth", bundle: nil)
            .instantiateViewController(LoginViewController.self)
        setAsRoot(UINavigationController(rootViewController: controller))
    }
}

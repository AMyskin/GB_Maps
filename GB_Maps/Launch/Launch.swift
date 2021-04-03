//
//  Launch.swift
//  GB_Maps
//
//  Created by Alexander Myskin on 03.04.2021.
//

import UIKit

class Launch: UIViewController {

    @IBOutlet weak var router: LaunchRouter!

    override func viewDidLoad() {
        super.viewDidLoad()
        if UserDefaults.standard.bool(forKey: "isLogin") {
            router.toMain()
        } else {
            router.toAuth()
        }
    }
}

final class LaunchRouter: BaseRouter {

    func toMain() {
        perform(segue: "toMain")
    }

    func toAuth() {
        perform(segue: "toAuth")
    }

}

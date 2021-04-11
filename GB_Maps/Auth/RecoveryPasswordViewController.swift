//
//  RecoveryPasswordViewController.swift
//  GB_Maps
//
//  Created by Alexander Myskin on 03.04.2021.
//

import UIKit

class RecoveryPasswordViewController: UIViewController {

    //MARK: - Constants and Variables
    let userRepository = UserRepository()
    
    @IBOutlet weak var loginView: UITextField!

        @IBAction func recovery(_ sender: Any) {
            guard
                let login = loginView.text,
                let user = try? userRepository.searchUser(login: login),
                !user.isEmpty
            else {

                    return
            }

            showPassword(user: user)
        }

        private func showPassword(user: [User]) {
            let alert = UIAlertController(title: "Пароль", message: "\(user[0].password)", preferredStyle: .alert)

            let ok = UIAlertAction(title: "OK", style: .cancel)
            alert.addAction(ok)
            present(alert, animated: true)
        }


}

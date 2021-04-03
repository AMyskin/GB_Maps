//
//  LoginViewController.swift
//  GB_Maps
//
//  Created by Alexander Myskin on 03.04.2021.
//

import UIKit

class LoginViewController: UIViewController {

    enum Constants {
            static let login = "admin"
            static let password = "123456"
        }

        @IBOutlet weak var loginView: UITextField!
        @IBOutlet weak var passwordView: UITextField!


        @IBAction func login(_ sender: Any) {
            guard
                let login = loginView.text,
                let password = passwordView.text,
                login == Constants.login && password == Constants.password
            else {
                return
            }

            print("Логин")
        }

        @IBAction func recovery(_ sender: Any) {

        }


}

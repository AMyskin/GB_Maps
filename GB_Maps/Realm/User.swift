//
//  User.swift
//  GB_Maps
//
//  Created by Alexander Myskin on 03.04.2021.
//

import Foundation
import RealmSwift

class User: Object {
    @objc dynamic var login = ""
    @objc dynamic var password = ""

    override static func primaryKey() -> String? {
            return "login"
        }
}

//
//  RootSegue.swift
//  GB_Maps
//
//  Created by Alexander Myskin on 03.04.2021.
//

import UIKit

class RootSegue: UIStoryboardSegue {

    override func perform() {
//        let keyWindow = UIApplication.shared.connectedScenes
//                .filter({$0.activationState == .foregroundActive})
//                .map({$0 as? UIWindowScene})
//                .compactMap({$0})
//                .first?.windows
//                .filter({$0.isKeyWindow}).first
//        keyWindow?.endEditing(true)
//
//        keyWindow?.rootViewController = destination

        UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.rootViewController = destination

        //UIApplication.shared.keyWindow?.rootViewController = destination
    }

}

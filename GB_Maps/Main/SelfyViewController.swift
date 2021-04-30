//
//  SelfyViewController.swift
//  GB_Maps
//
//  Created by Alexander Myskin on 25.04.2021.
//

import UIKit

class SelfyViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    var image: UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = image
    }
}

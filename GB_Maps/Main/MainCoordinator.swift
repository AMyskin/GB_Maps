//
//  MainCoordinator.swift
//  GB_Maps
//
//  Created by Alexander Myskin on 03.04.2021.
//

import UIKit

final class MainCoordinator: BaseCoordinator {

    var rootController: UINavigationController?
    var onFinishFlow: (() -> Void)?

    override func start() {
        showMainModule()
    }

    private func showMainModule() {
        let controller = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(MainViewController.self)

        controller.onMap = { [weak self] usseles in
            self?.showMapModule(usseles: usseles)
        }

        controller.onLogout = { [weak self] in
            self?.onFinishFlow?()
        }

        controller.onTakePicture = { [weak self] image in
            self?.funcShowSelfyModule(image: image)
        }

        let rootController = UINavigationController(rootViewController: controller)
        setAsRoot(rootController)
        self.rootController = rootController
    }

    private func showMapModule(usseles: String) {
        let controller = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(ViewController.self)

        controller.usselesExampleVariable = usseles

        rootController?.pushViewController(controller, animated: true)
    }

    private func funcShowSelfyModule(image: UIImage) {
        let controller = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(SelfyViewController.self)

        controller.image = image
        rootController?.pushViewController(controller, animated: true)
    }

    private func showPhotoModule() {
        let controller = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(PhotoViewController.self)
        controller.onTakePicture = { [weak self] image in
            self?.showSelfyModule(image: image)

        }
        rootController?.pushViewController(controller, animated: true)
    }

}

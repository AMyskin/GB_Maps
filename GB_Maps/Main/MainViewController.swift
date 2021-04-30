//
//  MainViewController.swift
//  GB_Maps
//
//  Created by Alexander Myskin on 03.04.2021.
//

import UIKit

class MainViewController: UIViewController {

    var onMap: ((String) -> Void)?
    var onLogout: (() -> Void)?
    var onTakePicture: ((UIImage) -> Void)?

    @IBAction func showMap(_ sender: Any) {
        onMap?("пример")
    }
    
    @IBAction func logout(_ sender: Any) {
        UserDefaults.standard.set(false, forKey: "isLogin")
        onLogout?()
    }

    @IBAction func takePicture(_ sender: Any) {
        guard UIImagePickerController.isSourceTypeAvailable(.photoLibrary) else { return }
         // Создаём контроллер и настраиваем его
         let imagePickerController = UIImagePickerController()
         // Источник изображений: камера
         imagePickerController.sourceType = .photoLibrary
         // Изображение можно редактировать
         imagePickerController.allowsEditing = true
         imagePickerController.delegate = self

         // Показываем контроллер
         present(imagePickerController, animated: true)
    }

}

extension MainViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
// Если нажали на кнопку Отмена, то UIImagePickerController надо закрыть
        picker.dismiss(animated: true)
    }

    private func imagePickerController(
        _ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String: Any]) {
// Мы получили медиа от контроллера
// Изображение надо достать из словаря info
        let image = extractImage(from: info)
        print(image!)
// Закрываем UIImagePickerController
        picker.dismiss(animated: true)
    }

// Метод, извлекающий изображение
    private func extractImage(from info: [String: Any]) -> UIImage? {
// Пытаемся извлечь отредактированное изображение
        if let image = info[UIImagePickerControllerEditedImage] as? UIImage {
            return image
// Пытаемся извлечь оригинальное
        } else if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            return image
        } else {
// Если изображение не получено, возвращаем nil
            return nil
        }
    }
}

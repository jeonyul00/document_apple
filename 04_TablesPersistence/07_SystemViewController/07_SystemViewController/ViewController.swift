//
//  ViewController.swift
//  07_SystemViewController
//
//  Created by 전율 on 2023/12/07.
//

import UIKit
import SafariServices
import MessageUI

class ViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate, MFMailComposeViewControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func shareButtonTapped(_ sender: Any) {
        guard let image = imageView.image else { return }
        let activityController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        activityController.popoverPresentationController?.sourceView = sender as! UIButton
        present(activityController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.originalImage] as? UIImage else { return }        
        imageView.image = selectedImage
        dismiss(animated: true,completion: nil)
    }
    
    @IBAction func safariButtonTapped(_ sender: Any) {
        if let url = URL(string: "http://www.apple.com") {
            let safariViewController = SFSafariViewController(url: url)
            present(safariViewController, animated: true, completion: nil)
        }
    }
    
    @IBAction func cameraButtonTapped(_ sender: Any) {
        let alertController = UIAlertController(title: "choose image source", message: "nil", preferredStyle: .actionSheet)
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        let cancelAction = UIAlertAction(title: "Cancle", style: .cancel,handler: nil)
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let cameraAction = UIAlertAction(title: "Camera", style: .default) { action in
                imagePicker.sourceType = .camera
                self.present(imagePicker, animated: true, completion: nil)
            }
            alertController.addAction(cameraAction)
        }
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            let photoAction = UIAlertAction(title: "Library", style: .default) { action in
                imagePicker.sourceType = .photoLibrary
                self.present(imagePicker, animated: true, completion: nil)
            }
            alertController.addAction(photoAction)
        }
        
        alertController.addAction(cancelAction)
        alertController.popoverPresentationController?.sourceView = sender as! UIButton
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func emailButtonTapped(_ sender: Any) {
        if !MFMailComposeViewController.canSendMail() {
            print("can not send mail")
            return
        }
        let mailComposer = MFMailComposeViewController()
        mailComposer.delegate = self
        
        mailComposer.setToRecipients(["jeonyul00@gmail.com"])
        mailComposer.setSubject("help needed")
        mailComposer.setMessageBody("hi", isHTML: false)
        self.present(mailComposer, animated: true)
    }
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        dismiss(animated: true)
    }
    
}


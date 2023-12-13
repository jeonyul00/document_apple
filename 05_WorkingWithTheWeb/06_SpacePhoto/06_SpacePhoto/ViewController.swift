//
//  ViewController.swift
//  06_SpacePhoto
//
//  Created by 전율 on 2023/12/13.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var copyrightLabel: UILabel!
    
    let photoInfoController = PhotoInfoController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionLabel.text = ""
        copyrightLabel.text = ""
        photoInfoController.fetchPhotoInfo { PhotoInfo in
            guard let PhotoInfo = PhotoInfo else { return }
            self.updateUI(with: PhotoInfo)
        }
    }
    
    func updateUI(with photoInfo:PhotoInfo){
        let task = URLSession.shared.dataTask(with:photoInfo.url) {
            (data, response, error) -> Void in guard let data = data, let image = UIImage(data:data) else { return }
                DispatchQueue.main.async {
                    self.title = photoInfo.title
                    self.imageView.image = image
                    self.descriptionLabel.text = photoInfo.description
                    if let copyright = photoInfo.copyright {
                        self.copyrightLabel.text = "copyright : \(copyright)"
                    } else {
                        self.copyrightLabel.isHidden = true
                    }
                }
        }
        task.resume()
    }
}


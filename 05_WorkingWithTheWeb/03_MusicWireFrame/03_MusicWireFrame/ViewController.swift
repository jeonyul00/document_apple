//
//  ViewController.swift
//  03_MusicWireFrame
//
//  Created by 전율 on 2023/12/12.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var albumImageView: UIImageView!
    @IBOutlet weak var reverseBackground: UIView!
    @IBOutlet weak var playPauseBackground: UIView!
    @IBOutlet weak var forwardBackground: UIView!
    @IBOutlet weak var playPauseButton: UIButton!
    @IBOutlet weak var forwardButton: UIButton!
    @IBOutlet weak var reverseButton: UIButton!
    
    var isPlaying:Bool = true {
        didSet {
            if isPlaying {
                playPauseButton.setImage(UIImage(named: "pause")!, for: .normal)
            } else {
                playPauseButton.setImage(UIImage(named: "play")!, for: .normal)
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reverseBackground.layer.cornerRadius = 35.0
        reverseBackground.clipsToBounds = true
        playPauseBackground.layer.cornerRadius = 35.0
        playPauseBackground.clipsToBounds = true
        forwardBackground.layer.cornerRadius = 35.0
        forwardBackground.clipsToBounds = true
    }


    @IBAction func playPauseButtonTapped(_ sender: Any) {
        if isPlaying {
            UIView.animate(withDuration: 0.5) {
                self.albumImageView.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            }
        } else {
            UIView.animate(withDuration: 0.5) {
                self.albumImageView.transform = CGAffineTransform.identity
            }
        }
        isPlaying.toggle()
    }
    
}


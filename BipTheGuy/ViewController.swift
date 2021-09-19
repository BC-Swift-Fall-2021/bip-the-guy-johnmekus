//
//  ViewController.swift
//  BipTheGuy
//
//  Created by John Mekus on 9/19/21.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var audioPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func playSound(name: String)
    {
        if let sound = NSDataAsset(name: name)
        {
            do
            {
                try audioPlayer = AVAudioPlayer(data: sound.data)
                audioPlayer.play()
            }
            catch
            {
                print("ERROR: \(error.localizedDescription) Could not real error from file sound0.")
            }
        }
        else
        {
            print("ERROR: Could not real error from file sound0.")
        }
    }
    
    func showAlert(title: String, message: String)
    {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }

    @IBAction func photoOrCameraPressed(_ sender: UIButton)
    {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default)
        { _ in
            print("You Clicked Photo Library")
        }
        
        let cameraAction = UIAlertAction(title: "Camera", style: .default)
        { _ in
            print("You Clicked Camera")
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(photoLibraryAction)
        alertController.addAction(cameraAction)
        alertController.addAction(cancelAction)
        
        present( alertController, animated: true, completion: nil)
        
    }
    
    
    @IBAction func imageTapped(_ sender: UITapGestureRecognizer)
    {
        let originalImageView = imageView.frame
        let imageWidthShrink: CGFloat = 20
        let imageHeightShrinnk: CGFloat = 20
        let smallerImageFrame = CGRect(x: imageView.frame.origin.x + imageWidthShrink,
          y: imageView.frame.origin.y + imageHeightShrinnk,
          width: imageView.frame.width - (imageWidthShrink * 2),
          height: imageView.frame.height - (imageHeightShrinnk * 2))
        imageView.frame = smallerImageFrame
        playSound(name: "punchSound")
        UIView.animate(withDuration: 0.25,
                       delay: 0.0,
                       usingSpringWithDamping: 0.2,
                       initialSpringVelocity: 10.0,
                       options: [],
                       animations: {self.imageView.frame = originalImageView},
                       completion: nil)
    }
}


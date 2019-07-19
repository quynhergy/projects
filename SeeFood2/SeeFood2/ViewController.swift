//
//  ViewController.swift
//  SeeFood2
//
//  Created by Quynh Nguyen on 7/18/19.
//  Copyright © 2019 Quynh Nguyen. All rights reserved.
//

import UIKit
import VisualRecognition
import SVProgressHUD
import Social

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var cameraBtn: UIBarButtonItem!
    @IBOutlet weak var shareBtn: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var topBarImageView: UIImageView!
   
    
    let imagePicker = UIImagePickerController()
    var classificationResults: [String] = []
    //let apiKey = "[add key]"
    let version = "2019-07-18"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        shareBtn.isHidden = true
        imagePicker.delegate = self
    }
    
    @IBAction func shareTapped(_ sender: Any) {
        
    }
    
    @IBAction func cameraTapped(_ sender: UIBarButtonItem) {
        imagePicker.sourceType = .camera
        imagePicker.allowsEditing = false
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        cameraBtn.isEnabled = false
        SVProgressHUD.show()
        
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView.image = image
            imagePicker.dismiss(animated: true, completion: nil)
            
            let visualRecognition = VisualRecognition(version: version, apiKey: apiKey)
            
            let imageData = image.jpegData(compressionQuality: 0.01)
            let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            let fileURL = documentsURL.appendingPathComponent("tempImage.jpg")
            
            try? imageData?.write(to: fileURL, options: [])
            
            visualRecognition.classify(imagesFile: fileURL) { (classifiedImages) in
                let classes = classifiedImages.images.first!.classifiers.first!.classes
                
                self.classificationResults = []
                for index in 0..<classes.count {
                    self.classificationResults.append(classes[index].className)
                }
                
                DispatchQueue.main.async {
                    self.cameraBtn.isEnabled = true
                    SVProgressHUD.dismiss()
                    self.shareBtn.isHidden = false
                }
                
                if self.classificationResults.contains("hotdog") {
                    DispatchQueue.main.async {
                        self.navigationItem.title = "Hotdog!"
                        self.navigationController?.navigationBar.barTintColor = UIColor.green
                        self.navigationController?.navigationBar.isTranslucent = false
                        self.topBarImageView.image = UIImage(named: "hotdog")
                    }
                } else {
                    DispatchQueue.main.async {
                        self.navigationItem.title = "Not Hotdog!"
                        self.navigationController?.navigationBar.barTintColor = UIColor.red
                        self.navigationController?.navigationBar.isTranslucent = false
                        self.topBarImageView.image = UIImage(named: "not-hotdog")
                    }
                }
            }
            
        } else {
            print("There was an error picking the image.")
        }
    }
    
}


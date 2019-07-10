//
//  ViewController.swift
//  WhatFlower
//
//  Created by Quynh Nguyen on 7/1/19.
//  Copyright © 2019 Quynh Nguyen. All rights reserved.
//

import UIKit
import CoreML
import Vision
import Alamofire
import SwiftyJSON
import SDWebImage

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    private let imagePicker = UIImagePickerController()
    private let wikipediaURL = "https://en.wikipedia.org/w/api.php"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let userPickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            guard let ciImage = CIImage(image: userPickedImage) else {
                fatalError("Could not convert image to CIImage")
            }
            detect(image: ciImage)
        }
        
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cameraTapped(_ sender: UIBarButtonItem) {
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    private func detect(image: CIImage) {
        guard let model = try? VNCoreMLModel(for: FlowerClassifer().model) else {
            fatalError("Failed loading CoreML Model")
        }
        
        let request = VNCoreMLRequest(model: model) { (request, error) in
            guard let classification = request.results?.first as? VNClassificationObservation else {
                fatalError("Could not classify image.")
            }
            self.requestInfo(flowerName: classification.identifier)
            self.navigationItem.title = classification.identifier.capitalized
        }
        
        let handler = VNImageRequestHandler(ciImage: image)
        
        do {
            try handler.perform([request])
        } catch {
            print(error)
        }
    }
    
    private func requestInfo(flowerName: String) {
        
        let parameters : [String:String] = [
            "format" : "json",
            "action" : "query",
            "prop" : "extracts|pageimages",
            "exintro" : "",
            "explaintext" : "",
            "titles" : flowerName,
            "indexpageids" : "",
            "redirects" : "1",
            "pithumbsize" : "500"
        ]
        
        Alamofire.request(wikipediaURL, method: .get, parameters: parameters).responseJSON { (response) in
            if response.result.isSuccess {
                print("Success! Got the wikipedia info.")
                let wikiJSON : JSON = JSON(response.result.value!)
                let pageid = wikiJSON["query"]["pageids"][0].stringValue
                let flowerDescription = wikiJSON["query"]["pages"][pageid]["extract"].stringValue
                let flowerImageURL = wikiJSON["query"]["pages"][pageid]["thumbnail"]["source"].stringValue
                self.imageView.sd_setImage(with: URL(string: flowerImageURL))
                self.label.text = flowerDescription
            } else {
                print("Error: \(String(describing: response.result.error))")
            }
        }
    }
}


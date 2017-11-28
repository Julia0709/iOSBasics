//
//  ViewController.swift
//  Networking
//
//  Created by Julia on 2017/10/18.
//  Copyright © 2017 Julia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var rootView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        if let url = URL(string: "http://imgur.com/y9MIaCS.png") {
            rootView.contentMode = .scaleAspectFit
            downloadImage(url: url)
        }
        print("Image shows up when finish downloading")
    }
    
    func downloadImage(url: URL) {
        // Download start
        getDataFromUrl(url: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Downloading error")
                return
            }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            // Display image on view
            DispatchQueue.main.async() {
                self.addImageView(data: data)
            }
        }
    }
    
    func getDataFromUrl(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            completion(data, response, error)
            }.resume()
    }
    
    func addImageView(data: Data) {
        let imageView = UIImageView(image: UIImage(data: data))
        imageView.frame = CGRect(
            x: 0,
            y: 0,
            width: UIScreen.main.bounds.width,
            height: UIScreen.main.bounds.height
        )
        rootView.addSubview(imageView)
    }
}


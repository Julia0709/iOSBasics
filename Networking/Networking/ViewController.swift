//
//  ViewController.swift
//  Networking
//
//  Created by Julia on 2017/10/18.
//  Copyright © 2017 Julia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        if let url = URL(string: "http://imgur.com/y9MIaCS.png") {
//            imageView.contentMode = .scaleAspectFit
            downloadImage(url: url)
        }
        print("End of code. The image will continue downloading in the background and it will be loaded when it ends.")
    }

    func getDataFromUrl(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            completion(data, response, error)
            }.resume()
    }
    
    func downloadImage(url: URL) {
        // Download start
        getDataFromUrl(url: url) { data, response, error in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            // Display on view
            DispatchQueue.main.async() {
                print(data)
//                self.imageView.image = UIImage(data: data)
            }
        }
    }
}


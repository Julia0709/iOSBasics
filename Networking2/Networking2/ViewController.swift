//
//  ViewController.swift
//  Networking2
//
//  Created by Julia on 2017/10/19.
//  Copyright © 2017 Julia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var repos = [Repo]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://api.github.com/users/julia0709/repos")!
        GithubAPI.fetchData(url: url) {(repos) in
            self.repos = repos
        }
    }
}


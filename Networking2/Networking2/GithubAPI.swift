//
//  GithubAPI.swift
//  Networking2
//
//  Created by Julia on 2017/10/19.
//  Copyright © 2017 Julia. All rights reserved.
//

import UIKit

class GithubAPI {
    
    static func fetchData(url: URL, completion: @escaping ([Repo]) -> ()) {
        var repos = [Repo]()
        let request = URLRequest(url: url)
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            if (error != nil) {
                print(String(describing: error?.localizedDescription))
                return
            }
            guard let data = data else {
                return
            }
            do {
                let jsonArray = try JSONSerialization.jsonObject(with: data, options: []) as! [[String: Any]]
                for repo in jsonArray {
                    let id = repo["id"] as! Int
                    let name = repo["name"] as! String
                    repos.append(Repo(id: id, name: name))
                }
                
                DispatchQueue.main.async() {
                    completion(repos)
                    print(data)
                }
            } catch {
                print("JSON Error")
            }
        }
        
        func getDataFromUrl(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                completion(data, response, error)
                }.resume()
            }
    }
}

//
//  PlaidgeckoCactus.swift
//  TableView
//
//  Created by Julia on 2017/09/25.
//  Copyright © 2017 Julia. All rights reserved.
//

import UIKit

enum ScaryFactor: Int {
    case NotScary
    case ALittleScary
    case AverageScary
    case QuiteScary
    case Aiiiiieeeee
}

struct PlaidgeckoCactus {
    let name: String
    var image: String
    var howScary = ScaryFactor.NotScary
    
    init(withName name: String, imageName image: String?,  howScary: ScaryFactor) {
        self.name = name
        self.howScary = howScary
        self.image = image!
    }
    
    // (Swift2)
    static func scaryFactorToString(scaryFactor: ScaryFactor) -> String {
        var scaryString = ""
        
        switch(scaryFactor) {
        case .NotScary:
            scaryString = "Not scary"
        case .ALittleScary:
            scaryString = "A little scary"
        case .AverageScary:
            scaryString = "Average scariness"
        case .QuiteScary:
            scaryString = "Quite scary"
        case .Aiiiiieeeee:
            scaryString = "AIIIIIEEEEEEE!!"
        }
        
        return scaryString
    }
    
    static func cactus() -> [PlaidgeckoCactus] {
        var cactus = [PlaidgeckoCactus]()
        
        cactus.append(PlaidgeckoCactus(withName: "Aloe Leafy", imageName: "aloe-leafy.png", howScary: .AverageScary))
        cactus.append(PlaidgeckoCactus(withName: "Blooms Pottery", imageName: "blooms-pottery.png", howScary: .NotScary))
        cactus.append(PlaidgeckoCactus(withName: "Cacti Bowl", imageName: "cacti-bowl.png", howScary: .QuiteScary))
        cactus.append(PlaidgeckoCactus(withName: "Cacti Purple Flower", imageName: "cacti-purple-flower.png", howScary: .Aiiiiieeeee))
        cactus.append(PlaidgeckoCactus(withName: "Cacti Super Tall", imageName: "cacti-super-tall.png", howScary: .QuiteScary))
        cactus.append(PlaidgeckoCactus(withName: "Climbing Branches", imageName: "climbing-branches.png", howScary: .ALittleScary))
        cactus.append(PlaidgeckoCactus(withName: "Garden Pail", imageName: "garden-pail.png", howScary: .AverageScary))
        cactus.append(PlaidgeckoCactus(withName: "Green Layered Leaves", imageName: "green-layered-leaves.png", howScary: .NotScary))
        cactus.append(PlaidgeckoCactus(withName: "Light and Spiney", imageName: "light-and-spiney.png", howScary: .AverageScary))
        cactus.append(PlaidgeckoCactus(withName: "Lightbulb", imageName: "lightbulb.png", howScary: .QuiteScary))
        cactus.append(PlaidgeckoCactus(withName: "Pastel Bloom", imageName: "pastel-bloom.png", howScary: .QuiteScary))
        cactus.append(PlaidgeckoCactus(withName: "Prickly Cucumber", imageName: "prickly-cucumber.png", howScary: .NotScary))
        cactus.append(PlaidgeckoCactus(withName: "Red Clouds", imageName: "red-clouds.png", howScary: .AverageScary))
        cactus.append(PlaidgeckoCactus(withName: "Short Square", imageName: "short-square.png", howScary: .Aiiiiieeeee))
        cactus.append(PlaidgeckoCactus(withName: "Spiney Orange", imageName: "spiney-orange.png", howScary: .QuiteScary))
        cactus.append(PlaidgeckoCactus(withName: "Standard Tall", imageName: "standard-tall.png", howScary: .NotScary))
        cactus.append(PlaidgeckoCactus(withName: "Tall and Flat", imageName: "tall-and-flat.png", howScary: .QuiteScary))
        cactus.append(PlaidgeckoCactus(withName: "Tall and Purple", imageName: "tall-and-purple.png", howScary: .QuiteScary))
        cactus.append(PlaidgeckoCactus(withName: "Topview Blue Pufferfish", imageName: "topview-blue-pufferfish.png", howScary: .Aiiiiieeeee))
        cactus.append(PlaidgeckoCactus(withName: "Topview Pointed Magenta", imageName: "topview-pointed-magenta.png", howScary: .AverageScary))
        cactus.append(PlaidgeckoCactus(withName: "Topview Pom Poms", imageName: "topview-pom-poms.png", howScary: .AverageScary))
        cactus.append(PlaidgeckoCactus(withName: "Topview Porcupine Trio", imageName: "topview-porcupine-trio.png", howScary: .ALittleScary))
        cactus.append(PlaidgeckoCactus(withName: "Topview Spiral", imageName: "topview-spiral.png", howScary: .ALittleScary))
        cactus.append(PlaidgeckoCactus(withName: "Topview Tall Flat", imageName: "topview-tall-flat.png", howScary: .ALittleScary))
        cactus.append(PlaidgeckoCactus(withName: "Wooden Crate Green Sticks", imageName: "wooden-crate-green-sticks.png", howScary: .ALittleScary))
        
        return cactus
    }
}

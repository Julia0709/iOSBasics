//
//  ParksDataSource.swift
//  NationalParks
//
//  Created by Derrick Park on 2017-10-02.
//  Copyright © 2017 Derrick Park. All rights reserved.
//

import Foundation

class ParksDataSource {
    private var parks: [Park] = []
    private var immutableParks: [Park] = []
    private var sections: [String] = []
    var count: Int {
        return parks.count
    }
    var numberOfSections: Int {
        return sections.count
    }
    
    init() {
        parks = loadParksFromDisk()
        immutableParks = parks
        
    }
    
    func numberOfParksInSection(_ section: Int) -> Int {
        let nationalParks = parksForSection(section)
        return nationalParks.count
    }
    
    func parkForItemAtIndexPath(_ indexPath: IndexPath) -> Park? {
        if indexPath.section > 0 {
            let nationalPark = parksForSection(indexPath.section)
            return nationalPark[indexPath.item]
        } else {
            return parks[indexPath.item]
        }
    }
    
    func titleForSectionAtIndexPath(_ indexPath: IndexPath) -> String? {
        if indexPath.section < sections.count {
            return sections[indexPath.section]
        }
        return nil
    }
    
    fileprivate func parksForSection(_ section: Int) -> [Park] {
        let state = sections[section]
        let parksInSection = parks.filter { (park: Park) -> Bool in
            return park.state == state
        }
        return parksInSection
    }

    fileprivate func loadParksFromDisk() -> [Park] {
        sections.removeAll(keepingCapacity: false)
        
        if let path = Bundle.main.path(forResource: "ParksData", ofType: "plist") {
            
            if let dictArray = NSArray(contentsOfFile: path) {
                var nationalParks: [Park] = []
                for item in dictArray {
                    if let dict = item as? NSDictionary {
                        let name = dict["name"] as! String
                        let state = dict["state"] as! String
                        let date = dict["date"] as! String
                        let photo = dict["photo"] as! String
                        let index = dict["index"] as! Int
                        
                        let park = Park(name: name, state: state, date: date, photo: photo, index: index)
                        
                        if !sections.contains(state) {
                            sections.append(state)
                        }
                        nationalParks.append(park)
                    }
                }
                return nationalParks
            }
        } else {
            print("Not getting parks")
        }
        return []
    }
}

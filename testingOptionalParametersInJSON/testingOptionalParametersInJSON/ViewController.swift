//
//  ViewController.swift
//  testingOptionalParametersInJSON
//
//  Created by Nicholas Lee on 2021-12-27.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        
        parseJSON()
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func parseJSON() {
        guard let path = Bundle.main.path(forResource: "Plus15", ofType: "json") else {
            print("could not get json")
            return
        }
        
        let url = URL(fileURLWithPath: path)
        let result: [Section]
        
        do {
            let jsonData = try Data(contentsOf: url)
            result = try! JSONDecoder().decode([Section].self, from: jsonData)
            
            print(result)
        } catch {
            print("could not decode json")
        }
    }

}

struct Section: Codable {
    let structure_type: String!
    let type: String!
    let the_geom: Structure
    let revis_date: String!
    let access_hours: String!
    let modified_dt: String!
}

struct Structure: Codable {
    let type: String
    let coordinates: [[[[Double]]]]
}


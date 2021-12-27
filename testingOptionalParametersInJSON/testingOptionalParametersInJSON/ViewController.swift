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
        guard let path = Bundle.main.path(forResource: "testing", ofType: "json") else {
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
    let title: String
    let type: String!
    let structure: Structure
}

struct Structure: Codable {
    let type: String
    let name: String!
}


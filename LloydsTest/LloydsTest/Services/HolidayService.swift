//
//  HolidayService.swift
//  LloydsTest
//
//  Created by Gaurav pande on 07/02/23.
//

import Foundation

protocol HolidayServiceProtocol {
    func getHolidayList(completion: @escaping (_ success: Bool, _ results: Holiday?, _ error: String?) -> ())
}

protocol DivisionProtocol {
    func getDivisionList(completion: @escaping (_ success: Bool, _ results: [String], _ error: String?) -> ())
}


class HolidayService: HolidayServiceProtocol,DivisionProtocol {
    
    // Fetch Division name in UK from Mock data
    
    func getDivisionList(completion: @escaping (Bool, [String], String?) -> ()) {
        
        if let path = Bundle.main.path(forResource: "Mock", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let jsonResult = jsonResult as? Dictionary<String, AnyObject>{
                    var keyArray:Array = [String]()
                    for obj in jsonResult.keys{
                        keyArray.append(obj.description)
                    }
                    completion(true,keyArray,nil)
                    
                }
            } catch {
                print(error)
            }
        } else {
            completion(false, [""], "Division Request failed")
        }
    }
    
    // Fetch Holiday List
    
    func getHolidayList(completion: @escaping (Bool, Holiday?, String?) -> ()) {
        
        if let path = Bundle.main.path(forResource: "Mock", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                
                let model = try JSONDecoder().decode(Holiday.self, from: data)
                completion(true, model, nil)
            } catch {
                print(error)
            }
            
        } else {
            completion(false, nil, "Request failed")
        }
    }
}


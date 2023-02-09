//
//  DivisionViewModel.swift
//  LloydsTest
//
//  Created by Gaurav pande on 08/02/23.
//

import Foundation

class DivisionViewModel:NSObject{
    
    // MARK: - Variables
    
    private var holidayService: DivisionProtocol
    var reloadTableView: (() -> Void)?
    var divisionCellModels = [DivisionCellModel]() {
        didSet {
            reloadTableView?()
        }
    }


    init(holidayService: DivisionProtocol = HolidayService()) {
        self.holidayService = holidayService
    }
    
    // Get Division list inside UK
    
    func getDivisionList(){
        holidayService.getDivisionList { success, arr, error in
            if success {
                var divisionData = [DivisionCellModel]()
                for division in arr{
                    let divisionCellModel = DivisionCellModel(divisionName: division)
                    divisionData.append(divisionCellModel)
                }
                self.divisionCellModels = divisionData
                
            } else {
                print(error!)
            }
        }
    }
    
}

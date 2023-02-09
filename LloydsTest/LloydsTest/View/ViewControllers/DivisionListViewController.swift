//
//  DivisionListViewController.swift
//  LloydsTest
//
//  Created by Gaurav pande on 08/02/23.
//

import UIKit

class DivisionListViewController: UIViewController {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Variables
    
    lazy var viewModel = {
        DivisionViewModel()
    }()
    
    // MARK: - ViewLife Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getDivisionList()
    }
    
    // MARK: - Custom Methods
    
    func getDivisionList() {
        viewModel.getDivisionList()
        viewModel.reloadTableView = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
}



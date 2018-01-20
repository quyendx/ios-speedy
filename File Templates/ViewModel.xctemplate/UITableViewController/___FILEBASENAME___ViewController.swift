//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

import RxSwift
import RxCocoa
import RxDataSources

class ___VARIABLE_sceneName___ViewController: UIViewController {

    var viewModel: ___VARIABLE_sceneName___ViewModel!

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = 60
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.translatesAutoresizingMaskIntoConstraints = false

        // Register cells


        return tableView
    }()
    
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupUI()

        configRx(viewModel)
        configRxDataSource(viewModel)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private func setupUI() {
        // Such as config localized, default state
    }

    private func configRx(_ viewModel: ___VARIABLE_sceneName___ViewModel) {
        // Subscribe Rx events
    }

    private func configRxDataSource(_ viewModel: ___VARIABLE_sceneName___ViewModel) {
        // Configuration table view data source
    }

}

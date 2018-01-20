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
    
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupUI()

        configRx(viewModel)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private func setupUI() {
        // Such as config localized, default state
    }

    private func configRx(_ viewModel: ___VARIABLE_sceneName___ViewModel) {
        // Input

        // Output

    }

}

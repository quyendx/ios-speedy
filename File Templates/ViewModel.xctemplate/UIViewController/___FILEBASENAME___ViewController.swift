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

class ___VARIABLE_sceneName___ViewController: BaseViewController {

    var viewModel: ___VARIABLE_sceneName___ViewModelType!
    
    private let disposeBag = DisposeBag()

    init(viewModel: ___VARIABLE_sceneName___ViewModelType) {
        self.viewModel = viewModel

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        guard viewModel != nil else {
            debugPrint("View model must not be nil")
            return
        }

        setupUI()
        configRx(viewModel)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }

    private func setupUI() {
        // Such as config localized, default state
    }

    private func configRx(_ viewModel: ___VARIABLE_sceneName___ViewModelType) {
        // Subscribe Rx events
    }

}

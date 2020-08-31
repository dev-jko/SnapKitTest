//
//  ViewController.swift
//  SnapKitTest
//
//  Created by Jaedoo Ko on 2020/08/31.
//  Copyright © 2020 jko. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    private let view1 = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLayout()
        bindStyles()
    }

    private func setUpLayout() {
        view.addSubview(view1)
        
        view1.snp.makeConstraints { maker in
            maker.top.equalTo(view)
            maker.bottom.equalTo(view)
            maker.leading.equalTo(view)
            maker.trailing.equalTo(view)
        }
    }

    private func bindStyles() {
        view.backgroundColor = .white
        view1.backgroundColor = .green
    }
}


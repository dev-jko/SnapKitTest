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

    private let views: [UIView] = {
        var arr = [UIView]()
        (0...30).forEach { _ in arr.append(UIView()) }
        return arr
    } ()
    
    private let colors: [UIColor] = [.green, .cyan, .red, .yellow, .black , .brown]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLayout()
        bindStyles()
    }

    private func setUpLayout() {
        views
            .forEach { view.addSubview($0) }
        
        views[0].snp.makeConstraints { make in
            make.top.equalTo(view)
            make.bottom.equalTo(view)
            make.leading.equalTo(view)
            make.trailing.equalTo(view)
        }
        
        views[0].snp.remakeConstraints { make in
            make.edges.equalTo(view).inset(UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20))
        }
        
        views[1].snp.makeConstraints { make in
//            make.centerX.equalTo(views[0])
            make.centerX.lessThanOrEqualTo(views[0].snp.trailing)
            make.width.equalTo(200)
            make.height.equalTo(100)
        }
        
        views[2].snp.makeConstraints { make in
            make.width.greaterThanOrEqualTo(200)
            make.width.lessThanOrEqualTo(400)
            make.height.equalTo(100)
            make.trailing.lessThanOrEqualTo(-10)
        }
    }

    private func bindStyles() {
        view.backgroundColor = .white
        zip(views, colors).forEach { view, color in view.backgroundColor = color }
    }
}


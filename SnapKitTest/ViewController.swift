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

    private let colors: [UIColor] = [.green, .cyan, .red, .yellow, .black , .brown, .lightGray, .magenta, .orange, .purple]
    private let views: [UIView] = {
        var arr = [UIView]()
        (0...30).forEach { _ in arr.append(UIView()) }
        return arr
    } ()
    private var constraint: Constraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLayout()
        bindStyles()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        startAnimation()
    }
    
    private func startAnimation() {
        constraint?.update(offset: -200)
//        constraint?.deactivate()
        UIView.animate(withDuration: 2, delay: 1, animations: {
            self.view.layoutIfNeeded()
        }, completion: { _ in
            self.views[2].snp.updateConstraints { make in
                make.height.equalTo(50).labeled("my constraint")
            }
        })
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
            make.right.equalTo(view).offset(-50).priority(.required)
            make.edges.equalTo(view).inset(UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)).priority(.high)
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
        
        views[3].snp.makeConstraints { make in
            make.top.equalTo(42).priority(.required)
            make.height.equalTo(20).priority(.required)
            make.size.equalTo(CGSize(width: 50, height: 100)).priority(.high)
            make.edges.equalTo(UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)).priority(.low)
//            make.left.equalTo(views[2]).offset(UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0) as! ConstraintOffsetTarget)
            // ㄴ 에러 발생 -> 공식문서가 잘못된건가?
        }
        
        views[4].snp.makeConstraints { make in
            make.top.equalTo(view).priority(.medium)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(200).priority(.high)
            make.size.equalTo(view).multipliedBy(0.5)
            make.center.equalToSuperview().priority(.required)
        }
        
        views[5].snp.makeConstraints { make in
            make.leading.bottom.equalTo(views[0]).offset(5)
            make.size.equalTo(views[3]).priority(.medium)
            self.constraint = make.trailing.equalTo(views[0]).priority(.medium).constraint // 대입할 때도 제약조건은 적용됨
        }
    }

    private func bindStyles() {
        view.backgroundColor = .white
        zip(views, colors)
            .forEach { view, color in view.backgroundColor = color }
    }
}


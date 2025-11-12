//
//  SegmentedControlBar.swift
//  Sopt_assignment
//
//  Created by 이서현 on 11/11/25.
//

import UIKit
import SnapKit

class SegmentedControlBar: UIView {
    private let segmentedControl: UISegmentedControl = {
        
        let segment = UISegmentedControl()
        segment.insertSegment(withTitle: "음식배달", at: 0, animated: true)
        segment.insertSegment(withTitle: "픽업", at: 1, animated: true)
        segment.insertSegment(withTitle: "장보기.쇼핑", at: 2, animated: true)
        segment.insertSegment(withTitle: "선물하기", at: 3, animated: true)
        segment.insertSegment(withTitle: "혜택모아보기", at: 4, animated: true)
        
        segment.selectedSegmentIndex = 0
        
        //fix : 세그먼트 고정 너비 수정
        // 스크롤 어떻게 구현하지
        segment.apportionsSegmentWidthsByContent = false
        segment.setWidth(60, forSegmentAt: 0)
        segment.setWidth(60, forSegmentAt: 1)
        segment.setWidth(80, forSegmentAt: 2)
        segment.setWidth(80, forSegmentAt: 3)
        segment.setWidth(100, forSegmentAt: 4)
        
        //MARK: - .normal / .selected 에 따른 변화
        
        //fixme: - 폰트
        segment.setTitleTextAttributes([
            NSAttributedString.Key.foregroundColor: UIColor.baeminGray300,
            NSAttributedString.Key.font: UIFont.body_r_14
        ], for: .normal)
        segment.setTitleTextAttributes([
            NSAttributedString.Key.foregroundColor: UIColor.baeminBlack,
            NSAttributedString.Key.font: UIFont.body_r_14
        ], for: .selected)

        segment.selectedSegmentTintColor = .clear
        segment.setBackgroundImage(UIImage(), for: .normal, barMetrics: .default)
        segment.setDividerImage(UIImage(), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
        return segment
    }()
    
    private let underLineView: UIView = {
       let view = UIView()
        view.backgroundColor = .baeminBlack
        
        return view
    }()
    
    @objc
    private func didChangeCategory(_ segment: UISegmentedControl) {
        switch segment.selectedSegmentIndex {
        case 0:
            print("0")
        default:
            print("changed")
        }
    }
    
    //MARK: - init

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setHierarchy()
        setLayout()
        setAddTarget()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - UI Setup

    private func setUI() {
        segmentedControl.backgroundColor = .white
    }
    
    private func setHierarchy() {
        let components = [segmentedControl, underLineView]
        components.forEach {addSubview($0)}
    }
    
    private func setLayout() {
        segmentedControl.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(36)
        }
        
        underLineView.snp.makeConstraints {
            $0.top.equalTo(segmentedControl.snp.bottom).offset(4)
            $0.leading.equalTo(segmentedControl.snp.leading)
            $0.width.equalTo(52)
            $0.height.equalTo(2)
            $0.bottom.equalToSuperview()
        }
    }
    
    private func setAddTarget() {
        segmentedControl.addTarget(self, action: #selector(didChangeCategory), for: .valueChanged)
        
    }
}

#Preview {
    SegmentedControlBar()
}

/*
 https://ios-development.tistory.com/962
 
 let segmentedControl: UISegmentedControl = {
     let control = UISegmentedControl(items: ["firstView", "secondView"])
     control.translatesAutoresizingMaskIntoConstraints = false
     return control
   }()
   let firstView: UIView = {
     let view = UIView()
     view.backgroundColor = .green
     view.translatesAutoresizingMaskIntoConstraints = false
     return view
   }()
   let secondView: UIView = {
     let view = UIView()
     view.backgroundColor = .yellow
     view.translatesAutoresizingMaskIntoConstraints = false
     return view
   }()
 
 */

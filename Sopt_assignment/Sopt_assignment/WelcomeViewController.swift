//
//  WelcomeViewController.swift
//  Sopt_assignment
//
//  Created by 이서현 on 10/25/25.
//

import UIKit

import SnapKit

final class WelcomeViewController: UIViewController {
    internal var name: String?
    
    
    lazy var topBarLabel: UILabel = {
        let label = UILabel()
        label.text = "대체 뼈찜 누가 시켰어??"
        label.font = UIFont.title_sb_18
        
        return label
    }()
    
    private let backButton: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "arrow.left")
        imageView.tintColor = UIColor.black
        imageView.isUserInteractionEnabled = true //default는 false
        return imageView
    }()
    
    
    private let wcImageView: UIImageView = {
        let imageView = UIImageView() // 뷰 너비 꽉 차게 하고 싶으면?
        imageView.image = UIImage(named: "baemin")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let welcomeLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 115, height: 18))
        label.text = "환영합니다"
        label.font = UIFont.head_b_24
        label.textAlignment = .center
        return label
    }()
    
    
    private let idLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 115, height: 18))
        label.font = UIFont.title_sb_18
        label.textColor = UIColor(named: "baemin_black")
        return label
    }()
    
    private var backToLoginButton: UIButton = {
        let button = UIButton()
        button.setTitle("메인으로 가기", for: .normal)
        button.titleLabel?.font = UIFont.head_b_18
        button.backgroundColor = UIColor(named: "baemin_mint_500")
        button.setTitleColor(.baeminWhite, for: .normal)
        button.layer.cornerRadius = 4
        button.addTarget(
            self,
            action: #selector(goToTabVC),
            for: .touchUpInside)
        return button
    }()
    
    
    private func bindID() {
        self.idLabel.text = "\(name ?? "")님 반가워요!"
    }
    
    @objc
    private func backToLoginButtonDidTap() {
        if self.navigationController == nil {
            self.dismiss(animated: true)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    @objc
    private func goToTabVC() {
        let tabBarViewController = TabBarController()
        navigationController?.pushViewController(tabBarViewController, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setHierarchy()
        setLayout()
        bindID()
        
        self.navigationItem.hidesBackButton = true
    }
    
    private func setUI() {
        view.backgroundColor = .white
    }
    
    private func setHierarchy() {
        let components = [
            topBarLabel,
            wcImageView,
            welcomeLabel,
            idLabel,
            backToLoginButton
        ]
        
        components.forEach { view.addSubview($0)}
    }
    
    private func setLayout() {
        [topBarLabel, backButton, wcImageView, welcomeLabel, idLabel, backToLoginButton].forEach {
            self.view.addSubview($0)
        }
        
        topBarLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(80)
        }
        
        backButton.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(8)
            $0.top.equalToSuperview().offset(75)
            $0.width.equalTo(30)
            $0.height.equalTo(30)
        }
        
        wcImageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(topBarLabel.snp.bottom).offset(18)
            $0.leading.trailing.equalToSuperview()
        }
        
        welcomeLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(wcImageView.snp.bottom).offset(24)
        }
        
        idLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(welcomeLabel.snp.bottom).offset(16)
        }
        
        backToLoginButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(idLabel.snp.bottom).offset(326)
            $0.width.equalTo(375)
            $0.height.equalTo(52)
        }
        
        
        
    }
}

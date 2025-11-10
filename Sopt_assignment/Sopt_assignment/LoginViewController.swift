//
//  LoginViewController.swift
//  Sopt_assignment
//
//  Created by 이서현 on 10/25/25.
//

import UIKit

import SnapKit
import Then

final class LoginViewController: UIViewController {
    
    private let topBarLabel = UILabel()
    lazy var backButton = UIImageView() // fix. 접근제어 어떻게 할까
    lazy var idTextField = UITextField()
    lazy var passwordTextField = UITextField()
    lazy var eyeButton = UIButton()
    lazy var xPWButton = UIButton()
    lazy var loginButton = UIButton()
    lazy var findButton = UIButton()
    
    func setStyle() {
        topBarLabel.do {
            $0.text = "이메일 또는 아이디로 계속"
            $0.font = .title_sb_18
        }
        
        backButton.do {
            $0.image = UIImage(systemName: "arrow.left")
            $0.tintColor = UIColor.black
            $0.isUserInteractionEnabled = true
        }
        
        idTextField.do {
            $0.placeholder = "이메일 아이디"
            $0.textColor = .baeminGray700
            $0.font = .body_r_14
            $0.borderStyle = .none
            $0.layer.borderColor = UIColor(named: "baemin_gray_200")?.cgColor
            $0.layer.borderWidth = 1
            $0.layer.cornerRadius = 4
            $0.addLeftPadding()
            $0.addRightPadding()
        }
        
        passwordTextField.do {
            $0.placeholder = "비밀번호"
            $0.textColor = .baeminGray700
            $0.font = .body_r_14
            $0.borderStyle = .none
            $0.layer.borderColor = UIColor(named: "baemin_gray_200")?.cgColor
            $0.layer.borderWidth = 1
            $0.layer.cornerRadius = 4
            $0.addLeftPadding()
            $0.addRightPadding()
            $0.isSecureTextEntry = true
        }
        
        eyeButton.do {
            $0.tintColor = .baeminGray700
            $0.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
            $0.isHidden = true
        }
        
        xPWButton.do {
            $0.setImage(UIImage(named: "cancle"), for: .normal)
            $0.isHidden = true
        }
        
        loginButton.do {
            $0.setTitle("로그인", for: .normal)
            $0.titleLabel?.font = UIFont.head_b_18
            $0.backgroundColor = UIColor(named: "baemin_gray_200")
            $0.setTitleColor(.baeminWhite, for: .normal)
            $0.layer.cornerRadius = 4
        }
        
        /// UI만 구현한 상태 (action은 나중에 구현)
        findButton.do {
            $0.setTitle("계정 찾기 >", for: .normal)
            $0.titleLabel?.font = UIFont.body_r_14
            $0.backgroundColor = UIColor(named: "baemin_white")
            $0.setTitleColor(.baeminBlack, for: .normal)
            $0.layer.cornerRadius = 4
        }
    }
    
    
    @objc
    private func toggleEyeButtonDidTap() {
        passwordTextField.isSecureTextEntry.toggle()
        
        let isSecure = passwordTextField.isSecureTextEntry
        let image = passwordTextField.isSecureTextEntry ?
            UIImage(systemName: "eye.slash.fill") : UIImage(systemName: "eye.fill")
    }
    
    @objc
    private func clearPWField() {
        passwordTextField.text = ""
        updateTrailingPWDButtons()
    }
    
    @objc
    private func textFieldDidChange(_ textField: UITextField) {
        
        makeButtonEnable()
        
        if textField == passwordTextField {
            xPWButton.isHidden = !textField.hasText
            eyeButton.isHidden = !textField.hasText
        }
    }
    
    private func makeButtonEnable() {
        let isPasswordFieldEmpty = passwordTextField.text?.isEmpty ?? true
        let isIDFieldEmpty = idTextField.text?.isEmpty ?? true
        let shouldEnable = !isPasswordFieldEmpty && !isIDFieldEmpty
        
        if shouldEnable {
            loginButton.isEnabled = true
            loginButton.backgroundColor = UIColor(named: "baemin_mint_500")
        } else {
            loginButton.isEnabled = false
            loginButton.backgroundColor = UIColor(named: "baemin_gray_200")
        }
    }
    
    @objc
    private func loginButtonDidTap() {
        presentToWelcomeVC()
    }
    
    private func presentToWelcomeVC() {
        let wcViewController = WelcomeViewController()
        wcViewController.name = idTextField.text
        self.navigationController?.pushViewController(wcViewController, animated: true)
    }
    
    private func updateTrailingPWDButtons() {
        let isEmpty = passwordTextField.text?.isEmpty ?? true
        eyeButton.isHidden = isEmpty
        xPWButton.isHidden = isEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setHierarchy()
        setLayout()
        setStyle()
        setAddTarget()
        setDelegate()
        
        loginButton.isEnabled = false
    }
    
    /// WelcomeView에서 뒤로가기 눌렀을 때 뷰 초기화
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        idTextField.text = ""
        passwordTextField.text = ""
        
        makeButtonEnable()
    }
    
    private func setUI() {
        view.backgroundColor = .white
    }
    
    private func setHierarchy() {
        let components = [
            topBarLabel,
            idTextField,
            passwordTextField,
            loginButton,
            findButton
        ]
        components.forEach { view.addSubview($0)}
    }
    
    private func setLayout() {
        [topBarLabel, backButton, idTextField, passwordTextField, xPWButton, eyeButton, loginButton, findButton].forEach {
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
        
        idTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(topBarLabel.snp.bottom).offset(36)
            $0.width.equalTo(375)
            $0.height.equalTo(46)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(idTextField.snp.bottom).offset(12)
            $0.width.equalTo(375)
            $0.height.equalTo(46)
        }
        
        xPWButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.top).offset(12)
            $0.trailing.equalTo(passwordTextField.snp.trailing).offset(-56)
        }
        
        eyeButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.top).offset(12)
            $0.trailing.equalTo(passwordTextField.snp.trailing).offset(-20)
        }
        
        loginButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(passwordTextField.snp.bottom).offset(20)
            $0.width.equalTo(375)
            $0.height.equalTo(46)
        }
        
        findButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(loginButton.snp.bottom).offset(20)
            $0.width.equalTo(75)
            $0.height.equalTo(15)
        }
        
    }
    
    //MARK: - AddTarget

    private func setAddTarget() {
        eyeButton.addTarget(self, action: #selector(toggleEyeButtonDidTap), for: .touchUpInside)
        xPWButton.addTarget(self, action: #selector(clearPWField), for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        idTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    
    //MARK: - setDelegate
    
    private func setDelegate() {
        idTextField.delegate = self
        passwordTextField.delegate = self
        ///UITextField가 어떤 이벤트가 생기면 처리를 LoginViewController가 함
    }
    
}

//MARK: - UITextFieldDelegate extension

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor(named: "baemin_black")?.cgColor ?? UIColor(named: "baemin_gray_200")?.cgColor
        textField.layer.borderWidth = 2
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor(named: "baemin_gray_200")?.cgColor
        textField.layer.borderWidth = 1
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        
        makeButtonEnable()
        
        if textField == passwordTextField {
            updateTrailingPWDButtons()
        }
    }
}

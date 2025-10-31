//
//  LoginViewController.swift
//  Sopt_assignment
//
//  Created by 이서현 on 10/25/25.
//

//TODO: - stackView, func(eye) letterSpacing
import Foundation
import UIKit
import SnapKit

class LoginViewController: UIViewController {
    
    
    lazy var topBarLabel: UILabel = {
        let label = UILabel()
        label.text = "이메일 또는 아이디로 계속"
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
    
    lazy var idTextField: UITextField = {
        let idTextField = UITextField()
        idTextField.placeholder = "이메일 아이디"
        idTextField.textColor = UIColor.baeminGray700
        idTextField.font = UIFont.body_r_14
        idTextField.borderStyle = .none
        idTextField.layer.borderColor = UIColor(named: "baemin_gray_200")?.cgColor
        idTextField.layer.borderWidth = 1
        idTextField.layer.cornerRadius = 4
        idTextField.addLeftPadding()
        idTextField.addRightPadding()
        return idTextField
    }()
    
    lazy var passwordTextField: UITextField = {
        let pwTextField = UITextField()
        pwTextField.placeholder = "비밀번호"
        pwTextField.textColor = UIColor.baeminGray700
        pwTextField.font = UIFont.body_r_14
        pwTextField.borderStyle = .none
        pwTextField.layer.borderColor = UIColor(named: "baemin_gray_200")?.cgColor
        pwTextField.layer.borderWidth = 1
        pwTextField.layer.cornerRadius = 4
        pwTextField.addLeftPadding()
        pwTextField.addRightPadding()
        pwTextField.isSecureTextEntry = true
        return pwTextField
    }()
    
    lazy var eyeButton: UIButton = {
        let button = UIButton(type: .system) //system q.
        let image = UIImage(named: "eyeButton")?.withRenderingMode(.alwaysTemplate) // q.
        button.setImage(image, for: .normal)
        button.tintColor = .baeminGray700
        button.addTarget(self, action: #selector(isSecure), for: .touchUpInside)
        return button
    }()
    
    
    @objc
    lazy var xIDButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "cancle"), for: .normal)
        button.addTarget(self, action: #selector(clearIDField), for: .touchUpInside)
        return button
    }()
    
    @objc
    lazy var xPWButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "cancle"), for: .normal)
        button.addTarget(self, action: #selector(clearPWField), for: .touchUpInside)
        return button
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 343, height: 46))
        button.setTitle("로그인", for: .normal)
        button.titleLabel?.font = UIFont.head_b_18
        button.backgroundColor = UIColor(named: "baemin_gray_200")
        button.setTitleColor(.baeminWhite, for: .normal)
        button.layer.cornerRadius = 4
        button.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    lazy var findButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 343, height: 46))
        button.setTitle("계정 찾기 >", for: .normal)
        button.titleLabel?.font = UIFont.body_r_14
        button.backgroundColor = UIColor(named: "baemin_white")
        button.setTitleColor(.baeminBlack, for: .normal)
        button.layer.cornerRadius = 4
        //button.addTarget(self, action: #selector(기능추가), for: .touchUpInside)
        return button
    }()
    
    @objc
    private func isSecure() {
        passwordTextField.isSecureTextEntry.toggle()
        eyeButton.tintColor = passwordTextField.isSecureTextEntry ? .baeminBlack : .baeminGray700
    }
    
    @objc
    private func clearIDField() {
        idTextField.text = ""
    }
    
    @objc
    private func clearPWField() {
        passwordTextField.text = ""
    }
    
    @objc
    private func textFieldDidChange(_ textField: UITextField) {
        if textField == idTextField {
            xIDButton.isHidden = !textField.hasText  // 입력 있으면 x버튼 띄우기
        } else if textField == passwordTextField {
            xPWButton.isHidden = !textField.hasText
            eyeButton.isHidden = !textField.hasText
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setHierarchy()
        setLayout()
        
        
        idTextField.delegate = self
        passwordTextField.delegate = self
        ///UITextField가 어떤 이벤트가 생기면 처리를 LoginViewController가 함
        
        loginButton.isEnabled = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        idTextField.text = ""
        passwordTextField.text = ""
    }
    
    private func setUI() {
        view.backgroundColor = .white
        
        xIDButton.isHidden = true
        xPWButton.isHidden = true
        eyeButton.isHidden = true
        
        idTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
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
        [topBarLabel, backButton, idTextField, xIDButton, passwordTextField, xPWButton, eyeButton, loginButton, findButton].forEach {
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
        
        xIDButton.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.top).offset(12)
            $0.trailing.equalTo(idTextField.snp.trailing).offset(-20)
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
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor(named: "baemin_black")?.cgColor ?? UIColor(named: "baemin_gray_200")?.cgColor
        
        if idTextField.hasText && passwordTextField.hasText {
            loginButton.isEnabled = true
            loginButton.backgroundColor = UIColor(named: "baemin_mint_500") ?? UIColor(named: "baemin_gray_200")
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor(named: "baemin_gray_200")?.cgColor
    }
}

#Preview {
    LoginViewController()
}

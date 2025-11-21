//
//  ShoppingWelcomeViewController.swift
//  Sopt_assignment
//
//  Created by 이서현 on 11/12/25.
//

import UIKit

import SnapKit
import Then

public final class ShoppingWelcomeViewController: UIViewController, Alertable, LoadingIndicatorable {
  
  // MARK: - UI Components
  
  public let loadingIndicator: UIActivityIndicatorView = {
    let indicator = UIActivityIndicatorView(style: .large)
    indicator.color = .systemBlue
    indicator.hidesWhenStopped = true
    indicator.translatesAutoresizingMaskIntoConstraints = false
    return indicator
  }()
  
  private let titleLabel: UILabel = {
    let label = UILabel()
    label.text = "환영합니다!\n반갑습니다!"
    label.font = UIFont.head_b_16
    label.textAlignment = .center
    label.textColor = .black
    return label
  }()
  
  private let idTextField: UITextField = {
    let textField = UITextField()
    textField.placeholder = "아이디"
    textField.font = UIFont.body_r_14
    textField.borderStyle = .roundedRect
    textField.addLeftPadding()
    return textField
  }()
  
  private let nameTextField: UITextField = {
    let textField = UITextField()
    textField.placeholder = "이름"
    textField.font = UIFont.body_r_14
    textField.borderStyle = .roundedRect
    textField.addLeftPadding()
    return textField
  }()
  
  private let emailTextField: UITextField = {
    let textField = UITextField()
    textField.placeholder = "이메일"
    textField.font = UIFont.body_r_14
    textField.borderStyle = .roundedRect
    textField.addLeftPadding()
    return textField
  }()
  
  private let ageTextField: UITextField = {
    let textField = UITextField()
    textField.placeholder = "나이"
    textField.font = UIFont.body_r_14
    textField.borderStyle = .roundedRect
    textField.addLeftPadding()
    return textField
  }()
  
  private lazy var getUserButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("회원 조회", for: .normal)
    button.backgroundColor = .baeminMint500
    button.setTitleColor(.white, for: .normal)
    button.titleLabel?.font = UIFont.body_r_14
    button.layer.cornerRadius = 6
    button.addTarget(self, action: #selector(getUserButtonTapped), for: .touchUpInside)
    return button
  }()
  
  private lazy var updateUserButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("회원 정보 업데이트", for: .normal)
    button.backgroundColor = .baeminMint300
    button.setTitleColor(.white, for: .normal)
    button.titleLabel?.font = UIFont.body_r_14
    button.layer.cornerRadius = 6
    button.addTarget(self, action: #selector(updateUserButtonTapped), for: .touchUpInside)
    return button
  }()
  
  private lazy var deleteUserButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("회원 탈퇴", for: .normal)
    button.backgroundColor = .baeminMint500
    button.setTitleColor(.white, for: .normal)
    button.titleLabel?.font = UIFont.body_r_14
    button.layer.cornerRadius = 6
    button.addTarget(self, action: #selector(deleteUserButtonTapped), for: .touchUpInside)
    return button
  }()
  
  // MARK: - Properties
  
  private let provider: NetworkProviding
  
  // MARK: - Init
  
  init(userId: Int = 1, provider: NetworkProviding = NetworkProvider()) {
    self.provider = provider
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Lifecycle
  
  public override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    view.bringSubviewToFront(loadingIndicator)
  }
  
  public override func viewDidLoad() {
    super.viewDidLoad()
    
    setHierarchy()
    setLayout()
  }
  
  private func setLayout() {
    titleLabel.snp.makeConstraints {
      $0.top.equalTo(view.safeAreaLayoutGuide).offset(50)
      $0.horizontalEdges.equalToSuperview().inset(25)
    }
    loadingIndicator.snp.makeConstraints {
      $0.center.equalToSuperview()
    }
    idTextField.snp.makeConstraints {
      $0.top.equalTo(titleLabel.snp.bottom).offset(20)
      $0.horizontalEdges.equalToSuperview().inset(25)
      $0.height.equalTo(50)
    }
    nameTextField.snp.makeConstraints {
      $0.top.equalTo(idTextField.snp.bottom).offset(20)
      $0.horizontalEdges.equalToSuperview().inset(25)
      $0.height.equalTo(50)
    }
    emailTextField.snp.makeConstraints {
      $0.top.equalTo(nameTextField.snp.bottom).offset(20)
      $0.horizontalEdges.equalToSuperview().inset(25)
      $0.height.equalTo(50)
    }
    ageTextField.snp.makeConstraints {
      $0.top.equalTo(emailTextField.snp.bottom).offset(35)
      $0.horizontalEdges.equalToSuperview().inset(25)
      $0.height.equalTo(50)
    }
    getUserButton.snp.makeConstraints {
      $0.top.equalTo(ageTextField.snp.bottom).offset(35)
      $0.horizontalEdges.equalToSuperview().inset(20)
      $0.height.equalTo(50)
    }
    updateUserButton.snp.makeConstraints {
      $0.top.equalTo(getUserButton.snp.bottom).offset(35)
      $0.horizontalEdges.equalToSuperview().inset(20)
      $0.height.equalTo(50)
    }
    deleteUserButton.snp.makeConstraints {
      $0.top.equalTo(updateUserButton.snp.bottom).offset(35)
      $0.horizontalEdges.equalToSuperview().inset(20)
      $0.height.equalTo(55)
    }
  }
  
  // MARK: - UI Setup
  
  private func setHierarchy() {
    
    view.addSubviews(
      titleLabel,
      loadingIndicator,
      idTextField,
      nameTextField,
      emailTextField,
      ageTextField,
      getUserButton,
      updateUserButton,
      deleteUserButton,
    )
  }
  
  // MARK: - Actions
  
  @objc private func getUserButtonTapped() {
    guard let id = Int(idTextField.text ?? "") else {
      print("id 변환 실패: '\(idTextField.text ?? "nil")'")
              
      return
    }
    Task {
      await performGetUser(id: id)
    }
  }
  
  @objc private func updateUserButtonTapped() {
    guard let id = Int(idTextField.text ?? "") else {
      return
    }
    Task {
      await performUpdateUser(
        id: id,
        name: nameTextField.text,
        email: emailTextField.text,
        age: Int(ageTextField.text ?? "")
      )
    }
  }
  
  @objc private func deleteUserButtonTapped() {
    guard let id = Int(idTextField.text ?? "") else {
      return
    }
    Task {
      await performDeleteUser(id: id)
    }
  }
  
  @MainActor
  private func performGetUser(id: Int) async {
    loadingIndicator.startAnimating()
    
    do {
      // UserAPI의 convenience method 사용
      let response = try await UserAPI.performGetUser(id: id, provider: provider)
      
      // Update text fields with response data
      nameTextField.text = response.name
      emailTextField.text = response.email
      ageTextField.text = "\(response.age)"
      
      showAlert(title: "회원 조회 성공", message: "\(response)")
    } catch let error as NetworkError {
      // 콘솔에 상세 에러 로그 출력
      print("🚨 [Get User Error] \(error.detailedDescription)")
      // 사용자에게는 친절한 메시지 표시
      showAlert(title: "회원 조회 실패", message: error.localizedDescription)
    } catch {
      print("🚨 [Get User Unknown Error] \(error)")
      showAlert(title: "회원 조회 실패", message: error.localizedDescription)
    }
    
    loadingIndicator.stopAnimating()
  }
  
  @MainActor
  private func performUpdateUser(
    id: Int,
    name: String?,
    email: String?,
    age: Int?
  ) async {
    loadingIndicator.startAnimating()
    
    do {
      // UserAPI의 convenience method 사용
      let response = try await UserAPI.performUpdateUser(
        id: id,
        name: name,
        email: email,
        age: age,
        provider: provider
      )
      
      // 성공 시 Welcome 화면으로 이동
      showAlert(title: "회원 정보 업데이트 성공", message: "\(response)")
    } catch let error as NetworkError {
      // 콘솔에 상세 에러 로그 출력
      print("🚨 [Update User Info Error] \(error.detailedDescription)")
      // 사용자에게는 친절한 메시지 표시
      showAlert(title: "회원 정보 업데이트 실패", message: error.localizedDescription)
    } catch {
      print("🚨 [Update User Info Unknown Error] \(error)")
      showAlert(title: "회원 정보 업데이트 실패", message: error.localizedDescription)
    }
    
    loadingIndicator.stopAnimating()
  }
  
  @MainActor
  private func performDeleteUser(id: Int) async {
    loadingIndicator.startAnimating()
    
    do {
      // UserAPI의 convenience method 사용
      _ = try await UserAPI.performDeleteUser(id: id, provider: provider)
      
      // 성공 시 Welcome 화면으로 이동
      showAlert(title: "회원 탈퇴 성공", message: "회원 탈퇴가 완료되었습니다!") { [weak self] in
        self?.navigationController?.popViewController(animated: true)
      }
    } catch let error as NetworkError {
      // 콘솔에 상세 에러 로그 출력
      print("🚨 [Delete User Error] \(error.detailedDescription)")
      // 사용자에게는 친절한 메시지 표시
      showAlert(title: "회원 탈퇴 실패", message: error.localizedDescription)
    } catch {
      print("🚨 [Delete User Unknown Error] \(error)")
      showAlert(title: "회원 탈퇴 실패", message: error.localizedDescription)
    }
    
    loadingIndicator.stopAnimating()
  }
}

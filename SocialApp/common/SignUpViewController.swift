//
//  SignUpViewController.swift
//  SocialApp
//
//  Created by Aruuke Turgunbaeva on 17/1/24.
//

import UIKit

class SignUpViewController: UIViewController{
    
    private lazy var mainImage: UIImageView = MakerView().makeImage(image: UIImage(named: "image"),
                                                                    cornerRadius: 2,
                                                                    contentMode: .scaleAspectFit)
    
    private lazy var subView: UIView = MakerView().makeView(backgroundColor: .white)
    
    private lazy var fullNameTitle: UILabel = MakerView().makeLabel(text: "Full Name",
                                                                    textColor: .init(hex: "#A5A5A5"),
                                                                    textSize: 13,
                                                                    textWeight: .regular)
    
    private lazy var fullNameTF: UITextField = MakerView().makeTextField(leftViewMode: .always)
    
    private lazy var fullNameLineView: UIView = MakerView().makeView(backgroundColor: .black)
    
    private lazy var mobileNumberTitle: UILabel = MakerView().makeLabel(text: "Mobile Number",
                                                                        textColor: .init(hex: "#A5A5A5"),
                                                                        textSize: 13,
                                                                        textWeight: .regular)
    
    private lazy var mobileNumberTF: UITextField = MakerView().makeTextField(leftViewMode: .always)
    
    private lazy var mobileNumberLineView: UIView = MakerView().makeView(backgroundColor: .black)
    
    private lazy var emailTitle: UILabel = MakerView().makeLabel(text: "Email",
                                                                 textColor: .init(hex: "#A5A5A5"),
                                                                 textSize: 13,
                                                                 textWeight: .regular)
    
    private lazy var emailTF: UITextField = MakerView().makeTextField(leftViewMode: .always)
    
    private lazy var emailLineView: UIView = MakerView().makeView(backgroundColor: .black)
    
    private lazy var userNameTitle: UILabel = MakerView().makeLabel(text: "User Name",
                                                                    textColor: .init(hex: "#A5A5A5"),
                                                                    textSize: 13,
                                                                    textWeight: .regular)
    
    private lazy var userNameTF: UITextField = MakerView().makeTextField(leftViewMode: .always)
    
    private lazy var userNameLineView: UIView = MakerView().makeView(backgroundColor: .black)
    
    private lazy var pswTitle: UILabel = MakerView().makeLabel(text: "Password",
                                                               textColor: .init(hex: "#A5A5A5"),
                                                               textSize: 13,
                                                               textWeight: .regular)
    
    private lazy var pswTF: UITextField = MakerView().makeTextField(leftViewMode: .always)
    
    private lazy var pswLineView: UIView = MakerView().makeView(backgroundColor: .black)
    
    private lazy var confirmPswTitle: UILabel = MakerView().makeLabel(text: "Confirm Password",
                                                                      textColor: .init(hex: "#A5A5A5"),
                                                                      textSize: 13,
                                                                      textWeight: .regular)
    
    private lazy var confirmPswTF: UITextField = MakerView().makeTextField(leftViewMode: .always)
    
    private lazy var confirmPswLineView: UIView = MakerView().makeView(backgroundColor: .black)
    
    private lazy var signUpButton: UIButton = MakerView().makeButton(title: "Sign Up",
                                                                     backgroundColor: .init(hex: "#2855AE"),
                                                                     titleColor: .white,
                                                                     cornerRadius: 15,
                                                                     font: UIFont.systemFont(ofSize: 17))
    
    private lazy var accTitle: UILabel = MakerView().makeLabel(text: "Already have an Account?",
                                                               textColor: .black,
                                                               textSize: 13,
                                                               textWeight: .regular)
    
    private lazy var signInButton: UIButton = MakerView().makeButton(title: "Sign In",
                                                                     backgroundColor: .clear,
                                                                     titleColor: .init(hex: "#4B94EA"),
                                                                     cornerRadius: 0,
                                                                     font: UIFont.systemFont(ofSize: 14))
    
    override func viewDidLoad() {
        setupUI()
        initUI()
    }
    
    private func initUI() {
        setGradientBackground()
        setupSubView()
    }
    
    private func setupUI(){
        setupSubView()
        setupImage()
        
        setupFullNameTitle()
        setupFullNameTF()
        setupFullNameLine()
        
        setupMobileNumberTitle()
        setupMobileNumberTF()
        setupMobileNumberLine()
        
        setupEmailTitle()
        setupEmailTF()
        setupEmailLine()
        
        setupUserNameTitle()
        setupUserNameTF()
        setupUserNameLine()
        
        setupPswTitle()
        setupPswTF()
        setupPswLine()
        
        setupConfirmPswTitle()
        setupConfirmPswTF()
        setupConfirmPswLine()
        
        setupSignUpButton()
        
        setupAccTitle()
        setupSignInButton()
    }
    
    private func setupImage(){
        view.addSubview(mainImage)
        mainImage.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(-20)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(260)
        }
    }
    
    private let height = UIScreen.main.bounds.height
    
    private func setupSubView(){
        view.addSubview(subView)
        subView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(height / 1.40)
        }
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = subView.bounds
        
        let color1 = UIColor.clear.cgColor
        let color2 = UIColor.black.cgColor
        
        gradientLayer.colors = [color1, color2]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
        
        subView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        subView.layer.insertSublayer(gradientLayer, at: 0)
        
        subView.layer.insertSublayer(gradientLayer, at: 0)
        subView.layer.cornerRadius = 30
        subView.clipsToBounds = true
    }
    
    private func setupFullNameTitle(){
        subView.addSubview(fullNameTitle)
        fullNameTitle.snp.makeConstraints { make in
            make.top.equalTo(subView).offset(43)
            make.leading.equalTo(subView).offset(20)
        }
    }
    
    private func setupFullNameTF(){
        subView.addSubview(fullNameTF)
        fullNameTF.snp.makeConstraints { make in
            make.top.equalTo(fullNameTitle.snp.bottom).offset(8)
            make.leading.trailing.equalTo(subView).inset(20)
            make.height.equalTo(30)
        }
    }
    
    private func setupFullNameLine(){
        subView.addSubview(fullNameLineView)
        fullNameLineView.snp.makeConstraints { make in
            make.top.equalTo(fullNameTF.snp.bottom).offset(3)
            make.leading.trailing.equalTo(subView).inset(20)
            make.height.equalTo(1)
            
        }
    }
    
    private func setupMobileNumberTitle(){
        subView.addSubview(mobileNumberTitle)
        mobileNumberTitle.snp.makeConstraints { make in
            make.top.equalTo(fullNameLineView.snp.bottom).offset(15)
            make.leading.equalTo(subView).offset(20)
        }
    }
    
    private func setupMobileNumberTF(){
        subView.addSubview(mobileNumberTF)
        mobileNumberTF.snp.makeConstraints { make in
            make.top.equalTo(mobileNumberTitle.snp.bottom).offset(8)
            make.leading.trailing.equalTo(subView).inset(20)
            make.height.equalTo(30)
        }
    }
    
    private func setupMobileNumberLine(){
        subView.addSubview(mobileNumberLineView)
        mobileNumberLineView.snp.makeConstraints { make in
            make.top.equalTo(mobileNumberTF.snp.bottom).offset(3)
            make.leading.trailing.equalTo(subView).inset(20)
            make.height.equalTo(1)
        }
    }
    
    private func setupEmailTitle(){
        subView.addSubview(emailTitle)
        emailTitle.snp.makeConstraints { make in
            make.top.equalTo(mobileNumberLineView.snp.bottom).offset(15)
            make.leading.equalTo(subView).offset(20)
        }
    }
    
    private func setupEmailTF(){
        subView.addSubview(emailTF)
        emailTF.snp.makeConstraints { make in
            make.top.equalTo(emailTitle.snp.bottom).offset(8)
            make.leading.trailing.equalTo(subView).inset(20)
            make.height.equalTo(30)
        }
    }
    
    private func setupEmailLine(){
        subView.addSubview(emailLineView)
        emailLineView.snp.makeConstraints { make in
            make.top.equalTo(emailTF.snp.bottom).offset(3)
            make.leading.trailing.equalTo(subView).inset(20)
            make.height.equalTo(1)
        }
    }
    
    private func setupUserNameTitle(){
        subView.addSubview(userNameTitle)
        userNameTitle.snp.makeConstraints { make in
            make.top.equalTo(emailLineView.snp.bottom).offset(15)
            make.leading.equalTo(subView).offset(20)
        }
    }
    
    private func setupUserNameTF(){
        subView.addSubview(userNameTF)
        userNameTF.snp.makeConstraints { make in
            make.top.equalTo(userNameTitle.snp.bottom).offset(8)
            make.leading.trailing.equalTo(subView).inset(20)
            make.height.equalTo(30)
        }
    }
    
    private func setupUserNameLine(){
        subView.addSubview(userNameLineView)
        userNameLineView.snp.makeConstraints { make in
            make.top.equalTo(userNameTF.snp.bottom).offset(3)
            make.leading.trailing.equalTo(subView).inset(20)
            make.height.equalTo(1)
        }
    }
    
    private func setupPswTitle(){
        subView.addSubview(pswTitle)
        pswTitle.snp.makeConstraints { make in
            make.top.equalTo(userNameLineView.snp.bottom).offset(15)
            make.leading.equalTo(subView).offset(20)
        }
    }
    
    private func setupPswTF(){
        subView.addSubview(pswTF)
        pswTF.snp.makeConstraints { make in
            make.top.equalTo(pswTitle.snp.bottom).offset(8)
            make.leading.trailing.equalTo(subView).inset(20)
            make.height.equalTo(30)
        }
    }
    
    private func setupPswLine(){
        subView.addSubview(pswLineView)
        pswLineView.snp.makeConstraints { make in
            make.top.equalTo(pswTF.snp.bottom).offset(3)
            make.leading.trailing.equalTo(subView).inset(20)
            make.height.equalTo(1)
        }
    }
    
    private func setupConfirmPswTitle(){
        subView.addSubview(confirmPswTitle)
        confirmPswTitle.snp.makeConstraints { make in
            make.top.equalTo(pswLineView.snp.bottom).offset(15)
            make.leading.equalTo(subView).offset(20)
        }
    }
    
    private func setupConfirmPswTF(){
        subView.addSubview(confirmPswTF)
        confirmPswTF.snp.makeConstraints { make in
            make.top.equalTo(confirmPswTitle.snp.bottom).offset(8)
            make.leading.trailing.equalTo(subView).inset(20)
            make.height.equalTo(30)
        }
    }
    
    private func setupConfirmPswLine(){
        subView.addSubview(confirmPswLineView)
        confirmPswLineView.snp.makeConstraints { make in
            make.top.equalTo(confirmPswTF.snp.bottom).offset(3)
            make.leading.trailing.equalTo(subView).inset(20)
            make.height.equalTo(1)
        }
    }
    
    private func setupSignUpButton(){
        subView.addSubview(signUpButton)
        signUpButton.snp.makeConstraints { make in
            make.top.equalTo(confirmPswLineView.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.height.equalTo(40)
            make.width.equalTo(170)
        }
        signUpButton.addTarget(self, action: #selector(showSuccessPage(_:)), for: .touchUpInside)
    }
    
    private func setupAccTitle(){
        subView.addSubview(accTitle)
        accTitle.snp.makeConstraints { make in
            make.bottom.equalTo(view.snp.bottom).offset(-25)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
        }
    }
    
    private func setupSignInButton(){
        subView.addSubview(signInButton)
        signInButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.snp.bottom).offset(-25)
            make.centerY.equalTo(accTitle.snp.centerY)
            make.leading.equalTo(accTitle.snp.trailing).offset(2)
        }
        signInButton.addTarget(self, action: #selector(signInPage(_:)), for: .touchUpInside)
    }
    @objc private func signInPage(_ sender: UIButton){
        navigationController?.popToRootViewController(animated: true)
    }
    
    @objc private func showSuccessPage(_ sender: UIButton) {
        let missingFields = checkValidFields()

        if missingFields.isEmpty {
            if checkField(pswTextField: pswTF, confirmPswTextField: confirmPswTF, pswTitle: pswTitle, confirmPswTitle: confirmPswTitle) {
                resetValidFieldsUI(fullNameTF: fullNameTF, mobileNumberTF: mobileNumberTF, emailTF: emailTF, userNameTF: userNameTF)
                let vc = SuccessPageViewController()
                navigationController?.pushViewController(vc, animated: true)
            }
        } else {
            for field in missingFields {
                field.layer.borderWidth = 1
                field.layer.borderColor = UIColor.red.cgColor
            }
        }
    }
    
    private func checkValidFields() -> [UITextField] {
        var missingFields: [UITextField] = []

        if !fullNameTF.hasText {
            missingFields.append(fullNameTF)
        }
        if !mobileNumberTF.hasText {
            missingFields.append(mobileNumberTF)
        }
        if !emailTF.hasText {
            missingFields.append(emailTF)
        }
        if !userNameTF.hasText {
            missingFields.append(userNameTF)
        }
        return missingFields
    }
    
    private func checkField(pswTextField: UITextField, confirmPswTextField: UITextField, pswTitle: UILabel, confirmPswTitle: UILabel) -> Bool {
        guard let password = pswTextField.text, let confirmPassword = confirmPswTextField.text, !password.isEmpty, !confirmPassword.isEmpty else {
            let errorMessage = "TextFields are empty"
            updateUIForError(pswTitle: pswTitle, confirmPswTitle: confirmPswTitle, pswTextField: pswTextField, confirmPswTextField: confirmPswTextField, errorMessage: errorMessage)
            return false
        }
        
        if password != confirmPassword {
            let errorMessage = "Passwords don't match. Please check and try again."
            updateUIForError(pswTitle: pswTitle, confirmPswTitle: confirmPswTitle, pswTextField: pswTextField, confirmPswTextField: confirmPswTextField, errorMessage: errorMessage)
            return false
        } else {
            resetUI(pswTitle: pswTitle, confirmPswTitle: confirmPswTitle, pswTextField: pswTextField, confirmPswTextField: confirmPswTextField)
            return true
        }
    }

    func updateUIForError(pswTitle: UILabel, confirmPswTitle: UILabel, pswTextField: UITextField, confirmPswTextField: UITextField, errorMessage: String) {
        pswTitle.text = errorMessage
        confirmPswTitle.text = errorMessage
        
        pswTitle.textColor = .red
        confirmPswTitle.textColor = .red
        
        pswTextField.layer.borderWidth = 1
        pswTextField.layer.borderColor = UIColor.red.cgColor
        
        confirmPswTextField.layer.borderWidth = 1
        confirmPswTextField.layer.borderColor = UIColor.red.cgColor
    }

    func resetUI(pswTitle: UILabel, confirmPswTitle: UILabel, pswTextField: UITextField, confirmPswTextField: UITextField) {
        pswTitle.text = "Password"
        pswTitle.textColor = .init(hex: "#A5A5A5")
        pswTextField.layer.borderColor = UIColor.white.cgColor
        pswTextField.layer.borderWidth = 1
        
        confirmPswTitle.text = "Confirm Password"
        confirmPswTitle.textColor = .init(hex: "#A5A5A5")
        confirmPswTextField.layer.borderColor = UIColor.white.cgColor
        confirmPswTextField.layer.borderWidth = 1
    }
    
    func resetValidFieldsUI(fullNameTF: UITextField, mobileNumberTF: UITextField, emailTF: UITextField, userNameTF: UITextField) {
        
        fullNameTF.layer.borderColor = UIColor.white.cgColor
        fullNameTF.layer.borderWidth = 1

        mobileNumberTF.layer.borderColor = UIColor.white.cgColor
        mobileNumberTF.layer.borderWidth = 1
        
        emailTF.layer.borderColor = UIColor.white.cgColor
        emailTF.layer.borderWidth = 1
        
        userNameTF.layer.borderColor = UIColor.white.cgColor
        userNameTF.layer.borderWidth = 1
    }
    
}

//
//  ViewController.swift
//  SocialApp
//
//  Created by Aruuke Turgunbaeva on 12/1/24.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private lazy var mainImage: UIImageView = MakerView.shared.makeImage(image: UIImage(named: "image"),
                                                                         cornerRadius: 2,
                                                                         contentMode: .scaleAspectFit)
    
    private lazy var mainTitle: UILabel = MakerView.shared.makeLabel(text: "Welcome Back",
                                                                     textColor: .white,
                                                                     textSize: 34,
                                                                     textWeight: .semibold)
    
    private lazy var descTitle: UILabel = MakerView.shared.makeLabel(text: "Sign in to continue",
                                                                     textColor: .white,
                                                                     textSize: 20,
                                                                     textWeight: .light)
    
    private lazy var subView: UIView = MakerView.shared.makeView(backgroundColor: .white)
    
    private lazy var idTitle: UILabel = MakerView.shared.makeLabel(text: "Employee Id / Email",
                                                                   textColor: .init(hex: "#A5A5A5"),
                                                                   textSize: 12,
                                                                   textWeight: .regular)
    
    private lazy var idTF: UITextField = MakerView.shared.makeTextField(leftViewMode: .always)
    
    private lazy var passwordTitle: UILabel = MakerView.shared.makeLabel(text: "Password",
                                                                         textColor: .init(hex: "#A5A5A5"),
                                                                         textSize: 12,
                                                                         textWeight: .regular)
    
    private lazy var passTF: UITextField = MakerView.shared.makeTextField(leftViewMode: .always)
    
    private lazy var forgotPassButton: UIButton = MakerView.shared.makeButton(title: "Forgot Password?",
                                                                              backgroundColor: .clear,
                                                                              titleColor: .init(hex: "#4B94EA"),
                                                                              cornerRadius: 0,
                                                                              action: #selector(forgotPasswordPage(_:)),
                                                                              font: UIFont.systemFont(ofSize: 14))
    
    private var isChecked = false
    
    private lazy var checkBoxButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: isChecked ? "checked" : "unchecked"), for: .normal)
        button.addTarget(self, action: #selector(checkBoxTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var checkBoxTitle: UILabel = MakerView().makeLabel(text: "Remember Me",
                                                                    textColor: .black,
                                                                    textSize: 18,
                                                                    textWeight: .semibold)
    
    private lazy var idLineView: UIView = MakerView().makeView(backgroundColor: .black)
    
    private lazy var passLineView: UIView = MakerView().makeView(backgroundColor: .black)
    
    private lazy var signInButton: UIButton = MakerView().makeButton(title: "Sign In",
                                                                     backgroundColor: .init(hex: "#2855AE"),
                                                                     titleColor: .white,
                                                                     cornerRadius: 15,
                                                                     action: #selector(showNextPage(_:)),
                                                                     font: UIFont.systemFont(ofSize: 17))
    
    private lazy var accTitle: UILabel = MakerView().makeLabel(text: "Don't have an Account?",
                                                               textColor: .black,
                                                               textSize: 13,
                                                               textWeight: .regular)
    
    private lazy var signUpButton: UIButton = MakerView().makeButton(title: "Sign Up",
                                                                     backgroundColor: .clear,
                                                                     titleColor: .init(hex: "#4B94EA"),
                                                                     cornerRadius: 0,
                                                                     action: #selector(signUpPage(_:)),
                                                                     font: UIFont.systemFont(ofSize: 14))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        initUI()
    }
    
    private func initUI() {
        setGradientBackground()
        setupSubView()
    }
    
    private func setupUI(){
        view.backgroundColor = .init(hex: "#4AC6E9")
        setupImage()
        
        setupSubView()
        
        setupIdTitle()
        setupIdTF()
        setupIdLine()
        
        setupPassTitle()
        setupPassTF()
        setupPassLine()
        
        setupForgotPassButton()
        
        setupCheckBox()
        setupCheckBoxTitle()
        
        setupSignInButton()
        
        setupAccTitle()
        setupSignUpButton()
        
        setupDescTitle()
        setupTitle()
    }
    
    private func setupImage(){
        view.addSubview(mainImage)
        mainImage.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(-20)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(260)
        }
    }
    
    private func setupDescTitle(){
        view.addSubview(descTitle)
        descTitle.snp.makeConstraints { make in
            make.bottom.equalTo(subView.snp.top).offset(-8)
            make.leading.equalToSuperview().offset(16)
        }
    }
    
    private func setupTitle(){
        view.addSubview(mainTitle)
        mainTitle.snp.makeConstraints { make in
            make.bottom.equalTo(descTitle.snp.top).offset(-12)
            make.leading.equalToSuperview().offset(16)
        }
    }
    
    private let height = UIScreen.main.bounds.height
    
    private func setupSubView(){
        view.addSubview(subView)
        subView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(height / 1.65)
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
    
    
    
    private func setupIdTitle(){
        subView.addSubview(idTitle)
        idTitle.snp.makeConstraints { make in
            make.top.equalTo(subView).offset(43)
            make.leading.equalTo(subView).offset(20)
        }
    }
    
    private func setupIdTF(){
        subView.addSubview(idTF)
        idTF.snp.makeConstraints { make in
            make.top.equalTo(idTitle.snp.bottom).offset(13)
            make.leading.trailing.equalTo(subView).inset(20)
            make.height.equalTo(46)
        }
    }
    
    private func setupIdLine(){
        subView.addSubview(idLineView)
        idLineView.snp.makeConstraints { make in
            make.top.equalTo(idTF.snp.bottom).offset(3)
            make.leading.trailing.equalTo(subView).inset(20)
            make.height.equalTo(1)
            
        }
    }
    
    private func setupPassTitle(){
        subView.addSubview(passwordTitle)
        passwordTitle.snp.makeConstraints { make in
            make.top.equalTo(idLineView.snp.bottom).offset(25)
            make.leading.equalTo(subView).offset(20)
        }
    }
    
    private func setupPassTF(){
        subView.addSubview(passTF)
        passTF.snp.makeConstraints { make in
            make.top.equalTo(passwordTitle.snp.bottom).offset(13)
            make.leading.trailing.equalTo(subView).inset(20)
            make.height.equalTo(40)
        }
    }
    
    private func setupPassLine(){
        subView.addSubview(passLineView)
        passLineView.snp.makeConstraints { make in
            make.top.equalTo(passTF.snp.bottom).offset(3)
            make.leading.trailing.equalTo(subView).inset(20)
            make.height.equalTo(1)
        }
    }
    
    private func setupForgotPassButton() {
        subView.addSubview(forgotPassButton)
        forgotPassButton.snp.makeConstraints { make in
            make.top.equalTo(passLineView.snp.bottom).offset(5)
            make.trailing.equalTo(subView).offset(-20)
        }
        forgotPassButton.addTarget(self, action: #selector(forgotPasswordPage(_:)), for: .touchUpInside)
    }
    
    @objc private func checkBoxTapped() {
        isChecked.toggle()
        checkBoxButton.setImage(UIImage(named: isChecked ? "checked" : "unchecked"), for: .normal)
    }
    
    private func setupCheckBox(){
        subView.addSubview(checkBoxButton)
        checkBoxButton.snp.makeConstraints { make in
            make.top.equalTo(forgotPassButton.snp.bottom).offset(12)
            make.leading.equalTo(subView).inset(20)
            make.height.width.equalTo(30)
        }
    }
    
    private func setupCheckBoxTitle(){
        subView.addSubview(checkBoxTitle)
        checkBoxTitle.snp.makeConstraints { make in
            make.top.equalTo(forgotPassButton.snp.bottom).offset(12)
            make.leading.equalTo(checkBoxButton.snp.trailing).offset(10)
            make.centerY.equalTo(checkBoxButton.snp.centerY)
        }
    }
    
    private func setupSignInButton(){
        subView.addSubview(signInButton)
        signInButton.snp.makeConstraints { make in
            make.top.equalTo(checkBoxTitle.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.height.equalTo(40)
            make.width.equalTo(170)
        }
    }
    
    private func setupAccTitle(){
        subView.addSubview(accTitle)
        accTitle.snp.makeConstraints { make in
            make.bottom.equalTo(view.snp.bottom).offset(-25)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
        }
    }
    
    private func setupSignUpButton(){
        subView.addSubview(signUpButton)
        signUpButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.snp.bottom).offset(-25)
            make.centerY.equalTo(accTitle.snp.centerY)
            make.leading.equalTo(accTitle.snp.trailing).offset(2)
        }
    }
    
    
    @objc private func showNextPage(_ sender: UIButton) {
        check()
    }
    
    @objc private func signUpPage(_ sender: UIButton) {
        let vc = ForgotPwdViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func forgotPasswordPage(_ sender: UIButton) {
        let vc = ForgotPwdViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func check() {
        checkField(text: idTF.text, title: idTitle, textField: idTF)
        checkField(text: passTF.text, title: passwordTitle, textField: passTF)
        
        if idTF.text?.count ?? 0 >= 6, passTF.text?.count ?? 0 >= 6 {
            let vc = SuccessPageViewController()
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func checkField(text: String?, title: UILabel, textField: UITextField) {
        if text?.count ?? 0 < 6 {
            title.text = "Please, fill the field"
            title.textColor = .red
            textField.layer.borderWidth = 1
            textField.layer.borderColor = UIColor.red.cgColor
        } else {
            title.text = (textField == idTF) ? "Employee Id / Email" : "Password"
            title.textColor = .init(hex: "#A5A5A5")
            textField.layer.borderColor = UIColor.white.cgColor
            textField.layer.borderWidth = 1
        }
    }
}





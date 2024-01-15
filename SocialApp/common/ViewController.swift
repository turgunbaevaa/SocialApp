//
//  ViewController.swift
//  SocialApp
//
//  Created by Aruuke Turgunbaeva on 12/1/24.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private lazy var mainImage: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "image")
        img.contentMode = .scaleAspectFit
        img.clipsToBounds = true
        return img
    }()
    
    private lazy var mainTitle: UILabel = {
        let title = UILabel()
        title.text = "Welcome Back"
        title.textColor = .init(hex: "#FFFFFF")
        title.font = .systemFont(ofSize: 34, weight: .semibold)
        return title
    }()
    
    private lazy var descTitle: UILabel = {
        let desc = UILabel()
        desc.text = "Sign in to continue"
        desc.textColor = .init(hex: "#FFFFFF")
        desc.font = .systemFont(ofSize: 20, weight: .light)
        return desc
    }()
    
    private lazy var subView: UIView = {
        let view = UIView()
        view.backgroundColor = .init(hex: "#FFFFFF")
        return view
    }()
    
    private lazy var idTitle: UILabel = {
        let title = UILabel()
        title.text = "Employee Id / Email"
        title.textColor = .init(hex: "#A5A5A5")
        title.font = .systemFont(ofSize: 12, weight: .regular)
        return title
    }()
    
    private lazy var idTF: UITextField = {
        let tf = UITextField()
        let tfView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 3))
        tf.leftView = tfView
        tf.leftViewMode = .always
        return tf
    }()
    
    private lazy var passwordTitle: UILabel = {
        let title = UILabel()
        title.text = "Password"
        title.textColor = .init(hex: "#A5A5A5")
        title.font = .systemFont(ofSize: 12, weight: .regular)
        return title
    }()
    
    private lazy var passTF: UITextField = {
        let tf = UITextField()
        let tfView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 3))
        tf.leftView = tfView
        tf.leftViewMode = .always
        return tf
    }()
    
    private lazy var forgotPassButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Forgot Password?", for: .normal)
        button.setTitleColor(.init(hex: "#4B94EA"), for: .normal)
        return button
    }()
    
    private var isChecked = false
    
    private lazy var checkBoxButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: isChecked ? "checked" : "unchecked"), for: .normal)
        button.addTarget(self, action: #selector(checkBoxTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var checkBoxTitle: UILabel = {
        let title = UILabel()
        title.text = "Remember Me"
        title.textColor = .init(hex: "#000000")
        title.font = .systemFont(ofSize: 18, weight: .semibold)
        return title
    }()
    
    private lazy var idLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .init(hex: "#000000")
        return view
    }()
    
    private lazy var passLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .init(hex: "#000000")
        return view
    }()
    
    private lazy var signInButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign In", for: .normal)
        button.backgroundColor = .init(hex: "#2855AE")
        button.layer.cornerRadius = 15
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(showNextPage(_:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var accTitle: UILabel = {
        let title = UILabel()
        title.text = "Don't have an Account?"
        title.textColor = .init(hex: "#000000")
        title.font = .systemFont(ofSize: 13, weight: .regular)
        return title
    }()
    
    private lazy var signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(.init(hex: "#4B94EA"), for: .normal)
        return button
    }()
    
    
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
        
        setupForgotPassTitle()
        
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
    
    private func setupForgotPassTitle(){
        subView.addSubview(forgotPassButton)
        forgotPassButton.snp.makeConstraints { make in
            make.top.equalTo(passLineView.snp.bottom).offset(3)
            make.trailing.equalTo(subView).offset(-20)
        }
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
    
    func check() {
        if idTF.text?.count ?? 0 < 6 {
            idTitle.text = "Please, fill the field"
            idTitle.textColor = .red
            idTF.layer.borderWidth = 1
            idTF.layer.borderColor = UIColor.red.cgColor
        } else {
            idTitle.text = "Employee Id / Email"
            idTitle.textColor = .init(hex: "#A5A5A5")
            idTF.layer.borderColor = UIColor.white.cgColor
            idTF.layer.borderWidth = 1
        }
        
        if passTF.text?.count ?? 0 < 6 {
            passwordTitle.text = "Please, fill the field"
            passwordTitle.textColor = .red
            passTF.layer.borderWidth = 1
            passTF.layer.borderColor = UIColor.red.cgColor
        } else {
            passwordTitle.text = "Password"
            passwordTitle.textColor = .init(hex: "#A5A5A5")
            passTF.layer.borderColor = UIColor.white.cgColor
            passTF.layer.borderWidth = 1
        }
        
        if idTF.text?.count ?? 0 >= 6, passTF.text?.count ?? 0 >= 6 {
            let vc = SuccessPageViewController()
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}





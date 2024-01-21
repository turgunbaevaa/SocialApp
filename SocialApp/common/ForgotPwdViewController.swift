//
//  ForgotPwdViewController.swift
//  SocialApp
//
//  Created by Aruuke Turgunbaeva on 20/1/24.
//

import UIKit
import SnapKit

class ForgotPwdViewController: UIViewController{
    
    private lazy var mainImage: UIImageView = MakerView.shared.makeImage(image: UIImage(named: "locked"),
                                                                    cornerRadius: 2,
                                                                    contentMode: .scaleAspectFit)
    
    private lazy var codeResetTF: UITextField = MakerView.shared.makeTextField(leftViewMode: .always)
    
    private lazy var mainTitle: UILabel = MakerView.shared.makeLabel(text: "Trouble Logging in?",
                                                                textColor: .white,
                                                                textSize: 24,
                                                                textWeight: .semibold)
    
    private lazy var descTitle: UILabel = MakerView.shared.makeLabel(text: "Enter your email or  mobile number and we'll send you a OTP to get back into your account.",
                                                                textColor: .white,
                                                                textSize: 11,
                                                                textWeight: .regular)
    
    private lazy var subView: UIView = MakerView.shared.makeView(backgroundColor: .white)
    
    private lazy var employeeIdTitle: UILabel = MakerView.shared.makeLabel(text: "Employee Id",
                                                              textColor: .init(hex: "#A5A5A5"),
                                                              textSize: 12,
                                                              textWeight: .regular)
    
    private lazy var employeeIdTF: UITextField = MakerView.shared.makeTextField(leftViewMode: .always)
    
    private lazy var empIdLineView: UIView = MakerView.shared.makeView(backgroundColor: .black)
    
    private lazy var codeInputTF: UITextField = MakerView.shared.makeTextField(leftViewMode: .always)
    
    private lazy var getOTPButton: UIButton = MakerView.shared.makeButton(title: "Get OTP",
                                                                     backgroundColor: .init(hex: "#F5D04A"),
                                                                     titleColor: .white,
                                                                     cornerRadius: 15,
                                                                     action: #selector(showNextPage(_:)),
                                                                     font: UIFont.systemFont(ofSize: 18))
    
    private lazy var stackView: UIStackView = MakerView.shared.makeHorizontalStackView(axis: .horizontal, spacing: 7)
    
    private lazy var makeCodeButton: UIButton = MakerView.shared.makeCodeButton(cornerRadius: 10)

    private lazy var submitButton: UIButton = MakerView.shared.makeButton(title: "Submit",
                                                                     backgroundColor: .init(hex: "#4AB07E"),
                                                                     titleColor: .white,
                                                                     cornerRadius: 15,
                                                                     action: #selector(showNextPage(_:)),
                                                                     font: UIFont.systemFont(ofSize: 18))
    override func viewDidLoad() {
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
        setupCodeResetTF()
        
        setupDescTitle()
        setupTitle()

        setupSubView()

        setupIdTitle()
        setupEmpIdTF()
        setupIdLine()

        setupCodeInputTF()

        setupOTPButton()

        setupStackView()

        setupSubmitButton()
    }

    
    private func setupImage(){
        view.addSubview(mainImage)
        mainImage.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(-20)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(800)
        }
    }
    
    private let height = UIScreen.main.bounds.height
    
    private func setupCodeResetTF(){
        view.addSubview(codeResetTF)
        codeResetTF.snp.makeConstraints { make in
            make.top.equalTo(mainImage.snp.bottom).offset(34)
            make.leading.trailing.equalTo(subView).inset(40)
            make.height.equalTo(40)
        }
    }
    
    private func setupDescTitle(){
        view.addSubview(descTitle)
        descTitle.snp.makeConstraints { make in
            make.bottom.equalTo(subView.snp.top).offset(-20)
            make.centerX.centerY.equalToSuperview()
        }
    }

    private func setupTitle(){
        view.addSubview(mainTitle)
        mainTitle.snp.makeConstraints { make in
            make.bottom.equalTo(descTitle.snp.top).offset(-38)
            make.centerX.centerY.equalToSuperview()
        }
    }
    
    private func setupSubView(){
        view.addSubview(subView)
        subView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(height / 1.55)
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
        subView.addSubview(employeeIdTitle)
        employeeIdTitle.snp.makeConstraints { make in
            make.top.equalTo(subView).offset(43)
            make.leading.equalTo(subView).offset(20)
        }
    }
    
    private func setupEmpIdTF(){
        view.addSubview(employeeIdTF)
        employeeIdTF.snp.makeConstraints { make in
            make.top.equalTo(subView.snp.bottom).offset(34)
            make.leading.trailing.equalTo(subView).inset(40)
            make.height.equalTo(40)
        }
    }

    
    private func setupIdLine(){
        subView.addSubview(empIdLineView)
        empIdLineView.snp.makeConstraints { make in
            make.top.equalTo(employeeIdTF.snp.bottom).offset(3)
            make.leading.trailing.equalTo(subView).inset(20)
            make.height.equalTo(1)
        }
    }
    
    private func setupCodeInputTF(){
        subView.addSubview(codeInputTF)
        codeInputTF.snp.makeConstraints { make in
            make.top.equalTo(empIdLineView.snp.bottom).offset(13)
            make.leading.trailing.equalTo(subView).inset(20)
            make.height.equalTo(46)
        }
    }
    
    private func setupOTPButton(){
        subView.addSubview(getOTPButton)
        getOTPButton.snp.makeConstraints { make in
            make.top.equalTo(codeInputTF.snp.bottom).offset(3)
            make.trailing.equalTo(subView).offset(-20)
        }
    }
    
    private func setupStackView(){
        subView.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.top.equalTo(getOTPButton.snp.bottom).offset(18)
            make.leading.trailing.equalTo(subView).inset(20)
            make.height.equalTo(46)
        }
        stackView.addArrangedSubview(MakerView().makeCodeButton(cornerRadius: 10))
        stackView.addArrangedSubview(MakerView().makeCodeButton(cornerRadius: 10))
        stackView.addArrangedSubview(MakerView().makeCodeButton(cornerRadius: 10))
        stackView.addArrangedSubview(MakerView().makeCodeButton(cornerRadius: 10))
        stackView.addArrangedSubview(MakerView().makeCodeButton(cornerRadius: 10))
        stackView.addArrangedSubview(MakerView().makeCodeButton(cornerRadius: 10))
    }
    
    private func setupSubmitButton(){
        subView.addSubview(submitButton)
        submitButton.snp.makeConstraints { make in
            make.top.equalTo(subView.snp.bottom).offset(-20)
            make.centerX.equalToSuperview()
            make.height.equalTo(35)
            make.width.equalTo(95)
        }
    }
    
    
    @objc private func showNextPage(_ sender: UIButton) {
//        let vc = SuccessPageViewController()
//        navigationController?.pushViewController(vc, animated: true)
    }
}

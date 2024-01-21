//
//  ForgotPwdViewController.swift
//  SocialApp
//
//  Created by Aruuke Turgunbaeva on 20/1/24.
//

import UIKit
import SnapKit
import PhoneNumberKit

class ForgotPwdViewController: UIViewController, UITextFieldDelegate{
    
    private lazy var mainImage: UIImageView = MakerView.shared.makeImage(image: UIImage(named: "padlock"),
                                                                    cornerRadius: 2,
                                                                    contentMode: .scaleAspectFit)
    
    private lazy var codeResetTF: UITextField = MakerView.shared.makeCodeResetTF(placeholder: "Enter a code", leftViewMode: .always, backgroundColor: .init(hex: "#E1E3E8"), borderColor: .init(red: 0, green: 0, blue: 0, alpha: 0))
        
    private lazy var mainTitle: UILabel = MakerView.shared.makeLabel(text: "Trouble Logging in?",
                                                                textColor: .white,
                                                                textSize: 24,
                                                                textWeight: .semibold)
    
    private lazy var descTitle: UILabel = MakerView.shared.makeLabel(text: "Enter your email or  mobile number and we'll send you a OTP to get back into your account.",
                                                                textColor: .white,
                                                                textSize: 12,
                                                                textWeight: .regular)
    
    private lazy var subView: UIView = MakerView.shared.makeView(backgroundColor: .white)
    
    private lazy var employeeIdTitle: UILabel = MakerView.shared.makeLabel(text: "Employee Id",
                                                              textColor: .init(hex: "#A5A5A5"),
                                                              textSize: 12,
                                                              textWeight: .regular)
    
    private lazy var mobileNumberTF: PhoneNumberTextField = MakerView.shared.makePhoneNumberTextField(delegate: self)
    
    private lazy var empIdLineView: UIView = MakerView.shared.makeView(backgroundColor: .gray)
    
    private lazy var codeInputTF: UITextField = MakerView.shared.makeCodeResetTF(leftViewMode: .always,
                                                                                 backgroundColor: .white,
                                                                                 borderColor: UIColor.gray.cgColor)
    
    private lazy var getOTPButton: UIButton = MakerView().makeButton(title: "Get OTP",
                                                                     backgroundColor: .init(hex: "#F5D04A"),
                                                                     titleColor: .white,
                                                                     cornerRadius: 15,
                                                                     font: UIFont.systemFont(ofSize: 18))
    
    private lazy var stackView: UIStackView = MakerView.shared.makeHorizontalStackView(axis: .horizontal, spacing: 7)
    
    private lazy var makeCodeButton: UIButton = MakerView.shared.makeCodeButton(cornerRadius: 10)

    private lazy var submitButton: UIButton = MakerView().makeButton(title: "Submit",
                                                                     backgroundColor: .init(hex: "#4AB07E"),
                                                                     titleColor: .white,
                                                                     cornerRadius: 15,
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
        
        setupTitle()
        setupDescTitle()

        setupSubView()

        setupIdTitle()
        setupMobileNumTF()
        setupIdLine()

        setupCodeInputTF()

        setupOTPButton()

        setupStackView()

        setupSubmitButton()
    }

    
    private func setupImage(){
        view.addSubview(mainImage)
        mainImage.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(100)
        }
    }
    
    private let height = UIScreen.main.bounds.height
    
    private func setupTitle() {
        view.addSubview(mainTitle)
        mainTitle.snp.makeConstraints { make in
            make.top.equalTo(codeResetTF.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
    }
    
    private func setupDescTitle() {
        view.addSubview(descTitle)
        descTitle.snp.makeConstraints { make in
            make.top.equalTo(mainTitle.snp.bottom)//.offset(10)
            make.leading.trailing.equalToSuperview().inset(65)
            make.centerX.equalToSuperview()
        }
    }

    private func setupCodeResetTF() {
        view.addSubview(codeResetTF)
        codeResetTF.snp.makeConstraints { make in
            make.top.equalTo(mainImage.snp.bottom).offset(15)
            make.leading.trailing.equalToSuperview().inset(40)
            make.height.equalTo(40)
        }
    }
    
    private func setupSubView(){
        view.addSubview(subView)
        subView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(height / 1.90)
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
            make.top.equalTo(subView).offset(35)
            make.leading.equalTo(subView).offset(25)
        }
    }
    
    private func setupMobileNumTF(){
        subView.addSubview(mobileNumberTF)
        mobileNumberTF.snp.makeConstraints { make in
            make.top.equalTo(employeeIdTitle.snp.bottom).offset(10)
            make.leading.trailing.equalTo(subView).inset(25)
            make.height.equalTo(40)
        }
        mobileNumberTF.delegate = self
    }
    
    internal func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return false }
        let newString = (text as NSString).replacingCharacters(in: range, with: string)
        textField.text = formatter(mask: "+XXX (XXX)-(XXX)-(XXX)", phoneNumber: newString)
        return false
    }
    
    private func formatter(mask: String, phoneNumber: String) -> String {
        let number = phoneNumber.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        var result: String = ""
        var index = number.startIndex
        
        for character in mask where index < number.endIndex {
            if character == "X" {
                result.append(number[index])
                index = number.index(after: index)
            } else {
                result.append(character)
            }
        }
        return result
    }

    private func setupIdLine(){
        subView.addSubview(empIdLineView)
        empIdLineView.snp.makeConstraints { make in
            make.top.equalTo(mobileNumberTF.snp.bottom).offset(3)
            make.leading.trailing.equalTo(subView).inset(25)
            make.height.equalTo(1)
        }
    }
    
    private func setupCodeInputTF(){
        subView.addSubview(codeInputTF)
        codeInputTF.snp.makeConstraints { make in
            make.top.equalTo(empIdLineView.snp.bottom).offset(25)
            make.leading.trailing.equalTo(subView).inset(25)
            make.height.equalTo(42)
        }
    }
    
    private func setupOTPButton(){
        subView.addSubview(getOTPButton)
        getOTPButton.snp.makeConstraints { make in
            make.top.equalTo(codeInputTF.snp.bottom).offset(16)
            make.trailing.equalTo(subView).offset(-25)
            make.height.equalTo(35)
            make.width.equalTo(95)
        }
        getOTPButton.addTarget(self, action: #selector(getOTPCode(_:)), for: .touchUpInside)
    }
    
    private func setupStackView(){
        subView.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.top.equalTo(getOTPButton.snp.bottom).offset(20)
            make.leading.trailing.equalTo(subView).inset(45)
            make.height.equalTo(44)
        }
        stackView.addArrangedSubview(MakerView.shared.makeCodeButton(cornerRadius: 10))
        stackView.addArrangedSubview(MakerView.shared.makeCodeButton(cornerRadius: 10))
        stackView.addArrangedSubview(MakerView.shared.makeCodeButton(cornerRadius: 10))
        stackView.addArrangedSubview(MakerView.shared.makeCodeButton(cornerRadius: 10))
        stackView.addArrangedSubview(MakerView.shared.makeCodeButton(cornerRadius: 10))
        stackView.addArrangedSubview(MakerView.shared.makeCodeButton(cornerRadius: 10))
    }
    
    private func setupSubmitButton(){
        subView.addSubview(submitButton)
        submitButton.snp.makeConstraints { make in
            make.bottom.equalTo(subView.snp.bottom).offset(-20)
            make.centerX.equalToSuperview()
            make.height.equalTo(35)
            make.width.equalTo(95)
        }
        submitButton.addTarget(self, action: #selector(newPwdPage(_:)), for: .touchUpInside)
    }
    
    @objc private func getOTPCode(_ sender: Any) {
        guard mobileNumberTF.hasText, let phoneNumber = mobileNumberTF.phoneNumber else {
            return
        }
        getOTPButton.isEnabled = true
        codeResetTF.isEnabled = true
//        let vc = NewPwdViewController()
//        navigationController?.pushViewController(vc, animated: true)
    }

    
    @objc private func newPwdPage(_ sender: UIButton) {
        if isCodeResetTFFilled() {
            let vc = NewPwdViewController()
            navigationController?.pushViewController(vc, animated: true)
            codeResetTF.layer.borderColor = UIColor.clear.cgColor
        } else {
            codeResetTF.layer.borderColor = UIColor.red.cgColor
            codeResetTF.layer.borderWidth = 1.0
        }
    }
    
    private func isCodeResetTFFilled() -> Bool {
        return !(codeResetTF.text?.isEmpty ?? true)
    }
    
    
    
}

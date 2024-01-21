//
//  NewPwdViewController.swift
//  SocialApp
//
//  Created by Aruuke Turgunbaeva on 21/1/24.
//

import UIKit
import SnapKit

class NewPwdViewController: UIViewController{
    
    private lazy var mainImage: UIImageView = MakerView.shared.makeImage(image: UIImage(named: "padlock"),
                                                                         cornerRadius: 2,
                                                                         contentMode: .scaleAspectFit)
    
    private lazy var codeResetTF: UITextField = MakerView.shared.makeCodeResetTF(placeholder: "Employee ID", leftViewMode: .always, backgroundColor: .init(hex: "#E1E3E8"), borderColor: .init(red: 0, green: 0, blue: 0, alpha: 0))
    
    private lazy var subView: UIView = MakerView.shared.makeView(backgroundColor: .white)
    
    private lazy var newPwdTitle: UILabel = MakerView.shared.makeLabel(text: "New Password",
                                                              textColor: .init(hex: "#A5A5A5"),
                                                              textSize: 12,
                                                              textWeight: .regular)
    
    private lazy var newPwdTF: UITextField = MakerView.shared.makeTextField(leftViewMode: .always)
    
    private lazy var newPwdLineView: UIView = MakerView.shared.makeView(backgroundColor: .gray)
    
    private lazy var confirmPwdTitle: UILabel = MakerView.shared.makeLabel(text: "Confirm Password",
                                                              textColor: .init(hex: "#A5A5A5"),
                                                              textSize: 12,
                                                              textWeight: .regular)
    
    private lazy var confirmPwdTF: UITextField = MakerView.shared.makeTextField(leftViewMode: .always)
    
    private lazy var confirmPwdLineView: UIView = MakerView.shared.makeView(backgroundColor: .gray)
    
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
        
        setupNewPwdTitle()
        setupNewPwdTF()
        setupNewPwdLine()
        
        setupConfirmPwdTitle()
        setupConfirmPwdTF()
        setupConfirmPwdLine()
        
        setupSubmitButton()
    }
    
    private func setupUI(){
        view.backgroundColor = .init(hex: "#4AC6E9")
        setupImage()
        setupCodeResetTF()
    }
    
    private func setupImage(){
        view.addSubview(mainImage)
        mainImage.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(100)
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
    
    private let height = UIScreen.main.bounds.height
    
    private func setupSubView(){
        view.addSubview(subView)
        subView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(height / 1.70)
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
    
    private func setupNewPwdTitle(){
        subView.addSubview(newPwdTitle)
        newPwdTitle.snp.makeConstraints { make in
            make.top.equalTo(subView).offset(35)
            make.leading.equalTo(subView).offset(25)
        }
    }
    
    private func setupNewPwdTF(){
        subView.addSubview(newPwdTF)
        newPwdTF.snp.makeConstraints { make in
            make.top.equalTo(newPwdTitle.snp.bottom).offset(10)
            make.leading.trailing.equalTo(subView).inset(25)
            make.height.equalTo(40)
        }
    }
    
    private func setupNewPwdLine(){
        subView.addSubview(newPwdLineView)
        newPwdLineView.snp.makeConstraints { make in
            make.top.equalTo(newPwdTF.snp.bottom).offset(3)
            make.leading.trailing.equalTo(subView).inset(25)
            make.height.equalTo(1)
        }
    }
    
    private func setupConfirmPwdTitle(){
        subView.addSubview(confirmPwdTitle)
        confirmPwdTitle.snp.makeConstraints { make in
            make.top.equalTo(newPwdLineView.snp.bottom).offset(15)
            make.leading.equalTo(subView).offset(20)
        }
    }
    
    private func setupConfirmPwdTF(){
        subView.addSubview(confirmPwdTF)
        confirmPwdTF.snp.makeConstraints { make in
            make.top.equalTo(confirmPwdTitle.snp.bottom).offset(10)
            make.leading.trailing.equalTo(subView).inset(25)
            make.height.equalTo(40)
        }
    }
    
    private func setupConfirmPwdLine(){
        subView.addSubview(confirmPwdLineView)
        confirmPwdLineView.snp.makeConstraints { make in
            make.top.equalTo(confirmPwdTF.snp.bottom).offset(3)
            make.leading.trailing.equalTo(subView).inset(25)
            make.height.equalTo(1)
        }
    }
    
    private func setupSubmitButton(){
        subView.addSubview(submitButton)
        submitButton.snp.makeConstraints { make in
            make.bottom.equalTo(subView.snp.bottom).offset(-20)
            make.centerX.equalToSuperview()
            make.height.equalTo(35)
            make.width.equalTo(95)
        }
        submitButton.addTarget(self, action: #selector(showSuccessPage(_:)), for: .touchUpInside)
    }
    
    @objc private func showSuccessPage(_ sender: UIButton) {
        check()
    }
    
    func check() {
        checkField(text: newPwdTF.text, title: newPwdTitle, textField: newPwdTF)
        checkField(text: confirmPwdTF.text, title: confirmPwdTitle, textField: confirmPwdTF)
        
        if newPwdTF.text?.count ?? 0 >= 6, confirmPwdTF.text?.count ?? 0 >= 6 {
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
            title.text = (textField == newPwdTF) ? "New Password" : "Confirm Password"
            title.textColor = .init(hex: "#A5A5A5")
            textField.layer.borderColor = UIColor.white.cgColor
            textField.layer.borderWidth = 1
        }
    }
    
}

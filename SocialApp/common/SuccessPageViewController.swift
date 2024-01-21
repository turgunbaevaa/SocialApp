//
//  SuccessPageViewController.swift
//  SocialApp
//
//  Created by Aruuke Turgunbaeva on 13/1/24.
//

import UIKit
import SnapKit

class SuccessPageViewController: UIViewController {

    private lazy var mainImage: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "success")
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        return img
    }()
    
    private lazy var mainTitle: UILabel = {
        let title = UILabel()
        title.text = "Success"
        title.textColor = .init(hex: "#FFFFFF")
        title.font = .systemFont(ofSize: 34, weight: .medium)
        return title
    }()
    
    private lazy var signInButton: UIButton = MakerView().makeButton(title: "Sign In",
                                                                     backgroundColor: .init(hex: "#4AC6E9"),
                                                                     titleColor: .white,
                                                                     cornerRadius: 15,
                                                                     font: UIFont.systemFont(ofSize: 18))
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    private func setupUI(){
        view.backgroundColor = .init(hex: "#4AC6E9")
        setupImage()
        setupTitle()
        setupSignInButton()
    }
    
    private func setupImage(){
        view.addSubview(mainImage)
        mainImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalTo(240)
        }
    }
    
    private func setupTitle(){
        view.addSubview(mainTitle)
        mainTitle.snp.makeConstraints { make in
            make.top.equalTo(mainImage.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
        }
    }
    
    private func setupSignInButton(){
        view.addSubview(signInButton)
        signInButton.snp.makeConstraints { make in
            make.top.equalTo(mainTitle.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
        }
        
        signInButton.addTarget(self, action: #selector(showSignInPage(_:)), for: .touchUpInside)
    }
    
    @objc private func showSignInPage(_ sender: UIButton){
        navigationController?.popToRootViewController(animated: true)
    }
    
    
    

}

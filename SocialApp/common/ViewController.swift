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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
    }
    
    private func setupUI(){
        view.backgroundColor = .init(hex: "#4AC6E9")
        setupImage()
        setupTitle()
        setupDescTitle()
    }
    
    private func setupImage(){
        view.addSubview(mainImage)
        mainImage.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide) // Верхний край по верхней границе safeArea
            make.centerX.equalToSuperview()
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(256)
        }
    }
    
    private func setupTitle(){
        view.addSubview(mainTitle)
        mainTitle.snp.makeConstraints { make in
            make.top.equalTo(mainImage.snp.bottom).offset(4)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(16)
        }
    }
    
    private func setupDescTitle(){
        view.addSubview(descTitle)
        descTitle.snp.makeConstraints { make in
            make.top.equalTo(mainTitle.snp.bottom).offset(4)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(16)
        }
    }



}


extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        let hexString: String = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        
        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        var color: UInt32 = 0
        
        guard scanner.scanHexInt32(&color) else {
            self.init(red: 0, green: 0, blue: 0, alpha: alpha)
            return
        }
        
        let mask: UInt32 = 0x000000FF
        let r = Int(color >> 16) & Int(mask)
        let g = Int(color >> 8) & Int(mask)
        let b = Int(color) & Int(mask)
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}



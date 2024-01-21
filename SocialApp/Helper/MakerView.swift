//
//  MakerView.swift
//  SocialApp
//
//  Created by Aruuke Turgunbaeva on 20/1/24.
//

import UIKit

class MakerView{
    
    static let shared = MakerView()
    
    func makeLabel(text: String,
                   textColor: UIColor,
                   textSize: CGFloat, textWeight: UIFont.Weight,
                   textAlignment: NSTextAlignment = .left,
                   numberOfLines: Int = 0,
                   lineBreakMode: NSLineBreakMode = .byWordWrapping ) -> UILabel{
        let label = UILabel()
        label.text = text
        label.textColor = textColor
        label.font = .systemFont(ofSize: textSize, weight: textWeight)
        label.textAlignment = textAlignment
        label.numberOfLines = numberOfLines
        label.lineBreakMode = lineBreakMode
        return label
    }
    
    func makeTextField(placeholder: String = "Fill the field",
                       placeholderFontSize: CGFloat = 13.0,
                       textColor: UIColor = .black,
                       keyboardType: UIKeyboardType = .default,
                       leftViewMode: UITextField.ViewMode,
                       cornerRadius: CGFloat = 2) -> UITextField{
        let tf = UITextField()
        tf.placeholder = placeholder
        tf.attributedPlaceholder = NSAttributedString(string: placeholder,
                                                          attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: placeholderFontSize)])
        tf.textColor = textColor
        tf.keyboardType = keyboardType
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 3))
        tf.leftView = view
        tf.leftViewMode = leftViewMode
        tf.layer.cornerRadius = cornerRadius
        return tf
    }
    
    func makeImage (image: UIImage? = nil,
                    cornerRadius: CGFloat,
                    contentMode: UIView.ContentMode) -> UIImageView {
        let img = UIImageView()
        img.layer.cornerRadius = cornerRadius
        img.image = image
        img.contentMode = contentMode
        return img
    }
    
    func makeView(backgroundColor: UIColor) -> UIView{
        let view = UIView()
        view.backgroundColor = backgroundColor
        return view
    }
    
//    func makeButton(title: String?,
//                    backgroundColor: UIColor,
//                    titleColor: UIColor?,
//                    cornerRadius: CGFloat,
//                    action: Selector,
//                    font: UIFont) -> UIButton {
//        let button = UIButton()
//        button.setTitle(title, for: .normal)
//        button.backgroundColor = backgroundColor
//        button.setTitleColor(titleColor, for: .normal)
//        button.layer.cornerRadius = cornerRadius
//        button.addTarget(self, action: action, for: .touchUpInside)
//        button.titleLabel?.font = font
//        return button
//    }
    
    func makeButton(title: String?,
                    backgroundColor: UIColor,
                    titleColor: UIColor?,
                    cornerRadius: CGFloat,
                    action: Selector?, // Updated to accept Selector
                    font: UIFont) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.backgroundColor = backgroundColor
        button.setTitleColor(titleColor, for: .normal)
        button.layer.cornerRadius = cornerRadius
        
        // Check if action is provided before adding target
        if let action = action {
            button.addTarget(self, action: action, for: .touchUpInside)
        }
        
        button.titleLabel?.font = font
        return button
    }
    
    func makeHorizontalStackView(axis: NSLayoutConstraint.Axis, spacing: CGFloat) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = axis
        stackView.distribution = .fillEqually
        stackView.spacing = spacing
        return stackView
    }
    
    func makeCodeButton(backgroundColor: UIColor = .white,
                        titleColor: UIColor? = .black, cornerRadius: CGFloat, borderWidth: CGFloat = 1, borderColor: CGColor = .init(red: 0, green: 0, blue: 0, alpha: 0) ) -> UIButton {
        let button = UIButton()
        button.backgroundColor = backgroundColor
        button.setTitleColor(titleColor, for: .normal)
        button.layer.cornerRadius = cornerRadius
        button.layer.borderWidth = borderWidth
        button.layer.borderColor = borderColor
        return button
    }
}

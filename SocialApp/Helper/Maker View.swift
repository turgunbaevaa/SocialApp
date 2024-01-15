//
//  Maker View.swift
//  SocialApp
//
//  Created by Aruuke Turgunbaeva on 15/1/24.
//

import UIKit

class MakerView{
    
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
                       textColor: UIColor = .black,
                       keyboardType: UIKeyboardType = .default,
                       leftViewMode: UITextField.ViewMode,
                       cornerRadius: CGFloat = 2) -> UITextField{
        let tf = UITextField()
        tf.placeholder = placeholder
        tf.textColor = textColor
        tf.keyboardType = keyboardType
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 4))
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
    
    func makeButton(title: String?,
                    backgroundColor: UIColor,
                    titleColor: UIColor?,
                    cornerRadius: CGFloat,
                    action: Selector,
                    font: UIFont) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.backgroundColor = backgroundColor
        button.setTitleColor(titleColor, for: .normal)
        button.layer.cornerRadius = cornerRadius
        button.addTarget(self, action: action, for: .touchUpInside)
        button.titleLabel?.font = font
        return button
    }
}

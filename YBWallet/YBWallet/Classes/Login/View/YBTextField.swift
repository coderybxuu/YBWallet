//
//  YBTextField.swift
//  YBWallet
//
//  Created by xuyangbo on 2018/9/17.
//  Copyright © 2018年 xuyangbo. All rights reserved.
//

import UIKit

class YBTextField: UIView,UITextFieldDelegate {

    ///输入框
    lazy var textField : UITextField = {
        
        let textField = UITextField()
        textField.backgroundColor = UIColor.clear
        textField.textColor = textColor
        textField.font = UIFont.systemFont(ofSize: 14)
        textField.textAlignment = .left
        textField.placeholder = placeholder
        textField.clearButtonMode = .whileEditing
        textField.delegate = self
        textField.addTarget(self, action:#selector(textFieldEditingChanged(_:)), for: .editingChanged)
        return textField
    }()
    ///站位文字
    var placeholder : String?
    ///图片名称
    var leftIconName : String?
    ///文字颜色
    var textColor : UIColor?
    ///错误提示信息
    var errorStr : String?
    ///错误提示信息字体颜色
    var errorLableColor : UIColor?
    ///最大字数
    var maxLength : Int = 0
    ///字数限制文本颜色(默认灰色)
    var textLengthLabelColor : UIColor?
    ///底部分割线默认颜色
    var lineDefaultColor : UIColor?
    ///底部线条错误警告颜色(默认红色)
    var lineWarningColor : UIColor?
    ///底部线条选中颜色(默认深绿色)
    var lineSelectedColor : UIColor?
    
    ///左侧图标
    fileprivate lazy var leftIcon : UIImageView = {
        let leftIcon = UIImageView()
        leftIcon.backgroundColor = UIColor.clear
        guard let leftIconName = leftIconName else{return leftIcon}
        leftIcon.image = UIImage(named: leftIconName)
        return leftIcon
    }()
    ///上浮的占位文本
    fileprivate lazy var headerPlaceLabel : UILabel = {
        let headerPlaceLabel = UILabel()
        headerPlaceLabel.backgroundColor = UIColor.clear
        headerPlaceLabel.textColor = UIColor(r: 1, g: 183, b: 164)
        headerPlaceLabel.textAlignment = .left
        headerPlaceLabel.font = UIFont.systemFont(ofSize: current_w(width: 14))
        headerPlaceLabel.text = textField.placeholder
        headerPlaceLabel.alpha = 0
        return headerPlaceLabel
        
    }()
    ///字数限制文本
    fileprivate lazy var lengthLabel : UILabel = {
        let lengthLabel = UILabel()
        lengthLabel.backgroundColor = UIColor.clear
        lengthLabel.textColor = UIColor(r: 92, g: 94, b: 102)
        lengthLabel.textAlignment = .left
        lengthLabel.font = UIFont.systemFont(ofSize: current_w(width: 11))
        lengthLabel.text = "0/\(String(describing: maxLength))"
        return lengthLabel
    }()
    ///底部分割线
    fileprivate lazy var bottomLine : UIView = {
        
        let bottomLine = UIView()
        bottomLine.backgroundColor = lineDefaultColor
        return bottomLine
    }()
    ///错误提示信息
    fileprivate lazy var errorLabel : UILabel = {
        let errorLabel = UILabel()
        errorLabel.backgroundColor = UIColor.clear
        errorLabel.textColor = errorLableColor
        errorLabel.font = UIFont.systemFont(ofSize: current_w(width: 12))
        errorLabel.textAlignment = .left
        errorLabel.text = errorStr
        errorLabel.alpha = 0
        return errorLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        ///设置默认颜色
        textColor = UIColor(r: 85, g: 85, b: 85)
        textLengthLabelColor = UIColor(r: 92, g: 94, b: 102)
        lineDefaultColor = UIColor.white
        lineSelectedColor = UIColor(r: 1, g: 183, b: 164)
        lineWarningColor = UIColor(r: 252, g: 57, b: 24)
        errorLableColor = UIColor(r: 252, g: 57, b: 24)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    ///布局
    override func layoutSubviews() {
        super.layoutSubviews()
        addSubview(leftIcon)
        leftIcon.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: self.frame.size.height - 15, height: self.frame.size.height - 15))
            make.centerY.equalTo(self)
            make.left.equalTo(self)
        }
        
        addSubview(textField)
        textField.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: self.frame.size.width - leftIcon.frame.size.width - current_w(width: 8) - current_w(width: 40), height: self.frame.size.height))
            make.centerY.equalTo(self)
            make.left.equalTo(leftIcon.snp.right).offset(current_w(width: 8))
        }
        
        addSubview(headerPlaceLabel)
        headerPlaceLabel.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: current_w(width: 100), height: current_w(width: 15)))
            make.left.equalTo(leftIcon.snp.left)
            make.bottom.equalTo(textField.snp.top)
        }
        
        addSubview(lengthLabel)
        lengthLabel.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: current_w(width: 40), height: current_w(width: 15)))
            make.left.equalTo(textField.snp.right)
            make.bottom.equalTo(textField.snp.bottom)
        }
        
        addSubview(bottomLine)
        bottomLine.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: self.frame.size.width, height: 1))
            make.left.equalTo(leftIcon.snp.left)
            make.bottom.equalTo(textField.snp.bottom)
        }
        
        addSubview(errorLabel)
        errorLabel.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: current_w(width: 100), height: current_w(width: 15)))
            make.left.equalTo(leftIcon.snp.left)
            make.top.equalTo(bottomLine.snp.bottom)
        }
    }
}

//监听
extension YBTextField{
    @objc func textFieldEditingChanged(_ textField:UITextField) {
        
//        guard let currentString: NSString = textField.text as NSString? else{return}
        
        if textField.text == nil {
            textField.text = ""
        }
        let currentString: NSString = textField.text! as NSString
        if currentString.length > maxLength {
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                self.errorLabel.alpha = 1.0
                self.errorLabel.textColor = self.lineWarningColor
                self.bottomLine.backgroundColor = self.lineWarningColor
                self.lengthLabel.textColor = self.lineWarningColor
                self.textField.textColor = self.lineWarningColor
               
            }, completion: nil)
        }else{
            
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                self.errorLabel.alpha = 0.0
//                self.errorLabel.textColor = self.lineWarningColor
                self.bottomLine.backgroundColor = self.lineSelectedColor
                self.lengthLabel.textColor = self.textLengthLabelColor
                self.textField.textColor = self.textColor
                
            }, completion: nil)
        }
        lengthLabel.text = "\((textField.text! as NSString).length)/\(maxLength)"
    }
    
    func setPlaceHolderLableHidden(isHidden:Bool) {
        if isHidden {
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                self.headerPlaceLabel.alpha = 0.0
                self.textField.placeholder = self.placeholder
                self.bottomLine.backgroundColor = self.lineDefaultColor
            }, completion: nil)
        }else{
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                self.headerPlaceLabel.alpha = 1.0
                self.headerPlaceLabel.text = self.placeholder
                self.textField.placeholder = ""
                self.bottomLine.backgroundColor = self.lineSelectedColor
            }, completion: nil)
        }
    }
}

//MARK:-  =============UITextFieldDelegate===============
extension YBTextField{
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        setPlaceHolderLableHidden(isHidden: false)
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        setPlaceHolderLableHidden(isHidden: true)
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        endEditing(true)
        setPlaceHolderLableHidden(isHidden: true)
        return true
    }
}

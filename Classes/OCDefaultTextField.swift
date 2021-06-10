//
//  MyDefaultTextField.swift

//
//  Created by Ios Team on 26/05/21.
//  Copyright © 2021 AJAY MISHRA. All rights reserved.
//

import Foundation
import UIKit

private var KeyMaxLength: Int = 0
private var KeyMinLength: Int = 0
//MARK:- Default Field
@IBDesignable
class OCDefaultTextField : UITextField, UITextFieldDelegate
{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    func setup(){
        self.delegate = self
        self.autocorrectionType = .no
        self.spellCheckingType = .no
        self.smartQuotesType = .no
        self.smartDashesType = .no
        self.keyboardType = .default
        self.returnKeyType = .done
    }
    // For set bottom border
    func setBottomBorder(color:UIColor) {
        self.borderStyle = .none
        self.layer.backgroundColor = UIColor.white.cgColor
        self.layer.masksToBounds = false
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }
    //MARK:- Delegate method
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
            if self.text!.count > 0
            {
                self.borderColor = .darkGray
            }else{
                self.borderColor = .red
            }
        
       
        return true
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
       // print(#function)
        let whitespaceSet = NSCharacterSet.whitespaces
        let range1 = string.rangeOfCharacter(from: whitespaceSet)
        if let _ = range1 {
            if range.location == 0 && string == " "{
                return false
            }
            return true
            
        }
        if !string.canBeConverted(to: .ascii)
        {
            return false
        }
        return true
    }
}
//MARK:- Email Field
@IBDesignable
class OCEmailTextField : UITextField, UITextFieldDelegate
{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
       // super.delegate = self
        awakeFromNib()
        self.setup()
    }
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
     //   super.delegate = self
        awakeFromNib()
        self.setup()
    }
    override func awakeFromNib() {
        delegate = self
    }
    func setup(){
        
        self.autocorrectionType = .no
        self.spellCheckingType = .no
        self.smartQuotesType = .no
        self.smartDashesType = .no
        self.keyboardType = .emailAddress
        self.returnKeyType = .done
    }
    //MARK:- Delegate method
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        print(#function)
        let whitespaceSet = NSCharacterSet.whitespaces
        let range1 = string.rangeOfCharacter(from: whitespaceSet)
        if let _ = range1 {
            return false
        }
        if !string.canBeConverted(to: .ascii)
        {
            return false
        }
        return true
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        print(#function)
        if self.text!.count > 0
            {
                if self.hasValidEmail
                {
                    self.borderColor = .darkGray
                }else{
                    self.borderColor = .red
                }
                
            }else{
                self.borderColor = .red
            }
        textField.resignFirstResponder()
        return true
    }
    
}
//MARK:- Mobile number
@IBDesignable
class OCMobileTextField : UITextField, UITextFieldDelegate
{
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    func setup(){
        self.delegate = self
        self.autocorrectionType = .no
        self.spellCheckingType = .no
        self.smartQuotesType = .no
        self.smartDashesType = .no
        self.keyboardType = .numberPad
        self.returnKeyType = .done
    }
    // For set bottom border
    func setBottomBorder(color:UIColor) {
        self.borderStyle = .none
        self.layer.backgroundColor = UIColor.white.cgColor
        self.layer.masksToBounds = false
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }
    //MARK:- Delegate method
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
            if self.text!.count > 3
            {
                self.borderColor = .darkGray
            }else{
                self.borderColor = .red
            }
        
       
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if self.text!.count > 3
        {
            self.borderColor = .darkGray
        }else{
            self.borderColor = .red
        }
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        print(#function)
        let whitespaceSet = NSCharacterSet.whitespaces
        let range1 = string.rangeOfCharacter(from: whitespaceSet)
        if let _ = range1 {
            return false
        }
        if !string.canBeConverted(to: .ascii)
        {
            return false
        }
        
        if self.text!.count > 0
        {
            let newLength: Int = textField.text!.count + string.count - range.length
                let numberOnly = NSCharacterSet.init(charactersIn: "0123456789").inverted
                let strValid = string.rangeOfCharacter(from: numberOnly) == nil
          
//            return (strValid && newLength > 3)
                return strValid 
        }
        
       
        return true
    }
}
//MARK:- Password
@IBDesignable
class OCPasswordTextField : UITextField, UITextFieldDelegate
{
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    func setup(){
        self.delegate = self
        self.autocorrectionType = .no
        self.spellCheckingType = .no
        self.smartQuotesType = .no
        self.smartDashesType = .no
        self.keyboardType = .default
        self.isSecureTextEntry = true
        self.returnKeyType = .done
    }
    // For set bottom border
    func setBottomBorder(color:UIColor) {
        self.borderStyle = .none
        self.layer.backgroundColor = UIColor.white.cgColor
        self.layer.masksToBounds = false
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }
    //MARK:- Delegate method
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
            if self.text!.count > 7
            {
                self.borderColor = .darkGray
            }else{
                self.borderColor = .red
            }
        
       
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if self.text!.count > 7
        {
            self.borderColor = .darkGray
        }else{
            self.borderColor = .red
        }
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        print(#function)
        let whitespaceSet = NSCharacterSet.whitespaces
        let range1 = string.rangeOfCharacter(from: whitespaceSet)
        if let _ = range1 {
            return false
        }
        if !string.canBeConverted(to: .ascii)
        {
            return false
        }
        

        
       
        return true
    }
}
//MARK:- TextField Extention
extension UITextField{
    
    //MARK:- For change place holder color
    @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeHolderColor
        }
        set {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: newValue!])
        }
    }
    
    //MARK:- For padding left and Right
    
    func setLeftPaddingPoints(_ amount:CGFloat){
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
            self.leftView = paddingView
            self.leftViewMode = .always
        }
        func setRightPaddingPoints(_ amount:CGFloat) {
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
            self.rightView = paddingView
            self.rightViewMode = .always
        }
    //
    
    //MARK:- Done assory view
    @IBInspectable var doneAccessory: Bool{
            get{
                return self.doneAccessory
            }
            set(hasDone){
                if hasDone{
                    addDoneButtonOnKeyboard()
                }
            }
        }
        
        func addDoneButtonOnKeyboard()
        {
            let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
            doneToolbar.barStyle = .default
            
            let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
            
            let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonAction))
            
            let items = [flexSpace, done]
            doneToolbar.items = items
            doneToolbar.sizeToFit()
            
            self.inputAccessoryView = doneToolbar
        }
        
        @objc func doneButtonAction(){
            self.resignFirstResponder()
        }
    
    //MARK:- MAX Length
    @IBInspectable var maxLength: Int {
            get {
                if let length = objc_getAssociatedObject(self, &KeyMaxLength) as? Int {
                    return length
                } else {
                    return Int.max
                }
            }
            set {
                objc_setAssociatedObject(self, &KeyMaxLength, newValue, .OBJC_ASSOCIATION_RETAIN)
                addTarget(self, action: #selector(checkMaxLength), for: .editingChanged)
            }
        }
        
        @objc func checkMaxLength(textField: UITextField) {
            guard let prospectiveText = self.text,
                prospectiveText.count >= maxLength
                else {
                    return
            }
            
            let selection = selectedTextRange
            let maxCharIndex = prospectiveText.index(prospectiveText.startIndex, offsetBy: maxLength)
            text = prospectiveText.substring(to: maxCharIndex)
            selectedTextRange = selection
        }
   
    //MARK:- Corner radius, border
    @IBInspectable
        var cornerRadius: CGFloat {
            get {
                return layer.cornerRadius
            }
            set {
                layer.cornerRadius = newValue
                layer.masksToBounds = newValue > 0
            }
        }
        
        @IBInspectable
        var borderWidth: CGFloat {
            get {
                return layer.borderWidth
            }
            set {
                layer.borderWidth = newValue
            }
        }
        
        @IBInspectable
        var borderColor: UIColor? {
            get {
                let color = UIColor.init(cgColor: layer.borderColor!)
                return color
            }
            set {
                layer.borderColor = newValue?.cgColor
            }
        }
        
        @IBInspectable
        var shadowRadius: CGFloat {
            get {
                return layer.shadowRadius
            }
            set {
                layer.shadowColor = UIColor.black.cgColor
                layer.shadowOffset = CGSize(width: 0, height: 2)
                layer.shadowOpacity = 0.4
                layer.shadowRadius = shadowRadius
            }
        }
    
    //MARK:- Check Email
    public var hasValidEmail: Bool {
            return text!.range(of: "(?:[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}" +
                "~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\" +
                "x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-" +
                "z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5" +
                "]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-" +
                "9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21" +
                "-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])",
                               options: String.CompareOptions.regularExpression,
                               range: nil, locale: nil) != nil
        }
    
    
}


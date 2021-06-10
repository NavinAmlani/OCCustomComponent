//
//  PlaceholderTextView.swift

//
//  Created by Ios Team on 03/06/21.
//

import Foundation
import UIKit

@IBDesignable class PlaceholderTextView: UITextView,UITextViewDelegate
{
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    func setup(){
        self.delegate = self
        self.autocorrectionType = .no
        self.spellCheckingType = .no
        if #available(iOS 11.0, *) {
            self.smartQuotesType = .no
            self.smartDashesType = .no
        } else {
            // Fallback on earlier versions
        }
       
        self.keyboardType = .default
        self.setPlaceholder(placeholder: "Enter description...")
        self.returnKeyType = .done
    }
    
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        return true
    }
    func textViewDidChange(_ textView: UITextView) {
        self.checkPlaceholder()
    }
}

extension UITextView{
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
    //MARK:- Set Placeholder
    func setPlaceholder(placeholder : String) {

        let placeholderLabel = UILabel()
        placeholderLabel.text = placeholder
        placeholderLabel.font = UIFont.systemFont(ofSize: (self.font?.pointSize)!)
        placeholderLabel.sizeToFit()
        placeholderLabel.tag = 222
        placeholderLabel.frame.origin = CGPoint(x: 5, y: (self.font?.pointSize)! / 2)
        placeholderLabel.textColor = UIColor.lightGray
        placeholderLabel.isHidden = !self.text.isEmpty

        self.addSubview(placeholderLabel)
    }

    func checkPlaceholder() {
        let placeholderLabel = self.viewWithTag(222) as! UILabel
        placeholderLabel.isHidden = !self.text.isEmpty
    }
    //MARK:- Add Done button on keyboard
    
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
}

//
//  OCSegmentControl.swift

//
//  Created by Ios Team on 04/06/21.
//

import Foundation
import UIKit

@IBDesignable public class OCSegmentControl : UISegmentedControl
{
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
    
   
   
    //MARK:- 
    public override func awakeFromNib() {
            super.awakeFromNib()
       
            setupUI()
        }

    public override func prepareForInterfaceBuilder() {
            super.prepareForInterfaceBuilder()
          
            setupUI()
        }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        setupUI()
    }
    
    func setupUI(){
//        print("==>",#function)
        self.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
        self.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.blue], for: .normal)
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = true
//        self.clipsToBounds = true
       
    }
  
}


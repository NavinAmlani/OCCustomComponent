//
//  CustomSlider.swift
//  demoTextField
//
//  Created by Ios Team on 04/06/21.
//

import Foundation
import UIKit

@IBDesignable


class CustomSlider: UISlider {

    @IBInspectable var thumbImage: UIImage? {
        didSet {
            setupView()
        }
    }
    
    @IBInspectable var thumbHighlightedImage: UIImage? {
        didSet {
            setupView()
        }
    }
    
    func setupView() {
        setThumbImage(thumbImage, for: .normal)
        
        if let highlighted = thumbHighlightedImage {
            setThumbImage(highlighted, for: .highlighted)
        } else {
            setThumbImage(thumbImage, for: .highlighted)
        }
    }
    //Change slider stick hight
    //TODO give height of slider
    @IBInspectable var trackHeight: CGFloat = 2

      override func trackRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(origin: bounds.origin, size: CGSize(width: bounds.width, height: trackHeight))
      }
}

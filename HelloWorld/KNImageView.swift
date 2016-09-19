//
//  KNImageView.swift
//  HelloWorld
//
//  Created by 長堂嘉寿将 on 2016/09/19.
//  Copyright © 2016年 kNagadou. All rights reserved.
//

import Foundation
import UIKit

class KNImageView: UIView {
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    class func newImageView(parentView: UIView) -> KNImageView? {
        var view: KNImageView? = nil
        if let xibContents: Array = Bundle.main.loadNibNamed("KNImageView", owner: parentView, options: nil) {
            view = xibContents.last as! KNImageView?
            let parentFrame: CGRect = parentView.frame
            view?.frame = CGRect(x: 0, y: 0, width: parentFrame.width, height: parentFrame.height)
            view?.initialize()
        }
        return view
    }
    
    func initialize() {
        self.closeButton.setTitle("Close", for: UIControlState.normal)
    }
    
    @IBAction func onCloseButton(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3, animations: {
            self.frame.origin.y = self.frame.height
            }, completion: {
                if $0 { self.removeFromSuperview() }
        })
    }
}

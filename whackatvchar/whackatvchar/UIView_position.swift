//
//  UIView_position.swift
//  whackatvchar
//
//  Created by Shane White on 6/19/17.
//  Copyright © 2017 DMA. All rights reserved.
//

import UIKit

extension UIView {
    open func setPosition(x: CGFloat, y: CGFloat) {
        self.frame.origin.x = x;
        self.frame.origin.y = y;
    }
}

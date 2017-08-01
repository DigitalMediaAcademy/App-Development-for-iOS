//
//  random.swift
//  whackatvchar
//
//  Created by Shane White on 6/19/17.
//  Copyright © 2017 DMA. All rights reserved.
//

import UIKit

public func random(lower: CGFloat, upper: CGFloat) -> CGFloat {
    return lower + CGFloat(arc4random_uniform(UInt32(upper - lower)));
}

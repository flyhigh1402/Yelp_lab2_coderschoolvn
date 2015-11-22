//
//  DealCell.swift
//  Yelp
//
//  Created by huy ngo on 11/20/15.
//  Copyright © 2015 Timothy Lee. All rights reserved.
//

import UIKit

@objc protocol SwitchDealDelegate {
    optional func switchDealCell(switchCell: DealCell, didChangeValue value: Bool)
}

class DealCell: UITableViewCell {

    @IBOutlet var onSwitchDeal: UISwitch!
    @IBOutlet var dealLabel: UILabel!
    
    weak var delegate: SwitchDealDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        onSwitchDeal.on = false
        onSwitchDeal.addTarget(self, action: "switchValueChanged", forControlEvents: UIControlEvents.ValueChanged)
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func switchValueChanged() {
        delegate?.switchDealCell?(self, didChangeValue: onSwitchDeal.on)
    }
}

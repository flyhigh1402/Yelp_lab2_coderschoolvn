//
//  FilterCell.swift
//  Yelp
//
//  Created by huy ngo on 11/20/15.
//  Copyright © 2015 Timothy Lee. All rights reserved.
//

import UIKit

@objc protocol SwitchCellDelegate {
   optional func switchCell(switchCell: FilterCell, didChangeValue value: Bool)
}

class FilterCell: UITableViewCell {

    @IBOutlet var categoriesLabel: UILabel!
    @IBOutlet var onSwitch: UISwitch!
    
    weak var delegate: SwitchCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        onSwitch.addTarget(self, action: "switchValueChanged", forControlEvents: UIControlEvents.ValueChanged)
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func switchValueChanged() {
        delegate?.switchCell?(self, didChangeValue: onSwitch.on)
        
    }

}

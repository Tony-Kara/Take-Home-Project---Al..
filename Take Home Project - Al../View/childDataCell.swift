//
//  childDataCell.swift
//  Take Home Project - Al..
//
//  Created by mac on 8/4/21.
//

import UIKit

class childDataCell: UITableViewCell {

    
    @IBOutlet weak var childName: UILabel!
    @IBOutlet weak var childAge: UILabel!
    
    @IBOutlet weak var deleteBtn: UIButton!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

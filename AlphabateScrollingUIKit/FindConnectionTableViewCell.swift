//
//  FindConnectionTableViewCell.swift
//  AlphabateScrollingUIKit
//
//  Created by Noman belim on 24/02/26.
//

import UIKit

class FindConnectionTableViewCell: UITableViewCell {

    @IBOutlet weak var ReportUIVIew: UIView!
    @IBOutlet weak var MainUIVIew: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var SendUIVIew: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        MainUIVIew.layer.cornerRadius = 15
        ReportUIVIew.layer.cornerRadius = 15
        SendUIVIew.layer.cornerRadius = 15
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

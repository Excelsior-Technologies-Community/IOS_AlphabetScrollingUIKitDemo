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
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var reportButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        nameLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        addressLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        addressLabel.textColor = .secondaryLabel
        MainUIVIew.layer.cornerRadius = 15
        sendButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        sendButton.setTitleColor(.systemBlue, for: .normal)
        reportButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        reportButton.setTitleColor(.label, for: .normal)
        ReportUIVIew.layer.cornerRadius = 10
        SendUIVIew.layer.cornerRadius = 10
        sendButton.titleLabel?.numberOfLines = 1
           reportButton.titleLabel?.numberOfLines = 1

           sendButton.titleLabel?.lineBreakMode = .byTruncatingTail
           reportButton.titleLabel?.lineBreakMode = .byTruncatingTail
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

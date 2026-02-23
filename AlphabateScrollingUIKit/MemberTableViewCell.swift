//
//  MemberTableViewCell.swift
//  AlphabateScrollingUIKit
//
//  Created by Noman belim on 23/02/26.
//

import UIKit

class MemberTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var CallUIVIew: UIView!
    @IBOutlet weak var Adddlabel: UILabel!
    @IBOutlet weak var smsUIVIew: UIView!
    @IBOutlet weak var WhatsAppui: UIView!
    @IBOutlet weak var EndUI: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        CallUIVIew.layer.cornerRadius = 10
        smsUIVIew.layer.cornerRadius = 10
        WhatsAppui.layer.cornerRadius = 10
        EndUI.layer.cornerRadius = 10
        profileImageView.layer.cornerRadius = 20
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

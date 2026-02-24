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
    @IBOutlet weak var BGView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        CallUIVIew.layer.cornerRadius = 15
        smsUIVIew.layer.cornerRadius = 15
        WhatsAppui.layer.cornerRadius = 15
        EndUI.layer.cornerRadius = 15
        profileImageView.layer.cornerRadius = 20
        BGView.layer.cornerRadius = 15
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

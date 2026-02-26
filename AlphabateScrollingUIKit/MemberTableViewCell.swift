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
            
            setupUI()
//            setupActionButtons()
        }
        
        func setupUI() {
            // Background card
            BGView.layer.cornerRadius = 15
            BGView.layer.masksToBounds = true
            CallUIVIew.layer.cornerRadius = 15
            smsUIVIew.layer.cornerRadius = 15
            WhatsAppui.layer.cornerRadius = 10
            EndUI.layer.cornerRadius = 10
            // Profile image circle
            profileImageView.layer.cornerRadius = 20
            profileImageView.layer.masksToBounds = true
            profileImageView.contentMode = .scaleAspectFill
            
            // Name label
            nameLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
            Adddlabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
            nameLabel.textColor = .black
            
            // Address label
            Adddlabel.textColor = .gray
        }
         
        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)
        }
    }

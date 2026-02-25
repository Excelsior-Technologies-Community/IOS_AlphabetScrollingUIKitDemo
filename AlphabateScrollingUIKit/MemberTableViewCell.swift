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
            setupActionButtons()
        }
        
        func setupUI() {
            // Background card
            BGView.layer.cornerRadius = 15
            BGView.layer.masksToBounds = true
            
            // Profile image circle
            profileImageView.layer.cornerRadius = 20
            profileImageView.layer.masksToBounds = true
            profileImageView.contentMode = .scaleAspectFill
            
            // Name label
            nameLabel.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
            nameLabel.textColor = .black
            
            // Address label
            Adddlabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
            Adddlabel.textColor = .gray
        }
       
    func styleActionView(_ container: UIView, title: String, imageName: String, isSystem: Bool) {
        
        container.subviews.forEach { $0.removeFromSuperview() }
        
        container.backgroundColor = UIColor(red: 0.922, green: 0.922, blue: 0.961, alpha: 1.0)
        container.layer.cornerRadius = 10  
        container.layer.masksToBounds = true
         
        
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(stack)
        
        let imageView = UIImageView()
        if isSystem {
            let config = UIImage.SymbolConfiguration(pointSize: 12, weight: .regular)
            imageView.image = UIImage(systemName: imageName, withConfiguration: config)
            imageView.tintColor = .darkGray
        } else {
            imageView.image = UIImage(named: imageName)
            imageView.tintColor = .none
        }
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 14),
            imageView.heightAnchor.constraint(equalToConstant: 14)
        ])
        
        let label = UILabel()
        label.text = title
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        label.textColor = .darkGray
        
        stack.addArrangedSubview(imageView)
        stack.addArrangedSubview(label)
        
        NSLayoutConstraint.activate([
            stack.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: container.centerYAnchor)
        ])
    }
     
    func setupActionButtons() {
        styleActionView(CallUIVIew,  title: "Call",      imageName: "phone",           isSystem: true)
        styleActionView(smsUIVIew,   title: "SMS",       imageName: "message",         isSystem: true)
        styleActionView(WhatsAppui,  title: "WhatsApp",  imageName: "whatsApp",              isSystem: false)
        styleActionView(EndUI,       title: "Chat",      imageName: "bubble.left.and.bubble.right", isSystem: true)
    }

        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)
        }
    }

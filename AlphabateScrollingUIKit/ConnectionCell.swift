//
//  ConnectionCell.swift
//  AlphabateScrollingUIKit
//
//  Created by Noman belim on 26/02/26.
//

import Foundation
import UIKit

class ConnectionCell: UICollectionViewCell {

    @IBOutlet weak var button: UIButton!
   

        override func awakeFromNib() {
            super.awakeFromNib()
            button.layer.cornerRadius = 20
            button.layer.masksToBounds = true
            button.isUserInteractionEnabled = false
            button.backgroundColor = .white
            button.setTitleColor(.black, for: .normal)
        }

        /// Call this from cellForItemAt — sets title on ALL states so UIKit never flickers back to storyboard default
        func configure(title: String, isSelected: Bool) {
            // Set title for every possible UIControl.State so there's no fallback to storyboard value
            for state: UIControl.State in [.normal, .highlighted, .selected, .focused, [.selected, .highlighted]] {
                button.setTitle(title, for: state)
            }
            updateUI(isSelected: isSelected)
        }

        func updateUI(isSelected: Bool) {
            if isSelected {
                button.backgroundColor = UIColor(red: 221/255, green: 225/255, blue: 243/255, alpha: 1)
                button.setTitleColor(UIColor(red: 12/255, green: 53/255, blue: 233/255, alpha: 1), for: .normal)
            } else {
                button.backgroundColor = .white
                button.setTitleColor(.black, for: .normal)
            }
        }
    }

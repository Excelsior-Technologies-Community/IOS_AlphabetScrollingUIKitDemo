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
           setupUI()
        button.layer.cornerRadius = 20
          button.isUserInteractionEnabled = false
       }

       private func setupUI() {
           button.layer.cornerRadius = 20
           button.layer.masksToBounds = true
           updateUI(isSelected: false)
       }

       func updateUI(isSelected: Bool) {

           if isSelected {
               button.backgroundColor = UIColor(
                   red: 221/255,
                   green: 225/255,
                   blue: 243/255,
                   alpha: 1
               ) // #DDE1F3

               button.setTitleColor(
                   UIColor(
                       red: 12/255,
                       green: 53/255,
                       blue: 233/255,
                       alpha: 1
                   ), for: .normal) // #0C35E9
           } else {
               button.backgroundColor = .white
               button.setTitleColor(.black, for: .normal)
           }
       }
   }

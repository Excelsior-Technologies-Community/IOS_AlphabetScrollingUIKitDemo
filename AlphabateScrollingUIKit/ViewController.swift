//
//  ViewController.swift
//  AlphabateScrollingUIKit
//
//  Created by Noman belim on 23/02/26.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func searchTapped(_ sender: UIBarButtonItem) {
    }
    @IBOutlet weak var alphabetStackView: UIStackView!
    @IBOutlet weak var tableView: UITableView!
    var members: [Member] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(
              UINib(nibName: "MemberTableViewCell", bundle: nil),
              forCellReuseIdentifier: "MemberTableViewCell"
          )
        setupAlphabet()
          tableView.delegate = self
          tableView.dataSource = self
    }

    func setupAlphabet() {
        
        let alphabets = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        
        for (index, letter) in alphabets.enumerated() {
            
            let label = UILabel()
            label.text = String(letter)
            label.font = UIFont.systemFont(ofSize: 11)
            label.textColor = .gray
            label.textAlignment = .center
            label.tag = index
            label.isUserInteractionEnabled = true
            
            let tap = UITapGestureRecognizer(target: self,
                                             action: #selector(alphabetTapped(_:)))
            label.addGestureRecognizer(tap)
            
            alphabetStackView.addArrangedSubview(label)
        }
    }
    @objc func alphabetTapped(_ sender: UITapGestureRecognizer) {
        
        guard let label = sender.view as? UILabel else { return }
        
        let letter = label.text ?? ""
        print("Tapped:", letter)
        
        // Here you scroll your table
    }
}
extension ViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(
            withIdentifier: "MemberTableViewCell",
            for: indexPath
        ) as! MemberTableViewCell

        cell.nameLabel.text = "Garima Vyas Purohit"

        cell.Adddlabel.text = "Ahmedabad"
        return cell
    }
}
struct Member {
    let name: String
    let address: String
}

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
    @IBOutlet weak var MyCOnUIVIew: UIView!
    
    @IBOutlet weak var MyConnectionBTN: UIButton!
    @IBOutlet weak var SearchUIView: UIView!
    @IBOutlet weak var alphabetStackView: UIStackView!
   
    struct Member {
        let name: String
        let address: String
    }

    var members: [Member] = [
        Member(name: "Garima Vyas Purohit", address: "Ahmedabad"),
        Member(name: "Dhruvil Shah", address: "Surat"),
        Member(name: "Mistry Nitin", address: "Baroda"),
        Member(name: "Geetika Patel", address: "Rajkot"),
        Member(name: "Arpan Hemantkumar", address: "Mumbai")
    ]
    var currentMode: ConnectionMode = .myConnection
    @IBOutlet weak var ConnectionUIView: UIView!
  
    @IBOutlet weak var FindConnectionview: UIView!
    
    @IBOutlet weak var SearchUIConstrains: NSLayoutConstraint!
    @IBOutlet weak var tableView: UITableView!
    enum ConnectionMode {
        case myConnection
        case findConnection
    }

    
    var isSearchVisible = false
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(
              UINib(nibName: "MemberTableViewCell", bundle: nil),
              forCellReuseIdentifier: "MemberTableViewCell"
          )
        tableView.register(
            UINib(nibName: "FindConnectionTableViewCell", bundle: nil),
            forCellReuseIdentifier: "FindConnectionTableViewCell"
        )
        SearchUIView.isHidden = true
        SearchUIConstrains.constant = 0
        setupAlphabet()
        SearchUIView.layer.cornerRadius = 10
          tableView.delegate = self
          tableView.dataSource = self
        MyCOnUIVIew.layer.cornerRadius = 20
        FindConnectionview.layer.cornerRadius = 20
        ConnectionUIView.layer.cornerRadius = 20
    }
    
    @IBAction func MyConnection(_ sender: Any) {
        currentMode = .myConnection
          tableView.reloadData()
    }
    @IBAction func FindConnection(_ sender: Any) {
        currentMode = .findConnection
        tableView.reloadData()
    }
    @IBAction func ConnectionRequest(_ sender: Any) {
    }
    
    @IBAction func SearchButton(_ sender: Any) {
        isSearchVisible.toggle()
            
            if isSearchVisible {
                SearchUIView.isHidden = false
                SearchUIConstrains.constant = 50
            } else {
                SearchUIConstrains.constant = 0
                
                // hide after animation
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    self.SearchUIView.isHidden = true
                }
            }
            
            UIView.animate(withDuration: 0.3) {
                self.view.layoutIfNeeded()
            }
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

    func numberOfSections(in tableView: UITableView) -> Int {
        return members.count
    }

    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView,
                   heightForFooterInSection section: Int) -> CGFloat {
        return 12
    }
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let member = members[indexPath.section]

        switch currentMode {

        case .myConnection:

            let cell = tableView.dequeueReusableCell(
                withIdentifier: "MemberTableViewCell",
                for: indexPath
            ) as! MemberTableViewCell

            cell.nameLabel.text = member.name
            cell.Adddlabel.text = member.address
            return cell

        case .findConnection:

            let cell = tableView.dequeueReusableCell(
                withIdentifier: "FindConnectionTableViewCell",
                for: indexPath
            ) as! FindConnectionTableViewCell

            cell.nameLabel.text = member.name
            cell.addressLabel.text = member.address
            return cell
        }
    }
}
struct Member {
    let name: String
    let address: String
}

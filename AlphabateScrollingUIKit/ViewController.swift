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
    @IBOutlet weak var ConnectionReq: UIView!
    
    @IBOutlet weak var AlphUiView: UIView!
    @IBOutlet weak var SearchUI: UIView!
    @IBOutlet weak var myConnectionButton: UIButton!
    @IBOutlet weak var findConnectionButton: UIButton!
    @IBOutlet weak var SearchUIView: UIView!
    @IBOutlet weak var alphabetStackView: UIStackView!
   
    
    @IBOutlet weak var ConenctionReq: UIButton!
    struct Member {
        let name: String
        let address: String
    }
    
    var filteredMembers: [Member] = []
    var allMembers: [Member] = []
    var members: [Member] = [
        Member(name: "Garima Vyas Purohit", address: "Ahmedabad"),
        Member(name: "Dhruvil Shah", address: "Surat"),
        Member(name: "Mistry Nitin", address: "Baroda"),
        Member(name: "Geetika Patel", address: "Rajkot"),
        Member(name: "Arpan Hemantkumar", address: "Mumbai")
    ]
    var currentMode: ConnectionMode = .myConnection
//    @IBOutlet weak var ConnectionUIView: UIView!
  
    @IBOutlet weak var FindConnectionview: UIView!
    
    @IBOutlet weak var SearchUIConstrains: NSLayoutConstraint!
    @IBOutlet weak var tableView: UITableView!
    enum ConnectionMode {
        case myConnection
        case findConnection
        case connectionRequest
    }

    
    var isSearchVisible = false
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateTabUI()
        allMembers.sort { $0.name < $1.name }
        tableView.register(
              UINib(nibName: "MemberTableViewCell", bundle: nil),
              forCellReuseIdentifier: "MemberTableViewCell"
          )
        tableView.register(
            UINib(nibName: "FindConnectionTableViewCell", bundle: nil),
            forCellReuseIdentifier: "FindConnectionTableViewCell"
        )
        Design()
        
        allMembers = [
            Member(name: "Garima Vyas", address: "Ahmedabad"),
            Member(name: "Geetika Patel", address: "Surat"),
            Member(name: "Nitin Mistry", address: "Baroda"),
            Member(name: "Neha Shah", address: "Rajkot"),
            Member(name: "Arpan Kumar", address: "Mumbai"),
            Member(name: "Dhruvil Shah", address: "Delhi")
        ]

        filteredMembers = allMembers
    }
    
    @IBAction func MyConnection(_ sender: Any) {
        currentMode = .myConnection
        updateTabUI()
          tableView.reloadData()
    }
    @IBAction func FindConnection(_ sender: Any) {
        currentMode = .findConnection
        updateTabUI()
        tableView.reloadData()
    }
    @IBAction func ConnectionRequest(_ sender: Any) {
        currentMode = .connectionRequest
        updateTabUI()
        tableView.reloadData()
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
    
    func Design() {
        let borderBlue = UIColor(red: 0.047, green: 0.208, blue: 0.914, alpha: 1.0)
        
        AlphUiView.layer.cornerRadius = 10
        SearchUI.layer.cornerRadius = 10
        MyCOnUIVIew.layer.cornerRadius = 20
        FindConnectionview.layer.cornerRadius = 20
        ConnectionReq.layer.cornerRadius = 20
        MyCOnUIVIew.layer.cornerRadius = 20

        MyCOnUIVIew.layer.borderWidth = 1
        FindConnectionview.layer.borderWidth = 1
        MyCOnUIVIew.layer.borderWidth = 1
        
        ConnectionReq.layer.borderColor = borderBlue.cgColor
        ConnectionReq.layer.borderWidth = 1
        
        MyCOnUIVIew.layer.borderColor = borderBlue.cgColor
        FindConnectionview.layer.borderColor = borderBlue.cgColor
        MyCOnUIVIew.layer.borderColor = borderBlue.cgColor   

        SearchUIView.isHidden = true
        SearchUIConstrains.constant = 0
        setupAlphabet()
        SearchUIView.layer.cornerRadius = 10
        tableView.delegate = self
        tableView.dataSource = self
    }
    func updateTabUI() {
        
        let selectedBG   = UIColor(red: 0.882, green: 0.882, blue: 0.953, alpha: 1.0) // #DDE1F3
        let selectedFont = UIColor(red: 0.047, green: 0.208, blue: 0.914, alpha: 1.0) // #0C35E9
        let normalBG     = UIColor.clear
        let normalFont   = UIColor.gray

        // Reset all 3 buttons to normal state first
        MyCOnUIVIew.backgroundColor        = normalBG
        FindConnectionview.backgroundColor = normalBG
        MyCOnUIVIew.backgroundColor   = normalBG  // your 3rd button's view

        myConnectionButton.setTitleColor(normalFont, for: .normal)
        findConnectionButton.setTitleColor(normalFont, for: .normal)
        ConenctionReq.setTitleColor(normalFont, for: .normal)

        // Apply selected state to active button only
        switch currentMode {
            
        case .myConnection:
            MyCOnUIVIew.backgroundColor = selectedBG
            myConnectionButton.setTitleColor(selectedFont, for: .normal)

        case .findConnection:
            FindConnectionview.backgroundColor = selectedBG
            findConnectionButton.setTitleColor(selectedFont, for: .normal)

        case .connectionRequest:
            ConnectionReq.backgroundColor = selectedBG
            ConenctionReq.setTitleColor(selectedFont, for: .normal)
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
        
        guard let label = sender.view as? UILabel,
              let letter = label.text else { return }
        
        // Find first index where name starts with tapped letter
        if let index = allMembers.firstIndex(where: {
            $0.name.uppercased().hasPrefix(letter)
        }) {
            
            let indexPath = IndexPath(row: index, section: 0)
            
            if index < tableView.numberOfRows(inSection: 0) {
                tableView.scrollToRow(at: indexPath,
                                      at: .top,
                                      animated: true)
            }
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return filteredMembers.count
    }

    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return allMembers.count
    }
    func tableView(_ tableView: UITableView,
                   heightForFooterInSection section: Int) -> CGFloat {
        return 12
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let member = allMembers[indexPath.row]

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

        case .connectionRequest:          // ← ADD THIS CASE
            let cell = tableView.dequeueReusableCell(
                withIdentifier: "MemberTableViewCell",
                for: indexPath
            ) as! MemberTableViewCell

            cell.nameLabel.text = member.name
            cell.Adddlabel.text = member.address
            return cell
        }
    }
}
struct Member {
    let name: String
    let address: String
}

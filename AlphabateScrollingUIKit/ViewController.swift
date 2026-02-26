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
//    @IBOutlet weak var MyCOnUIVIew: UIView!
//    @IBOutlet weak var ConnectionReq: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var AlphUiView: UIView!
    @IBOutlet weak var SearchUI: UIView!
//    @IBOutlet weak var myConnectionButton: UIButton!
//    @IBOutlet weak var findConnectionButton: UIButton!
    @IBOutlet weak var SearchUIView: UIView!
    @IBOutlet weak var alphabetStackView: UIStackView!
   
    
    @IBOutlet weak var CollectionviewBTN: UIButton!
     
    //    @IBOutlet weak var ConenctionReq: UIButton!
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
    let connections = [
        "My Connection",
        "Find Connection",
        "Connection Request"
    ]
    var selectedIndex = 0
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
        collectionView.delegate = self
        collectionView.dataSource = self
  
        DispatchQueue.main.async {
            self.collectionView.selectItem(
                at: IndexPath(item: 0, section: 0),
                animated: false,
                scrollPosition: []
            )
        }
        tableView.register(UINib(nibName: "MemberTableViewCell", bundle: nil),
                           forCellReuseIdentifier: "MemberTableViewCell")

        tableView.register(UINib(nibName: "FindConnectionTableViewCell", bundle: nil),
                           forCellReuseIdentifier: "FindConnectionCell")
        allMembers.sort { $0.name < $1.name }
        tableView.register(
              UINib(nibName: "MemberTableViewCell", bundle: nil),
              forCellReuseIdentifier: "MemberTableViewCell"
          )
//        configureNavigationBar()
        tableView.register(
            UINib(nibName: "FindConnectionTableViewCell", bundle: nil),
            forCellReuseIdentifier: "FindConnectionTableViewCell"
        )
        Design()
        navigationController?.isNavigationBarHidden = true
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
    
    private func configureNavigationBar() {

        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()

        appearance.backgroundColor = UIColor(
            red: 24/255,
            green: 52/255,
            blue: 223/255,
            alpha: 1
        )  

        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]

        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
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
//        MyCOnUIVIew.layer.cornerRadius = 20
//        FindConnectionview.layer.cornerRadius = 20
//        ConnectionReq.layer.cornerRadius = 20
//        MyCOnUIVIew.layer.cornerRadius = 20
//
//        MyCOnUIVIew.layer.borderWidth = 1
//        FindConnectionview.layer.borderWidth = 1
//        MyCOnUIVIew.layer.borderWidth = 1
//        
//        ConnectionReq.layer.borderColor = borderBlue.cgColor
//        ConnectionReq.layer.borderWidth = 1
//        
//        MyCOnUIVIew.layer.borderColor = borderBlue.cgColor
//        FindConnectionview.layer.borderColor = borderBlue.cgColor
//        MyCOnUIVIew.layer.borderColor = borderBlue.cgColor   

        SearchUIView.isHidden = true
        SearchUIConstrains.constant = 0
        setupAlphabet()
        SearchUIView.layer.cornerRadius = 10
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
           return 10
       }
    func tableView(_ tableView: UITableView,
                   heightForFooterInSection section: Int) -> CGFloat {
        return 12
    }

    func tableView(_ tableView: UITableView,
                       cellForRowAt indexPath: IndexPath)
                       -> UITableViewCell {
  
                           if selectedIndex == 0 {
                               return tableView.dequeueReusableCell(
                                   withIdentifier: "MemberTableViewCell",
                                   for: indexPath)
                           } else {
                               return tableView.dequeueReusableCell(
                                   withIdentifier: "FindConnectionTableViewCell",
                                   for: indexPath)
                           }
        }
}
struct Member {
    let name: String
    let address: String
}
extension ViewController :UICollectionViewDelegate,UICollectionViewDataSource , UICollectionViewDelegateFlowLayout
{

    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return connections.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath)
                        -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "ConnectionCell",
            for: indexPath) as! ConnectionCell

        cell.button.setTitle(connections[indexPath.row], for: .normal)

        cell.updateUI(isSelected: indexPath.row == selectedIndex)

        return cell
    }

    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {

        selectedIndex = indexPath.row
        collectionView.reloadData()
        tableView.reloadData()
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout:
                        UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: 160, height: 40)
    }
}

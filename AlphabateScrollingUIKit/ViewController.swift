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
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(
              UINib(nibName: "MemberTableViewCell", bundle: nil),
              forCellReuseIdentifier: "MemberTableViewCell"
          )

          tableView.delegate = self
          tableView.dataSource = self
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

        return cell
    }
}

//
//  functions.swift
//  newProject
//
//  Created by Imcrinox Mac on 08/12/1444 AH.
//

import Foundation
import UIKit

class functions : UIViewController {
    
    @IBOutlet weak var rowTable: UITableView!
    
    var text = ["black","blue","brown","cyan","drakGray","gray","green","lightGray","magenta","orange","purple","red","white","yellow"]
    var topic = ["Heading", "SubHeading","Heading", "SubHeading","Heading", "SubHeading","Heading", "SubHeading"]
    var tappedCell : CollectionViewCellModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rowTable.separatorStyle = .none
        
        let cellNib = UINib(nibName: "newTableViewCell", bundle: nil)
        self.rowTable.register(cellNib, forCellReuseIdentifier: "newTableViewCell")
    }
}

extension functions: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return text.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = rowTable.dequeueReusableCell(withIdentifier: "newTableViewCell", for: indexPath) as? newTableViewCell {
//            let subcategoryTitle = topic[indexPath.row]
            cell.headerLabel.text = topic[indexPath.row]
            cell.cellDelegate = self

            cell.selectionStyle = .none

            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        let titleLabel = UILabel(frame: CGRect(x: 8, y: 0, width: 200, height: 45))
        headerView.addSubview(titleLabel)
        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        titleLabel.text = topic[0]
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segViewController" {
            let detViewController = segue.destination as! ViewController
//            detViewController.backgroundColor = tappedCell.color
//            detViewController.backgroundColorName = tappedCell.name
        }
    }
}


extension functions: CollectionViewDelegate {
    func collectionView(collectionviewcell: newCollectionViewCell?, index: Int, didTappedInTableViewCell: newTableViewCell) {
        if didTappedInTableViewCell.text != nil {
//            self.tappedCell = colorsRow[index]
            performSegue(withIdentifier: "segViewController", sender: self)
        }
    }
}

//
//  newTableViewCell.swift
//  newProject
//
//  Created by Imcrinox Mac on 08/12/1444 AH.
//

import UIKit

protocol CollectionViewDelegate: class {
    func collectionView(collectionviewcell: newCollectionViewCell?, index: Int, didTappedInTableViewCell: newTableViewCell)

}
class newTableViewCell: UITableViewCell {
    
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var collection: UICollectionView!
    
    weak var cellDelegate: CollectionViewDelegate?

    var text = ["black","blue","brown","cyan","drakGray","gray","green","lightGray","magenta","orange","purple","red","white","yellow"]
    var picture = ["image0","image1","image2","image3","image4","image5","image6","image7","image8","image9","image10","image11","image12"]
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.headerLabel.textColor = UIColor.cyan
        
        let flowlayout = UICollectionViewFlowLayout()
        flowlayout.scrollDirection = .horizontal
        flowlayout.itemSize = CGSize(width: 200, height: 200)
        flowlayout.minimumLineSpacing = 2.0
        flowlayout.minimumInteritemSpacing = 5.0
        self.collection.collectionViewLayout = flowlayout
        self.collection.showsHorizontalScrollIndicator = false
        self.collection.dataSource = self
        self.collection.delegate = self
        
        let cellNib = UINib(nibName: "newCollectionViewCell", bundle: nil)
        self.collection.register(cellNib, forCellWithReuseIdentifier: "newCollectionViewCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension newTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.text.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "newCollectionViewCell", for: indexPath) as? newCollectionViewCell {
            cell.colorView.backgroundColor = UIColor(named:"\(text[indexPath.item])")
            cell.images.image = UIImage(named: "\(self.picture[indexPath.item])") ?? UIImage()
            cell.subLabel.text = text[indexPath.item]
            return cell
        }
        return UICollectionViewCell()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as? newCollectionViewCell
        self.cellDelegate?.collectionView(collectionviewcell: cell,index: indexPath.item,didTappedInTableViewCell: self)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    }
}

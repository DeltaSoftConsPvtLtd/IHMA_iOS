//
//  CarouselTableViewCell.swift
//  IHMA
//
//  Created by Nikil Davis on 07/06/21.
//

import UIKit

class CarouselTableViewCell: UITableViewCell {
    
    var Colimages = ["11","12","13"]

    @IBOutlet weak var carouselCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        carouselCollectionView.delegate = self
        carouselCollectionView.dataSource = self
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//MARK:- UIcollectionview delegate and datasources
extension CarouselTableViewCell:UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {

        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return Colimages.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "image", for: indexPath) as? imagesCollectionViewCell
        cell?.imagesOutlet.layer.cornerRadius = 20.0
        cell?.imagesOutlet.clipsToBounds = true
        cell?.imagesOutlet.image = UIImage(named: Colimages[indexPath.row])
        if UIScreen.main.bounds.height < 750
        {
            cell?.imageHeightConstraint.constant = 150
            cell?.imagesOutlet.layer.cornerRadius = 20.0
        } else {
            cell?.imageHeightConstraint.constant = 200
//            cell?.imageWidthConstraint.constant = 350
            cell?.imagesOutlet.layer.cornerRadius = 20.0
        }
        cell?.clipsToBounds = true
//        cell?.imagesOutlet.masksToBounds = true
        return cell!
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        var cellSize = CGSize(width:0 ,height:0)
        let itemPerRow = CGFloat(1)
        var availableWidth = carouselCollectionView.frame.width - 40
      
//        if UIScreen.main.bounds.height == 812 {
//            availableWidth = carouselCollectionView.frame.width - 80
//        } else {
//            availableWidth = carouselCollectionView.frame.width - 40
//        }
        
        let widthPerItem = availableWidth / itemPerRow
        let availableHeight = self.carouselCollectionView.frame.height 
        let heightPerItem = availableHeight

        cellSize = CGSize(width: widthPerItem, height: heightPerItem )
        return cellSize
    }
}

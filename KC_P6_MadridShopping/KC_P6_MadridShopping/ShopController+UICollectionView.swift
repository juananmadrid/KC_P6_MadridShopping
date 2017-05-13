import UIKit
import CoreData

extension ShopController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // return self.fetchedResultsController.sections?.count ?? 0
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // let sectionInfo = self.fetchedResultsController.sections![section]
        // return sectionInfo.numberOfObjects
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShopCell", for: indexPath)
        cell.backgroundColor = UIColor.darkGray
        
        return cell
    }
    
}

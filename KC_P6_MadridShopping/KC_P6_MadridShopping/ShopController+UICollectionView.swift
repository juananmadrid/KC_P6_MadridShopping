import UIKit
import CoreData

extension ShopController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
    return self.fetchedResultsController.sections?.count ?? 0

    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
         let sectionInfo = self.fetchedResultsController.sections![section]
         return sectionInfo.numberOfObjects
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShopCell", for: indexPath) as! ShopCell
        
        // Obtenemos datos a cargar en la celda del fetchedResultsController
        cell.shop = self.fetchedResultsController.object(at: indexPath)
        
        return cell
    }
    
}

import UIKit

private enum Constants {
    static let cellsInRow: CGFloat = 3
    static let cellAspectRatio: CGFloat = 16 / 12
    static let cellSpacing: CGFloat = 4
}

/**
    Custom collection layout that lays cells as a grid with specific aspect ration.
 */
class CitiesCollectionLayout: UICollectionViewFlowLayout {
    override func prepare() {
        super.prepare()

        guard let collectionView = collectionView else {
            return
        }

        minimumInteritemSpacing = Constants.cellSpacing
        minimumLineSpacing = Constants.cellSpacing

        let cellWidth = (collectionView.bounds.size.width - sectionInset.left - sectionInset.right) / Constants.cellsInRow - minimumLineSpacing
        let cellHeight = cellWidth * Constants.cellAspectRatio

        // Apply correct item size to collection view cell.
        itemSize = CGSize(width: cellWidth, height: cellHeight)
    }
}

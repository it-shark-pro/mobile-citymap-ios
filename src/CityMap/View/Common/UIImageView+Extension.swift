import UIKit

extension UIImageView {
    func clone() -> UIImageView {
        let copyImage = UIImageView(image: self.image)
        copyImage.contentMode = self.contentMode
        copyImage.clipsToBounds = true
        return copyImage
    }
}

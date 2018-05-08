import Foundation
import UIKit

final class CityDetailTransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    private enum Constants {
        static let transitionDuration: TimeInterval = 0.45
    }

    private let selectedIndexPath: IndexPath

    private let selectedCell: CityViewCell
    private let selectedCellOriginFrame: CGRect

    init?(collectionView: UICollectionView, selectedIndexPath: IndexPath) {
        guard let selectedCell = collectionView.cellForItem(at: selectedIndexPath) as? CityViewCell,
            let selectedCellOriginFrame = collectionView.layoutAttributesForItem(at: selectedIndexPath)?.frame else {
                return nil
        }

        self.selectedIndexPath = selectedIndexPath
        self.selectedCell = selectedCell
        self.selectedCellOriginFrame = selectedCellOriginFrame
    }

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return Constants.transitionDuration
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let toViewController = transitionContext.viewController(forKey: .to) as? CityDetailViewController else {
            let toView = transitionContext.view(forKey: .to)!
            transitionContext.containerView.addSubview(toView)
            transitionContext.completeTransition(true)
            return
        }

        let containerView = transitionContext.containerView

        // Add target view to the container view (layout it and calculate correct destination frame for image)
        let toView = transitionContext.view(forKey: .to)!
        containerView.addSubview(toView)
        toView.layoutIfNeeded()
        let cityImageDestanationFrame = containerView.convert(toViewController.cityImage.frame, from: toViewController.cityImage.superview)

        // Clone image view and add it to the container view (and calculate correct origin frame for image)
        let cityImage = selectedCell.cityImage.clone()
        containerView.addSubview(cityImage)
        let cityImageOriginFrame = containerView.convert(selectedCellOriginFrame, from: selectedCell.superview)
        cityImage.frame = cityImageOriginFrame


        // Create animation for target view and cloned image
        toView.alpha = 0
        let transitionAnimator = UIViewPropertyAnimator(duration: Constants.transitionDuration, curve: .easeInOut) {
            cityImage.frame = cityImageDestanationFrame
            toView.alpha = 1
        }

        transitionAnimator.addCompletion { _ in
            // Clear animation context and complete transition
            cityImage.removeFromSuperview()
            toViewController.cityImage.isHidden = false
            transitionContext.completeTransition(true)
        }

        transitionAnimator.startAnimation()
    }
}

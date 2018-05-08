import UIKit

private enum Segues: String {
    // Segue name that navigates to city detail page (has the same value as the segue in storyboard).
    case showCityDetail = "ShowCityDetail"
}

private enum Constants {
    // City cell reuse identifier (has the same value as city cell in storyboard) to use table view cell recycling mechanism.
    static let cityCellIdentifier = "CityCellIdentifier"
}

/**
    All cities controller to show all available cities as a collection.
*/
class CitiesViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UINavigationControllerDelegate {

    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet private weak var collectionView: UICollectionView!

    private let cityService = CityService.shared
    private var cities: [City] = [] {
        didSet {
            // Marshal cities to the main thread using GCD.
            DispatchQueue.main.async { [weak self] in
                // Update collection as data source has changed.
                self?.collectionView.reloadData()
                self?.activityIndicator.stopAnimating()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.delegate = self

        setupData()
    }

    private func setupData() {
        activityIndicator.startAnimating()

        cityService.cities { [weak self] cities in
            self?.cities = cities
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let segueIdentifier = segue.identifier else {
            return
        }

        switch segueIdentifier {
        case Segues.showCityDetail.rawValue:
            guard let cityCell = sender as? CityViewCell,
                let detailsController = segue.destination as? CityDetailViewController else {
                return
            }

            detailsController.city = cityCell.city
        default:
            break
        }
    }

    // MARK: UICollectionViewDataSource

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cities.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cityCell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.cityCellIdentifier, for: indexPath) as? CityViewCell else {
            return UICollectionViewCell()
        }

        let capitalToDisplay = cities[indexPath.row]
        cityCell.city = capitalToDisplay

        return cityCell
    }

    // MARK: UINavigationControllerDelegate

    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        guard let selectedCityCellIndexPath = collectionView.indexPathsForSelectedItems?.first else {
            return nil
        }

        switch operation {
        case .push:
            return CityDetailTransitionAnimator(collectionView: collectionView, selectedIndexPath: selectedCityCellIndexPath)
        case .pop:
            return nil
        case .none:
            return nil
        }

    }
}

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
class CitiesViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

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

        setupData()
    }

    private func setupData() {
        activityIndicator.startAnimating()

        cityService.cities { [weak self] (cities, error) in
            // If error appeared - show the error alert.
            if let error = error {
                self?.showAlert(with: error)
            }

            self?.cities = cities
        }
    }

    private func showAlert(with error: Error) {
        // Marshal alert showing to the main thread using GCD.
        DispatchQueue.main.async { [weak self] in
            guard let strongSelf = self else {
                return
            }

            AlertService.shared.errorOccured(in: strongSelf,
                                             message: error.localizedDescription,
                                             action: strongSelf.setupData)
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
}


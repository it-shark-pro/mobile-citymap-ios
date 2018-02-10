import UIKit


private enum Constants {
    // City cell reuse identifier (has the same value as city cell in storyboard) to use table view cell recycling mechanism.
    static let cityCellIdentifier = "CityCellIdentifier"
    // Segue name that navigates to city detail page (has the same value as the segue in storyboard).
    static let showCityDetailSegue = "ShowCityDetail"
}

/**
    All cities controller to show all available cities as a table.
 */
final class CitiesViewController: UITableViewController {

    private let cities = CityService().cities

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

    private func setupUI() {
        // Workaround to remove empty cells in table view.
        tableView.tableFooterView = UIView()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else {
            return
        }

        switch identifier {
        case Constants.showCityDetailSegue:
            guard let cityCell = sender as? CityTableViewCell,
                let detailsController = segue.destination as? CityDetailViewController else {
                return
            }

            detailsController.city = cityCell.city
        default:
            break
        }
    }

    // MARK: UITableViewSource

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cityCell = tableView.dequeueReusableCell(withIdentifier: Constants.cityCellIdentifier, for: indexPath) as? CityTableViewCell else {
            return UITableViewCell()
        }

        let capitalToDisplay = cities[indexPath.row]
        cityCell.city = capitalToDisplay

        return cityCell
    }
}


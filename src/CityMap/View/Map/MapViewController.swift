import UIKit
import MapKit

private enum Constants {
    // Span for map to expand it default scale.
    static let defaultCoordinateSpan = MKCoordinateSpan(latitudeDelta: 40, longitudeDelta: 40)
}

class MapViewController: UIViewController, MKMapViewDelegate {
    @IBOutlet private weak var mapView: MKMapView!

    /**
        Get currently presented cities on the map or set new cities and update the map annotations.
    */
    var cities: [City] = [] {
        didSet {
            setupData(cities)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

    private func setupUI() {
        mapView.delegate = self

        // Update default map region (expand it to show at least several cities from the start).
        let defaultRegion = MKCoordinateRegion(center: mapView.centerCoordinate, span: Constants.defaultCoordinateSpan)
        mapView.setRegion(defaultRegion, animated: false)

        // Use regular title style in navigation for this page.
        navigationItem.largeTitleDisplayMode = .never
    }

    private func setupData(_ cities: [City]) {
        guard isViewLoaded else {
            return
        }

        mapView.removeAnnotations(mapView.annotations)

        // Add annotation to the map for each city.
        for city in cities {
            let location = CLLocationCoordinate2D(latitude: city.location.latitude, longitude: city.location.longitude)

            let pointAnnotation = MKPointAnnotation()
            pointAnnotation.coordinate = location
            pointAnnotation.title = city.name

            mapView.addAnnotation(pointAnnotation)
        }
    }

    // MARK: MKMapViewDelegate

    func mapViewDidFinishRenderingMap(_ mapView: MKMapView, fullyRendered: Bool) {
        guard fullyRendered else {
            return
        }

        setupData(cities)
    }
}

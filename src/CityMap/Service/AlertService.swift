import UIKit
import Foundation

/**
    A singleton service, that knows how to show different kind of alerts.
 */
final class AlertService {

    /**
        Returns a shared singleton alert service object.
     */
    static let shared = AlertService()

    private init() {}

    /**
        Load, parse and provide cities asynchroniosly from endpoint.

        - parameters:
            - vc: The view controller that is responsible to present alert.
            - message: The message that will be presented in the alert.
            - callback: The action that is going to be assigned to the 'Try Again' button.
     */
    func errorOccured(in vc: UIViewController, message: String, action: @escaping () -> Void) {
        
        let alert = UIAlertController(title: "Error",
                                      message: message,
                                      preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Cancel",
                                      style: .cancel,
                                      handler: nil))

        alert.addAction(UIAlertAction(title: "Try Again", style: .default) { _ in
            action()
        })

        vc.present(alert, animated: true, completion: nil)
    }
}


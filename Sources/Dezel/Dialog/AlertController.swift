import UIKit

/**
 * @class AlertController
 * @super UIAlertController
 * @since 0.1.0
 */
open class AlertController: UIAlertController {

	//--------------------------------------------------------------------------
	// MARK: Static Methods
	//--------------------------------------------------------------------------

	/**
	 * Creates a new alert controller.
	 * @method create
	 * @since 0.1.0
	 */
	public static func create(style: String, title: String, message: String) -> AlertController {

		let preferredStyle: AlertController.Style

		switch (style) {

			case "alert":
				preferredStyle = .alert
			case "sheet":
				preferredStyle = .actionSheet

			default:
				preferredStyle = .alert
		}

		return AlertController(
			title: title.length > 0 ? title : nil,
			message: message.length > 0 ? message : nil,
			preferredStyle: preferredStyle
		)
	}

	//--------------------------------------------------------------------------
	// MARK: Properties
	//--------------------------------------------------------------------------

	/**
	 * The alert controller's delegate.
	 * @property delegate
	 * @since 0.1.0
	 */
	open weak var delegate: AlertControllerDelegate?

	//--------------------------------------------------------------------------
	// MARK: Methods
	//--------------------------------------------------------------------------

	/**
	 * @inherited
	 * @method viewDidAppear
	 * @since 0.1.0
	 */
	override open func viewDidAppear(_ animated: Bool) {
		DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
			self.delegate?.didPresent(alert: self)
		}
	}

	/**
	 * @inherited
	 * @method viewDidDisappear
	 * @since 0.1.0
	 */
	override open func viewDidDisappear(_ animated: Bool) {
		DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
    		self.delegate?.didDismiss(alert: self)
		}
	}
}

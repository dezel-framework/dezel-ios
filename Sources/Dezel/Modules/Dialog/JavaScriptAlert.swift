import UIKit

/**
 * @class JavaScriptAlert
 * @super JavaScriptClass
 * @since 0.1.0
 */
open class JavaScriptAlert: JavaScriptClass, AlertControllerDelegate {

	//--------------------------------------------------------------------------
	// MARK: Properties
	//--------------------------------------------------------------------------

	/**
	 * @property alertController
	 * @since 0.1.0
	 * @hidden
	 */
	private var alertController: AlertController?

	//--------------------------------------------------------------------------
	// MARK: Methods
	//--------------------------------------------------------------------------

	/**
	 * @method didPresent
	 * @since 0.1.0
	 * @hidden
	 */
	open func didPresent(alert: AlertController) {
		self.callMethod("nativeOnPresent")
	}

	/**
	 * @method didDismiss
	 * @since 0.1.0
	 * @hidden
	 */
	open func didDismiss(alert: AlertController) {
		self.callMethod("nativeOnDismiss")
		self.unprotect()
	}

	//--------------------------------------------------------------------------
	// MARK: JS Functions
	//--------------------------------------------------------------------------

	/**
	 * @method jsFunction_present
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open func jsFunction_present(callback: JavaScriptFunctionCallback) {

		if (callback.arguments < 4) {
			fatalError("Method JavaScriptAlert.present() requires 4 arguments.")
		}

		self.protect()

		self.context.controller.presentedViewController?.dismiss(animated: true, completion: nil)

		let style   = callback.argument(0).string
		let title   = callback.argument(1).string.trim()
		let message = callback.argument(2).string.trim()
		let buttons = callback.argument(3)

		let alertController = AlertController.create(style: style, title: title, message: message)

		buttons.forEach { index, value in

			if let button = value.cast(JavaScriptAlertButton.self) {

				var style: UIAlertAction.Style = .default

				switch (button.style.string) {

					case "normal":
						style = .default
					case "cancel":
						style = .cancel
					case "destructive":
						style = .destructive

					default: break
				}

				let action = UIAlertAction(title: button.label.string, style: style) { action in
					button.callMethod("nativeOnPress")
				}

				if (button.image.type == .string) {

					if let image = UIImage(path: button.image.string) {

						let size = CGSize(width: 32, height: 32)

						UIGraphicsBeginImageContextWithOptions(size, false, 0.0)

						image.draw(in: CGRect(
							x: 0,
							y: 0,
							width: size.width,
							height: size.height
						))

						if let image = UIGraphicsGetImageFromCurrentImageContext() {
							action.setValue(image, forKey: "image")
						}

						UIGraphicsEndImageContext()
					}
				}

				alertController.addAction(action)
			}
		}

		if (alertController.actions.count == 0) {
			alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
		}

		alertController.delegate = self

		self.context.controller.present(alertController, animated: true, completion: nil)
	}

	/**
	 * @method jsFunction_dismiss
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open func jsFunction_dismiss(callback: JavaScriptFunctionCallback) {
		if let alertController = self.alertController {
			alertController.presentingViewController?.dismiss(animated: true, completion: nil)
		}
	}
}

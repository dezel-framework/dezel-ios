import UIKit

/**
 * @extension UIApplication
 * @since 0.1.0
 * @hidden
 */
internal extension UIApplication {

	/**
	 * @property window
	 * @since 0.1.0
	 * @hidden
	 */
	var window: ApplicationWindow? {
		return UIApplication.shared.keyWindow as? ApplicationWindow
	}
}

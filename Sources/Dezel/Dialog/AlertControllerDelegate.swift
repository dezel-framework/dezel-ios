/**
 * @protocol AlertControllerDelegate
 * @since 0.1.0
 */
public protocol AlertControllerDelegate : AnyObject {

	/**
	 * Called when the alert controller is presented.
	 * @method didPresent
	 * @since 0.1.0
	 */
	func didPresent(alert: AlertController)

	/**
	 * Called when the alert controller is dismissed.
	 * @method didPresent
	 * @since 0.1.0
	 */
	func didDismiss(alert: AlertController)
}

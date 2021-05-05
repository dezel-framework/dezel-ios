/**
 * @protocol SynchronizerCallback
 * @since 0.1.0
 */
public protocol SynchronizerCallback : AnyObject {

	/**
	 * Called when the synchronizer is ready to update.
	 * @method performUpdate
	 * @since 0.1.0
	 */
	func performUpdate()
}

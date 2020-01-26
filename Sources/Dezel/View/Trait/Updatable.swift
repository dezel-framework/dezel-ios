/**
 * @protocol Updatable
 * @since 0.1.0
 */
public protocol Updatable: AnyObject {

	/**
	 * Called when the view is updated.
	 * @method update
	 * @since 0.1.0
	 */
	func update()
}

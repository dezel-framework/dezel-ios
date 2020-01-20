import UIKit

/**
 * @protocol Resizable
 * @since 0.1.0
 */
public protocol Resizable: AnyObject {

	/**
	 * Called when the wrapper view resizes.
	 * @method didResize
	 * @since 0.1.0
	 */
	func didResize(frame: CGRect)
}

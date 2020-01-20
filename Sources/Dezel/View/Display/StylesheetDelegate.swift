import UIKit

/**
 * @protocol StylesheetDelegate
 * @since 0.1.0
 */
public protocol StylesheetDelegate: AnyObject {

	/**
	 * Called when the stylesheet throws an error.
	 * @method didThrowError
	 * @since 0.1.0
	 */
	func didThrowError(stylesheet: Stylesheet, error: String, col: Int, row: Int, url: String)

}

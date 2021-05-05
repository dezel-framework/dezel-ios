import UIKit

/**
 * @protocol TextViewObserver
 * @since 0.1.0
 */
public protocol TextViewObserver: AnyObject {

	/**
	 * Called when a link is pressed.
	 * @method onPressLink
	 * @since 0.1.0
	 */
	func didPressLink(textView: TextView, url: String)

}

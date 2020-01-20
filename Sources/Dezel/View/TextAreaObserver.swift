import UIKit

/**
 * @protocol TextAreaObserver
 * @since 0.1.0
 */
public protocol TextAreaObserver: AnyObject {

	/**
	 * Called when the text area's value changes.
	 * @method didChange
	 * @since 0.1.0
	 */
	func didChange(textInput: TextArea, value: String)

	/**
	 * Called when the text area's receives focus.
	 * @method didFocus
	 * @since 0.1.0
	 */
	func didFocus(textInput: TextArea)

	/**
	 * Called when the text area's loses focus.
	 * @method didBlur
	 * @since 0.1.0
	 */
	func didBlur(textInput: TextArea)

}

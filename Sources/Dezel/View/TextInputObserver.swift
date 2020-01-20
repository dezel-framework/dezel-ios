import UIKit

/**
 * @protocol TextInputObserver
 * @since 0.1.0
 */
public protocol TextInputObserver: AnyObject {

	/**
	 * Called when the text input's value changes.
	 * @method didChange
	 * @since 0.1.0
	 */
	func didChange(textInput: TextInput, value: String)

	/**
	 * Called when the text input receives focus.
	 * @method didFocus
	 * @since 0.1.0
	 */
	func didFocus(textInput: TextInput)

	/**
	 * Called when the text input loses focus.
	 * @method didBlur
	 * @since 0.1.0
	 */
	func didBlur(textInput: TextInput)

}

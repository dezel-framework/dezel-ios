import UIKit

/**
 * @extension UITextField
 * @since 0.1.0
 * @hidden
 */
internal extension UITextField {

	/**
	 * @method range
	 * @since 0.1.0
	 * @hidden
	 */
	func range(start: Int, end: Int) -> UITextRange? {

		let sp = self.position(from: self.beginningOfDocument, offset: start)
		let ep = self.position(from: self.beginningOfDocument, offset: end)

		guard
			let s = sp,
			let e = ep else {
			return nil
		}

		return self.textRange(from: s, to: e)
	}
}

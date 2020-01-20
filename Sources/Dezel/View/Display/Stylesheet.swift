import UIKit
import DezelCoreUI

/**
 * @class Stylesheet
 * @since 0.1.0
 */
open class Stylesheet {

	//--------------------------------------------------------------------------
	// MARK: Properties
	//--------------------------------------------------------------------------

	/**
	 * The stylesheet's delegate.
	 * @property delegate
	 * @since 0.1.0
	 */
	open weak var delegate: StylesheetDelegate?

	/**
	 * @property handle
	 * @since 0.1.0
	 * @hidden
	 */
	internal var handle: StylesheetRef

	//--------------------------------------------------------------------------
	// MARK: Methods
	//--------------------------------------------------------------------------

	/**
	 * Initializes the stylesheet.
	 * @constructor
	 * @since 0.1.0
	 */
	public init() {
		self.handle = StylesheetCreate()
	}

	/**
	 * @destructor
	 * @since 0.1.0
	 * @hidden
	 */
	deinit {
		StylesheetDelete(self.handle)
	}

	/**
	 * Assigns a stylesheet variable.
	 * @method setVariable
	 * @since 0.1.0
	 */
	public func setVariable(_ name: String, value: String) {

		var error: UnsafeMutablePointer<ParseError>?

		StylesheetSetVariable(self.handle, name, value, &error)

		if let error = error {
			self.delegate?.didThrowError(
				stylesheet: self,
				error: error.pointee.message.string,
				col: Int(error.pointee.col),
				row: Int(error.pointee.row),
				url: error.pointee.url.string
			)
		}
	}

	/**
	 * Evaluates styles.
	 * @method evaluate
	 * @since 0.1.0
	 */
	public func evaluate(_ source: String, url: String) {

		var error: UnsafeMutablePointer<ParseError>?

		StylesheetEvaluate(self.handle, source, url, &error)

		if let error = error {
			self.delegate?.didThrowError(
				stylesheet: self,
				error: error.pointee.message.string,
				col: Int(error.pointee.col),
				row: Int(error.pointee.row),
				url: error.pointee.url.string
			)
		}
	}
}

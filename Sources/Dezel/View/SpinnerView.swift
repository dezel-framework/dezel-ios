import UIKit

/**
 * @class SpinnerView
 * @super UIActivityIndicatorView
 * @since 0.1.0
 */
open class SpinnerView: UIActivityIndicatorView {

	//----------------------------------------------------------------------
	// MARK: Properties
	//----------------------------------------------------------------------

	/**
	 * Whether the spinner view is spinning.
	 * @property spin
	 * @since 0.1.0
	 */
	open var spin: Bool = false {
		willSet {
			if (newValue) {
				self.startAnimating()
			} else {
				self.stopAnimating()
			}
		}
	}

	//--------------------------------------------------------------------------
	// MARK: Methods
	//--------------------------------------------------------------------------

	/**
	 * @constructor
	 * @since 0.1.0
	 * @hidden
	 */
	required public init(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	/**
	 * Initializes the spinner.
	 * @constructor
	 * @since 0.1.0
	 */
	public override init(frame: CGRect) {
		super.init(frame: frame)
		self.style = .gray
		self.hidesWhenStopped = false
	}
}

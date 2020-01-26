import UIKit

/**
 * @class Source
 * @since 0.1.0
 */
open class Source {

	//--------------------------------------------------------------------------
	// MARK: Properties
	//--------------------------------------------------------------------------

	/**
	 * The source's path.
	 * @property path
	 * @since 0.1.0
	 */
	private(set) public var path: String

	/**
	 * The source's data.
	 * @property data
	 * @since 0.1.0
	 */
	public var data: String {
		return self.read()
	}

	//--------------------------------------------------------------------------
	// MARK: Methods
	//--------------------------------------------------------------------------

	/**
	 * Initializes the source.
	 * @constructor
	 * @since 0.1.0
	 */
	public init(path: String) {
		self.path = path
	}

	/**
	 * Applies the source to the application.
	 * @method apply
	 * @since 0.1.0
	 */
	open func apply(application: ApplicationController) {
		fatalError("You must override this method")
	}

	//--------------------------------------------------------------------------
	// MARK: Private API
	//--------------------------------------------------------------------------

	/**
	 * @method read
	 * @since 0.1.0
	 * @hidden
	 */
	private func read() -> String{

		do {

			if (self.path.hasPrefix("http://") ||
				self.path.hasPrefix("https://")) {
				return try String(contentsOf: URL(string: self.path)!)
			}

			return try String(contentsOfFile: Bundle.main.path(forResource: self.path, ofType: nil)!)

		} catch _ {
			fatalError("Cannot load source at location \(self.path).")
		}
	}
}

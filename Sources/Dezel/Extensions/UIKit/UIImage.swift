import UIKit

/**
 * @extension UIImage
 * @since 0.1.0
 */
public extension UIImage {

	/**
	 * @constructor
	 * @since 0.1.0
	 * @hidden
	 */
	convenience init?(path: String) {
		self.init(named: "app/\(path)", in: nil, compatibleWith: nil)
	}
}

import UIKit

/**
 * @extension NSData
 * @since 0.1.0
 * @hidden
 */
internal extension NSData {

	/**
	 * @property string
	 * @since 0.1.0
	 * @hidden
	 */
	var string: String {
		return String(data: self as Data, encoding: .utf8)!
	}
}

import UIKit

/**
 * @extension Data
 * @since 0.1.0
 * @hidden
 */
internal extension Data {

	/**
	 * @property string
	 * @since 0.1.0
	 * @hidden
	 */
	var string: String {
		return String(data: self as Data, encoding: .utf8)!
	}
}




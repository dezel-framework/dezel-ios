import UIKit

/**
 * @extension HTTPURLResponse
 * @since 0.1.0
 * @hidden
 */
internal extension HTTPURLResponse {

	/**
	 * @property statusText
	 * @since 0.1.0
	 * @hidden
	 */
	var statusText: String {
		return HTTPURLResponse.localizedString(forStatusCode: self.statusCode)
	}
}

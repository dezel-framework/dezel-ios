import UIKit

/**
 * @class HttpResponse
 * @since 0.1.0
 */
open class HttpResponse {

	//--------------------------------------------------------------------------
	// MARK: Properties
	//--------------------------------------------------------------------------

	/**
	 * The response's url.
	 * @property url
	 * @since 0.1.0
	 */
	public var url: URL

	/**
	 * The response's data.
	 * @property data
	 * @since 0.1.0
	 */
	public var data: String = ""

	/**
	 * The response's headers.
	 * @property headers
	 * @since 0.1.0
	 */
	public var headers: [String: String] = [:]

	/**
	 * The response's status code.
	 * @property statusCode
	 * @since 0.1.0
	 */
	public var statusCode: Int = 0

	/**
	 * The response's status text.
	 * @property statusText
	 * @since 0.1.0
	 */
	public var statusText: String = ""

	//--------------------------------------------------------------------------
	// MARK: Method
	//--------------------------------------------------------------------------

	/**
	 * @constructor
	 * @since 0.1.0
	 * @hidden
	 */
	public init(url: URL) {
		self.url = url
	}
}

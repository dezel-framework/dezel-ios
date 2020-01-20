/**
 * @protocol HttpRequestDelegate
 * @since 0.1.0
 */
public protocol HttpRequestDelegate: AnyObject {

	/**
	 * Called when the request fails.
	 * @method didError
	 * @since 0.1.0
	 */
	func didError(request: HttpRequest, response: HttpResponse)

	/**
	 * Called when the request timeouts.
	 * @method didTimeout
	 * @since 0.1.0
	 */
	func didTimeout(request: HttpRequest, response: HttpResponse)

	/**
	 * Called when the request progresses.
	 * @method didProgress
	 * @since 0.1.0
	 */
	func didProgress(request: HttpRequest, loaded: Int64, length: Int64)

	/**
	 * Called when the request finishes.
	 * @method didComplete
	 * @since 0.1.0
	 */
	func didComplete(request: HttpRequest, response: HttpResponse)
}

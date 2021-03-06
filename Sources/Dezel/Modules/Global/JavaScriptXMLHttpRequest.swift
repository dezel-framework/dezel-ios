import UIKit

/**
 * @class JavaScriptXMLHttpRequest
 * @super JavaScriptClass
 * @since 0.1.0
 */
open class JavaScriptXMLHttpRequest: JavaScriptClass, HttpRequestDelegate {

	//--------------------------------------------------------------------------
	// MARK: Properties
	//--------------------------------------------------------------------------

	/**
	 * @property request
	 * @since 0.1.0
	 * @hidden
	 */
	private var request: HttpRequest?

	//--------------------------------------------------------------------------
	// MARK: Methods
	//--------------------------------------------------------------------------

	/**
	 * @inherited
	 * @method dispose
	 * @since 0.1.0
	 */
	override open func dispose() {

		self.request?.abort()
		self.request = nil

		super.dispose()
	}

	//--------------------------------------------------------------------------
	// MARK: Request Delegate
	//--------------------------------------------------------------------------

	/**
	 * @method didError
	 * @since 0.1.0
	 * @hidden
	 */
	public func didError(request: HttpRequest, response: HttpResponse) {

		self.callMethod("nativeOnError", arguments: [
			self.context.createNumber(response.statusCode),
			self.context.createString(response.statusText)
		])

		self.unprotect()
	}

	/**
	 * @method didTimeout
	 * @since 0.1.0
	 * @hidden
	 */
	public func didTimeout(request: HttpRequest, response: HttpResponse) {

		self.callMethod("nativeOnTimeout", arguments: [
			self.context.createNumber(response.statusCode),
			self.context.createString(response.statusText)
		])

		self.unprotect()
	}

	/**
	 * @method didProgress
	 * @since 0.1.0
	 * @hidden
	 */
	public func didProgress(request: HttpRequest, loaded: Int64, length: Int64) {
		self.callMethod("nativeOnProgress", arguments: [
			self.context.createNumber(Double(loaded)),
			self.context.createNumber(Double(length))
		])
	}

	/**
	 * @method didComplete
	 * @since 0.1.0
	 * @hidden
	 */
	public func didComplete(request: HttpRequest, response: HttpResponse) {

		self.callMethod("nativeOnComplete", arguments: [
			self.context.createString(response.data),
			self.context.createNumber(response.statusCode),
			self.context.createString(response.statusText),
			self.context.createObject(response.headers),
			self.context.createString(response.url)
		])

		self.unprotect()
	}

	//--------------------------------------------------------------------------
	// MARK: JS Function
	//--------------------------------------------------------------------------

	/**
	 * @method jsFunction_request
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open func jsFunction_request(callback: JavaScriptFunctionCallback) {

		self.request?.abort()
		self.request = nil

		if (callback.arguments < 7) {
			fatalError("Method JavaScriptXMLHttpRequest.request() requires 7 arguments.")
		}

		let requestUrl      = callback.argument(0)
		let requestMethod   = callback.argument(1).string
		let requestHeaders  = callback.argument(2)
		let requestTimeout  = callback.argument(3)
		let requestUsername = callback.argument(4)
		let requestPassword = callback.argument(5)
		let requestData     = callback.argument(6)

		guard let url = requestUrl.toURL() else {
			NSLog("Invalid XMLHttpRequest URL.")
			return
		}

		let headers = requestHeaders.toDictionaryOfString()
		let timeout = requestTimeout.toTimeInterval() / 1000

		var username: String?
		var password: String?

		if (requestUsername.isString) { username = requestUsername.string }
		if (requestPassword.isString) { password = requestPassword.string }

		let request = HttpRequest(url: url, method: requestMethod)
		request.timeout = timeout
		request.headers = headers
		request.username = username
		request.password = password
		request.delegate = self

		if (requestData.isString) {
			request.data = requestData.string.data(using: .utf8)
		}

		request.send()

		self.request = request

		self.protect()
	}

	/**
	 * @method jsFunction_abort
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open func jsFunction_abort(callback: JavaScriptFunctionCallback) {
		self.request?.abort()
	}

	/**
	 * @method jsFunction_reset
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open func jsFunction_reset(callback: JavaScriptFunctionCallback) {
		self.request?.delegate = nil
		self.request?.abort()
	}
}

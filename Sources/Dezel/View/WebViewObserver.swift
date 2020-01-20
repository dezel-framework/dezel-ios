import UIKit
import WebKit

/**
 * @protocol WebViewObserver
 * @since 0.1.0
 */
public protocol WebViewObserver : AnyObject {

	/**
	 * Called before the web view loads and URL.
	 * @method willLoad
	 * @since 0.1.0
	 */
	func willLoad(webView: WebView, url: URL) -> Bool

	/**
	 * Called when the web view finishes loading.
	 * @method didLoad
	 * @since 0.1.0
	 */
	func didLoad(webView: WebView)

	/**
	 * Called when the web view updates its content size.
	 * @method didUpdateContentSize
	 * @since 0.1.0
	 */
	func didUpdateContentSize(webView: WebView, size: CGSize)
}

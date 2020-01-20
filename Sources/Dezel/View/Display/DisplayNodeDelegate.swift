import UIKit

/**
 * @protocol DisplayNodeDelegate
 * @since 0.1.0
 */
public protocol DisplayNodeDelegate: AnyObject {

	/**
	 * Called when the display node gets invalidated.
	 * @method didInvalidate
	 * @since 0.1.0
	 */
	func didInvalidate(node: DisplayNode)

	/**
	 * Called when the display node resolves its size.
	 * @method didResolveSize
	 * @since 0.1.0
	 */
	func didResolveSize(node: DisplayNode)

	/**
	 * Called when the display node resolves its origin.
	 * @method didResolveOrigin
	 * @since 0.1.0
	 */
	func didResolveOrigin(node: DisplayNode)

	/**
	 * Called when the display node resolves its inner size.
	 * @method didResolveInnerSize
	 * @since 0.1.0
	 */
	func didResolveInnerSize(node: DisplayNode)

	/**
	 * Called when the display node resolves its content size.
	 * @method didResolveContentSize
	 * @since 0.1.0
	 */
	func didResolveContentSize(node: DisplayNode)

	/**
	 * Called when the display node resolves its margin.
	 * @method didResolveMargins
	 * @since 0.1.0
	 */
	func didResolveMargins(node: DisplayNode)

	/**
	 * Called when the display node resolves its border.
	 * @method didResolveBorders
	 * @since 0.1.0
	 */
	func didResolveBorders(node: DisplayNode)

	/**
	 * Called when the display node resolves its padding.
	 * @method didResolvePadding
	 * @since 0.1.0
	 */
	func didResolvePadding(node: DisplayNode)

	/**
	 * Called when the display node is about to resolve its layout.
	 * @method didPrepareLayout
	 * @since 0.1.0
	 */
	func didPrepareLayout(node: DisplayNode)

	/**
	 * Called when the display node resolves its layout.
	 * @method didResolveLayout
	 * @since 0.1.0
	 */
	func didResolveLayout(node: DisplayNode)

	/**
	 * Measures the display node's intrinsic size.
	 * @method measure
	 * @since 0.1.0
	 */
	func measure(node: DisplayNode, bounds: CGSize, min: CGSize, max: CGSize) -> CGSize?

	/**
	 * Returns the property given by the specified name.
	 * @method resolve
	 * @since 0.1.0
	 */
	func resolve(node: DisplayNode, property: String) -> JavaScriptProperty?

}

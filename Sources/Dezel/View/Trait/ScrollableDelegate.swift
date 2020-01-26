import UIKit

/**
 * @protocol ScrollableDelegate
 * @since 0.1.0
 */
public protocol ScrollableDelegate: AnyObject {

	/**
	 * Called when the view begins dragging.
	 * @method didBeginDragging
	 * @since 0.1.0
	 */
	func didBeginDragging(scrollable: Scrollable)

	/**
	 * Called when the view finishes dragging.
	 * @method didFinishDragging
	 * @since 0.1.0
	 */
	func didFinishDragging(scrollable: Scrollable)

	/**
	 * Called when the view is dragging.
	 * @method didDrag
	 * @since 0.1.0
	 */
	func didDrag(scrollable: Scrollable)

	/**
	 * Called when the view begins scrolling.
	 * @method didBeginScrolling
	 * @since 0.1.0
	 */
	func didBeginScrolling(scrollable: Scrollable)

	/**
	 * Called when the view finishes scrolling.
	 * @method didFinishScrolling
	 * @since 0.1.0
	 */
	func didFinishScrolling(scrollable: Scrollable)

	/**
	 * Called when the view scrolls.
	 * @method didScroll
	 * @since 0.1.0
	 */
	func didScroll(scrollable: Scrollable, top: CGFloat, left: CGFloat)

	/**
	 * Called when the view begins zooming.
	 * @method didBeginZooming
	 * @since 0.1.0
	 */
	func didBeginZooming(scrollable: Scrollable)

	/**
	 * Called when the view finishes zooming.
	 * @method didFinishZooming
	 * @since 0.1.0
	 */
	func didFinishZooming(scrollable: Scrollable, scale: CGFloat)

	/**
	 * Called when the view zooms.
	 * @method didZoom
	 * @since 0.1.0
	 */
	func didZoom(scrollable: Scrollable)
}

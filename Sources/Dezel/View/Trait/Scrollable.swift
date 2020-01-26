import UIKit

/**
 * @protocol Scrollable
 * @since 0.1.0
 */
public protocol Scrollable: AnyObject {

	/**
	 * The scroll delegate.
	 * @property scrollableDelegate
	 * @since 0.1.0
	 */
	var scrollableDelegate: ScrollableDelegate? { get set }

	/**
	 * Whether the view is scrollable.
	 * @property scrollable
	 * @since 0.1.0
	 */
	var scrollable: Bool { get set }

	/**
	 * The view's scrollbars mode.
	 * @property scrollbars
	 * @since 0.1.0
	 */
	var scrollbars: Scrollbars { get set }

	/**
	 * The view's overscroll mode.
	 * @property overscroll
	 * @since 0.1.0
	 */
	var overscroll: Overscroll { get set }

	/**
	 * The view's scroll top.
	 * @property scrollTop
	 * @since 0.1.0
	 */
	var scrollTop: CGFloat { get set }

	/**
	 * The view's scroll left.
	 * @property scrollLeft
	 * @since 0.1.0
	 */
	var scrollLeft: CGFloat { get set }

	/**
	 * The view's scroll width.
	 * @property scrollWidth
	 * @since 0.1.0
	 */
	var scrollWidth: CGFloat { get set }

	/**
	 * The view's scroll height.
	 * @property scrollHeight
	 * @since 0.1.0
	 */
	var scrollHeight: CGFloat { get set }

	/**
	 * The view's scroll inertia.
	 * @property scrollInertia
	 * @since 0.1.0
	 */
	var scrollInertia: Bool { get set }

	/**
	 * The view's top content inset.
	 * @property contentInsetTop
	 * @since 0.1.0
	 */
	var contentInsetTop: CGFloat { get set }

	/**
	 * The view's left content inset.
	 * @property contentInsetLeft
	 * @since 0.1.0
	 */
	var contentInsetLeft: CGFloat { get set }

	/**
	 * The view's right content inset.
	 * @property contentInsetRight
	 * @since 0.1.0
	 */
	var contentInsetRight: CGFloat { get set }

	/**
	 * The view's bottom content inset.
	 * @property contentInsetBottom
	 * @since 0.1.0
	 */
	var contentInsetBottom: CGFloat { get set }

	/**
	 * Whether the view is paged.
	 * @property paged
	 * @since 0.1.0
	 */
	var paged: Bool { get set }

	/**
	 * Whether the view is zoomable.
	 * @property zoomable
	 * @since 0.1.0
	 */
	var zoomable: Bool { get set }

	/**
	 * The view's minimum zoom factor.
	 * @property minZoom
	 * @since 0.1.0
	 */
	var minZoom: CGFloat { get set }

	/**
	 * The view's maximum zoom fator.
	 * @property maxZoom
	 * @since 0.1.0
	 */
	var maxZoom: CGFloat { get set }

	/**
	 * The view's zoomed view.
	 * @property zoomedView
	 * @since 0.1.0
	 */
	var zoomedView: UIView? { get set }

	/**
	 * Smooth scrolls to the specified location.
 	 * @method scrollTo
	 * @since 0.1.0
	 */
	func scrollTo(x: CGFloat, y: CGFloat)

}

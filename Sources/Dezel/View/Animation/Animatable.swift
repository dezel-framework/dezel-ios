import UIKit

/**
 * @protocol Animatable
 * @since 0.1.0
 */
public protocol Animatable: AnyObject {

	/**
	 * Called when a property is about to be animated.
	 * @method willAnimate
	 * @since 0.1.0
	 */
	func willAnimate(layer: CALayer, property: String)

	/**
	 * Called when a transition animation begins.
	 * @method didBeginTransition
	 * @since 0.1.0
	 */
	func didBeginTransition(layer: CALayer)

	/**
	 * Called when a transition animation is comitted.
	 * @method didCommitTransition
	 * @since 0.1.0
	 */
	func didCommitTransition(layer: CALayer)

	/**
	 * Called when a transition animation is finished.
	 * @method didFinishTransition
	 * @since 0.1.0
	 */
	func didFinishTransition(layer: CALayer)
}

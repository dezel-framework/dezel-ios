import UIKit

/**
 * @class ShapeLayer
 * @super CAShapeLayer
 * @since 0.1.0
 */
open class ShapeLayer: CAShapeLayer, CALayerDelegate, Animatable {

	//--------------------------------------------------------------------------
	// MARK: Class Methods
	//--------------------------------------------------------------------------

	/**
	 * @method defaultAction
	 * @since 0.1.0
	 * @hidden
	 */
	override open class func defaultAction(forKey event: String) -> CAAction? {
		return nil
	}

	//--------------------------------------------------------------------------
	// MARK: Methods
	//--------------------------------------------------------------------------

	/**
	 * @constructor
	 * @since 0.1.0
	 * @hidden
	 */
	required public init?(coder:NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	/**
	 * Initializes the layer.
	 * @constructor
	 * @since 0.1.0
	 */
	public required override init() {
		super.init()
		self.setup()
	}

	/**
	 * @constructor
	 * @since 0.1.0
	 * @hidden
	 */
	override init(layer: Any) {
		super.init(layer: layer)
	}

	/**
	 * @inherited
	 * @method action
	 * @since 0.1.0
	 */
	override open func action(forKey key: String) -> CAAction? {

		if let transition = TransitionManager.transition {

			var current = self.presentation()
			if (current == nil || self.animation(forKey: key) == nil) {
				current = self
			}

			let animation = CABasicAnimation(key: key, delay: transition.delay)

			switch (key) {

				case "bounds":
					animation.fromValue = NSValue(cgRect: current!.bounds)
				case "position":
					animation.fromValue = NSValue(cgPoint: current!.position)
				case "transform":
					animation.fromValue = NSValue(caTransform3D: current!.transform)
				case "opacity":
					animation.fromValue = current!.opacity
				case "path":
					animation.fromValue = current!.path

				default:
					return NSNull()
			}

			transition.notify(self)

			self.willAnimate(layer: self, property: key)

			return animation
		}

		return NSNull()
	}

	/**
	 * @inherited
	 * @method willAnimate
	 * @since 0.1.0
	 */
	open func willAnimate(layer: CALayer, property: String) {
		(self.listener as? Animatable)?.willAnimate(layer: self, property: property)
	}

	/**
	 * @inherited
	 * @method didBeginTransition
	 * @since 0.1.0
	 */
	open func didBeginTransition(layer: CALayer) {
		(self.listener as? Animatable)?.didBeginTransition(layer: self)
	}

	/**
	 * @inherited
	 * @method didCommitTransition
	 * @since 0.1.0
	 */
	open func didCommitTransition(layer: CALayer) {
		(self.listener as? Animatable)?.didCommitTransition(layer: self)
	}

	/**
	 * @inherited
	 * @method didFinishTransition
	 * @since 0.1.0
	 */
	open func didFinishTransition(layer: CALayer) {
		(self.listener as? Animatable)?.didFinishTransition(layer: self)
	}
}

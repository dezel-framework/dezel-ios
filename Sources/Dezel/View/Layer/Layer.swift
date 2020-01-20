import UIKit

/**
 * @class Layer
 * @super CAGradientLayer
 * @since 0.1.0
 */
open class Layer: CAGradientLayer, CALayerDelegate, Animatable {

	//--------------------------------------------------------------------------
	// MARK: Class Methods
	//--------------------------------------------------------------------------

	/**
	 * @inheried
	 * @method defaultAction
	 * @since 0.1.0
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
	public override init(layer: Any) {
		super.init(layer: layer)
	}

	/**
	 * Resizes the layer.
	 * @method resize
	 * @since 0.1.0
	 */
	open func resize(_ bounds: CGRect) {
		self.frame = bounds
	}

	/**
	 * Updates the layer.
	 * @method update
	 * @since 0.1.0
	 */
	open func update() {

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
				case "backgroundColor":
					animation.fromValue = current!.backgroundColor

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
		(self.listener as? Animatable)?.willAnimate(layer: layer, property: property)
	}

	/**
	 * @inherited
	 * @method didBeginTransition
	 * @since 0.1.0
	 */
	open func didBeginTransition(layer: CALayer) {
		(self.listener as? Animatable)?.didBeginTransition(layer: layer)
	}

	/**
	 * @inherited
	 * @method didCommitTransition
	 * @since 0.1.0
	 */
	open func didCommitTransition(layer: CALayer) {
		(self.listener as? Animatable)?.didCommitTransition(layer: layer)
	}

	/**
	 * @inherited
	 * @method didFinishTransition
	 * @since 0.1.0
	 */
	open func didFinishTransition(layer: CALayer) {
		(self.listener as? Animatable)?.didFinishTransition(layer: layer)
	}

}

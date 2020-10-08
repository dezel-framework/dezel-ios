import UIKit

/**
 * @class RenderLayer
 * @super Layer
 */
public class RenderLayer: Layer {

	//--------------------------------------------------------------------------
	// MARK: Class Methods
	//--------------------------------------------------------------------------

	/**
	 * @inherited
	 * @method needsDisplay
	 * @since 0.1.0
	 */
	override open class func needsDisplay(forKey key: String) -> Bool {

		if (key == "cornerTopLeftRadius" ||
			key == "cornerTopRightRadius" ||
			key == "cornerBottomLeftRadius" ||
			key == "cornerBottomRightRadius") {
			return true
		}

		return super.needsDisplay(forKey: key)
	}

	//--------------------------------------------------------------------------
	// MARK: Properties
	//--------------------------------------------------------------------------

	/**
	 * The layer's top left border radius.
	 * @property cornerTopLeftRadius
	 * @since 0.1.0
	 */
	@NSManaged public var cornerTopLeftRadius: CGFloat

	/**
	 * The layer's top right border radius.
	 * @property cornerTopRightRadius
	 * @since 0.1.0
	 */
	@NSManaged public var cornerTopRightRadius: CGFloat

	/**
	 * The layer's bottom left border radius.
	 * @property cornerBottomLeftRadius
	 * @since 0.1.0
	 */
	@NSManaged public var cornerBottomLeftRadius: CGFloat

	/**
	 * The layer's bottom right border radius.
	 * @property cornerBottomRightRadius
	 * @since 0.1.0
	 */
	@NSManaged public var cornerBottomRightRadius: CGFloat

	/**
	 * @property shape
	 * @since 0.1.0
	 * @hidden
	 */
	private var shape: ShapeLayer = ShapeLayer()

	//--------------------------------------------------------------------------
	// MARK: Methods
	//--------------------------------------------------------------------------

	/**
	 * @constructor
	 * @since 0.1.0
	 * @hidden
	 */
	required public init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	/**
	 * Initializes the layer.
	 * @constructor
	 * @since 0.1.0
	 */
	required public init() {
		super.init()
		self.needsDisplayOnBoundsChange = true
		self.shape.listener = self
	}

	/**
	 * @constructor
	 * @since 0.1.0
	 * @hiden
	 */
	override init(layer: Any) {

		super.init(layer: layer)

		if let layer = layer as? RenderLayer {
			self.cornerTopLeftRadius = layer.cornerTopLeftRadius
			self.cornerTopRightRadius = layer.cornerTopRightRadius
			self.cornerBottomLeftRadius = layer.cornerBottomLeftRadius
			self.cornerBottomRightRadius = layer.cornerBottomRightRadius
		}
	}

	/**
	 * @inherited
	 * @method update
	 * @since 0.1.0
	 */
	override open func update() {

		if (self.needsDisplay() == false) {
			return
		}

		let layerW = self.bounds.size.width
		let layerH = self.bounds.size.height

		let cornerRadiusTL = self.cornerTopLeftRadius
		let cornerRadiusTR = self.cornerTopRightRadius
		let cornerRadiusBL = self.cornerBottomLeftRadius
		let cornerRadiusBR = self.cornerBottomRightRadius

		if (cornerRadiusTL > 0 || cornerRadiusTR > 0 ||
			cornerRadiusBL > 0 || cornerRadiusBR > 0) {

			self.shape.path = CGOuterRoundedRectPath(
				layerW,
				layerH,
				cornerRadiusTL,
				cornerRadiusTR,
				cornerRadiusBL,
				cornerRadiusBR
			)

			self.mask = self.shape
			self.shouldRasterize = true

		} else {

			self.mask = nil
			self.shouldRasterize = false

			/*
			 * The shape path must be set after the mask is cleared. Setting
			 * the path during an animation will trigger the
			 * willBeginShapeAnimation method that might set a mask that will
			 * be active for the duration of the animation only.
			 */

			self.shape.path = CGOuterRoundedRectPath(
				layerW,
				layerH,
				0.001,
				0.001,
				0.001,
				0.001
			)
		}
	}

	/**
	 * @inherited
	 * @method willAnimate
	 * @since 0.1.0
	 */
	override open func willAnimate(layer: CALayer, property: String) {
		if (property == "path") {
			self.mask = self.shape
			self.shouldRasterize = false
		}
	}

	/**
	 * @inherited
	 * @method didBeginTransition
	 * @since 0.1.0
	 */
	override open func didBeginTransition(layer: CALayer) {

	}

	/**
	 * @inherited
	 * @method didCommitTransition
	 * @since 0.1.0
	 */
	override open func didCommitTransition(layer: CALayer) {

	}

	/**
	 * @inherited
	 * @method didFinishTransition
	 * @since 0.1.0
	 */
	override open func didFinishTransition(layer: CALayer) {

		if (self.cornerTopLeftRadius > 0 ||
			self.cornerTopRightRadius > 0 ||
			self.cornerBottomLeftRadius > 0 ||
			self.cornerBottomRightRadius > 0) {
			self.shouldRasterize = true
			return
		}

		/*
		 * Rasterization suring animation was turned off for performance
		 * reasons so it can be turned on now. Also, a mask was applied even
		 * if the radius was zero (to animate to 0) so it can be removed.
		 */

		self.mask = nil
		self.shouldRasterize = false
	}
}

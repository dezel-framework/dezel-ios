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

		if (key == "borderTopLeftRadius" ||
			key == "borderTopRightRadius" ||
			key == "borderBottomLeftRadius" ||
			key == "borderBottomRightRadius") {
			return true
		}

		return super.needsDisplay(forKey: key)
	}

	//--------------------------------------------------------------------------
	// MARK: Properties
	//--------------------------------------------------------------------------

	/**
	 * The layer's top left border radius.
	 * @property borderTopLeftRadius
	 * @since 0.1.0
	 */
	@NSManaged public var borderTopLeftRadius: CGFloat

	/**
	 * The layer's top right border radius.
	 * @property borderTopRightRadius
	 * @since 0.1.0
	 */
	@NSManaged public var borderTopRightRadius: CGFloat

	/**
	 * The layer's bottom left border radius.
	 * @property borderBottomLeftRadius
	 * @since 0.1.0
	 */
	@NSManaged public var borderBottomLeftRadius: CGFloat

	/**
	 * The layer's bottom right border radius.
	 * @property borderBottomRightRadius
	 * @since 0.1.0
	 */
	@NSManaged public var borderBottomRightRadius: CGFloat

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
			self.borderTopLeftRadius = layer.borderTopLeftRadius
			self.borderTopRightRadius = layer.borderTopRightRadius
			self.borderBottomLeftRadius = layer.borderBottomLeftRadius
			self.borderBottomRightRadius = layer.borderBottomRightRadius
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

		let borderRadiusTL = self.borderTopLeftRadius
		let borderRadiusTR = self.borderTopRightRadius
		let borderRadiusBL = self.borderBottomLeftRadius
		let borderRadiusBR = self.borderBottomRightRadius

		if (borderRadiusTL > 0 || borderRadiusTR > 0 ||
			borderRadiusBL > 0 || borderRadiusBR > 0) {

			self.shape.path = CGOuterRoundedRectPath(
				layerW,
				layerH,
				borderRadiusTL,
				borderRadiusTR,
				borderRadiusBL,
				borderRadiusBR
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

		if (self.borderTopLeftRadius > 0 ||
			self.borderTopRightRadius > 0 ||
			self.borderBottomLeftRadius > 0 ||
			self.borderBottomRightRadius > 0) {
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

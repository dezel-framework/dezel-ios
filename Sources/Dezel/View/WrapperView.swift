import UIKit

/**
 * @class WrapperView
 * @super UIView
 * @since 0.1.0
 */
open class WrapperView: UIView, Animatable {

	//--------------------------------------------------------------------------
	// MARK: Layer Class
	//--------------------------------------------------------------------------

	/**
	 * @property layerClass
	 * @since 0.1.0
	 * @hidden
	 */
	open override class var layerClass: AnyClass {
		return Layer.self
	}

	//--------------------------------------------------------------------------
	// MARK: Properties
	//--------------------------------------------------------------------------

	/**
	 * @inherited
	 * @property bounds
	 * @since 0.1.0
	 */
	override open var bounds: CGRect {
		willSet {
			self.renderLayer.resize(newValue)
			self.borderLayer.resize(newValue)
			self.shadowLayer.resize(newValue)
			self.backgroundImageLayer.resize(newValue)
			self.backgroundColorLayer.resize(newValue)
			self.invalidateFrame()
			self.invalidateShape()
		}
	}

	/**
	 * The wrapper's content view.
	 * @property content
	 * @since 0.1.0
	 */
	open var content: UIView

	/**
	 * The wrapper's background color.
	 * @property backgroundColor
	 * @since 0.1.0
	 */
	open override var backgroundColor: UIColor? {

		set {
			self.renderLayer.backgroundColor = newValue?.cgColor
		}

		get {
			return UIColor(color: self.renderLayer.backgroundColor)
		}
	}

	/**
	 * The wrapper's background linear gradient.
	 * @property backgroundLinearGradient
	 * @since 0.1.0
	 */
	open var backgroundLinearGradient: LinearGradient? {
		willSet {
			self.backgroundColorLayer.linearGradient = newValue
		}
	}

	/**
	 * The wrapper's background radial gradient.
	 * @property backgroundRadialGradient
	 * @since 0.1.0
	 */
	open var backgroundRadialGradient: RadialGradient? {
		willSet {
			self.backgroundColorLayer.radialGradient = newValue
		}
	}

	/**
	 * The wrapper's background image.
	 * @property backgroundImage
	 * @since 0.1.0
	 */
	open var backgroundImage: UIImage? {
		willSet {
			self.backgroundImageLayer.image = newValue?.cgImage
		}
	}

	/**
	 * The wrapper's background image fit.
	 * @property backgroundImageFit
	 * @since 0.1.0
	 */
	open var backgroundImageFit: ImageFit = .cover {
		willSet {
			self.backgroundImageLayer.imageFit = newValue
		}
	}

	/**
	 * The wrapper's background image position.
	 * @property backgroundImagePosition
	 * @since 0.1.0
	 */
	open var backgroundImagePosition: ImagePosition = .middleCenter {
		willSet {
			self.backgroundImageLayer.imagePosition = newValue
		}
	}

	/**
	 * The wrapper's top border color.
	 * @property borderTopColor
	 * @since 0.1.0
	 */
	open var borderTopColor: UIColor = .black {
		willSet {
			self.borderLayer.borderTopColor = newValue.cgColor
		}
	}

	/**
	 * The wrapper's left border color.
	 * @property borderLeftColor
	 * @since 0.1.0
	 */
	open var borderLeftColor: UIColor = .black {
		willSet {
			self.borderLayer.borderLeftColor = newValue.cgColor
		}
	}

	/**
	 * The wrapper's right border color.
	 * @property borderRightColor
	 * @since 0.1.0
	 */
	open var borderRightColor: UIColor = .black {
		willSet {
			self.borderLayer.borderRightColor = newValue.cgColor
		}
	}

	/**
	 * The wrapper's bottom border color.
	 * @property borderBottomColor
	 * @since 0.1.0
	 */
	open var borderBottomColor: UIColor = .black {
		willSet {
			self.borderLayer.borderBottomColor = newValue.cgColor
		}
	}

	/**
	 * The wrapper's top border width.
	 * @property borderTopWidth
	 * @since 0.1.0
	 */
	open var borderTopWidth: CGFloat = 0 {
		willSet {
			self.borderLayer.borderTopWidth = newValue
			self.invalidateFrame()
			self.invalidateShape()
		}
	}

	/**
	 * The wrapper's left border width.
	 * @property borderLeftWidth
	 * @since 0.1.0
	 */
	open var borderLeftWidth: CGFloat = 0 {
		willSet {
			self.borderLayer.borderLeftWidth = newValue
			self.invalidateFrame()
			self.invalidateShape()
		}
	}

	/**
	 * The wrapper's right border width.
	 * @property borderRightWidth
	 * @since 0.1.0
	 */
	open var borderRightWidth: CGFloat = 0 {
		willSet {
			self.borderLayer.borderRightWidth = newValue
			self.invalidateFrame()
			self.invalidateShape()
		}
	}

	/**
	 * The wrapper's bottom border width.
	 * @property borderBottomWidth
	 * @since 0.1.0
	 */
	open var borderBottomWidth: CGFloat = 0 {
		willSet {
			self.borderLayer.borderBottomWidth = newValue
			self.invalidateFrame()
			self.invalidateShape()
		}
	}

	/**
	 * The wrapper's top left border radius.
	 * @property cornerTopLeftRadius
	 * @since 0.1.0
	 */
	open var cornerTopLeftRadius: CGFloat = 0 {
		willSet {
			self.invalidateShape()
		}
	}

	/**
	 * The wrapper's top right border radius.
	 * @property cornerTopRightRadius
	 * @since 0.1.0
	 */
	open var cornerTopRightRadius: CGFloat = 0 {
		willSet {
			self.invalidateShape()
		}
	}

	/**
	 * The wrapper's bottom left border radius.
	 * @property cornerBottomLeftRadius
	 * @since 0.1.0
	 */
	open var cornerBottomLeftRadius: CGFloat = 0 {
		willSet {
			self.invalidateShape()
		}
	}

	/**
	 * The wrapper's bottom right border radius.
	 * @property cornerBottomRightRadius
	 * @since 0.1.0
	 */
	open var cornerBottomRightRadius: CGFloat = 0 {
		willSet {
			self.invalidateShape()
		}
	}

	/**
	 * The wrapper's shadow blur.
	 * @property shadowBlur
	 * @since 0.1.0
	 */
	open var shadowBlur: CGFloat = 0 {
		willSet {
			self.shadowLayer.shadowBlur = newValue
		}
	}

	/**
	 * The wrapper's shadow color.
	 * @property shadowColor
	 * @since 0.1.0
	 */
	open var shadowColor: UIColor = .clear {
		willSet {
			self.shadowLayer.shadowColor = newValue.cgColor
		}
	}

	/**
	 * The wrapper's shadow top offset.
	 * @property shadowOffsetTop
	 * @since 0.1.0
	 */
	open var shadowOffsetTop: CGFloat = 0 {
		willSet {
			self.shadowLayer.shadowOffsetTop = newValue
		}
	}

	/**
	 * The wrapper's shadow left offset.
	 * @property shadowOffsetLeft
	 * @since 0.1.0
	 */
	open var shadowOffsetLeft: CGFloat = 0 {
		willSet {
			self.shadowLayer.shadowOffsetLeft = newValue
		}
	}

	/**
	 * @property renderLayer
	 * @since 0.1.0
	 * @hidden
	 */
	internal var renderLayer: RenderLayer = RenderLayer()

	/**
	 * @property borderLayer
	 * @since 0.1.0
	 * @hidden
	 */
	internal var borderLayer: BorderLayer = BorderLayer()

	/**
	 * @property shadowLayer
	 * @since 0.1.0
	 * @hidden
	 */
	internal var shadowLayer: ShadowLayer = ShadowLayer()

	/**
	 * @property backgroundColorLayer
	 * @since 0.1.0
	 * @hidden
	 */
	internal var backgroundColorLayer: BackgroundColorLayer = BackgroundColorLayer()

	/**
	 * @property backgroundImageLayer
	 * @since 0.1.0
	 * @hidden
	 */
	internal var backgroundImageLayer: BackgroundImageLayer = BackgroundImageLayer()

	/**
	 * @property shape
	 * @since 0.1.0
	 * @hidden
	 */
	private var shape: ShapeLayer = ShapeLayer()

	/**
	 * @property invalidFrame
	 * @since 0.1.0
	 * @hidden
	 */
	private var invalidFrame: Bool = false

	/**
	 * @property invalidShape
	 * @since 0.1.0
	 * @hidden
	 */
	private var invalidShape: Bool = false

	/**
	 * @property animatesBorderLayer
	 * @since 0.1.0
	 * @hidden
	 */
	private var animatesBorderLayer: Bool = false

	/**
	 * @property animatesShadowLayer
	 * @since 0.1.0
	 * @hidden
	 */
	private var animatesShadowLayer: Bool = false

	/**
	 * @property animatesBackgroundColorLayer
	 * @since 0.1.0
	 * @hidden
	 */
	private var animatesBackgroundColorLayer: Bool = false

	/**
	 * @property animatesBackgroundImageLayer
	 * @since 0.1.0
	 * @hidden
	 */
	private var animatesBackgroundImageLayer: Bool = false

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
	 * Initializes the wrapper.
	 * @constructor
	 * @since 0.1.0
	 */
	public required init(content: UIView) {

		self.content = content

		super.init(frame: .zero)

		self.layer.addSublayer(self.shadowLayer)
		self.layer.addSublayer(self.renderLayer)

		self.shape.listener = self

		self.renderLayer.listener = self
		self.borderLayer.listener = self
		self.shadowLayer.listener = self
		self.backgroundColorLayer.listener = self
		self.backgroundImageLayer.listener = self

		self.borderLayer.borderTopColor = .black
		self.borderLayer.borderLeftColor = .black
		self.borderLayer.borderRightColor = .black
		self.borderLayer.borderBottomColor = .black

		self.addSubview(content)
	}

	/**
	 * Updates the visual appearance of the wrapper.
	 * @method update
	 * @since 0.1.0
	 */
	open func update() {

		if (self.invalidFrame) {
			self.invalidFrame = false
			self.updateFrame()
		}

		if (self.invalidShape) {
			self.invalidShape = false
			self.updateShape()
		}

		let needsShadowLayer = self.needsShadowLayer()
		let needsBorderLayer = self.needsBorderLayer()
		let needsBackgroundImageLayer = self.needsBackgroundImageLayer()
		let needsBackgroundColorLayer = self.needsBackgroundColorLayer()

		self.renderLayer.update()

		if (needsShadowLayer) {
			self.shadowLayer.update()
		}

		if (needsBorderLayer) {
			self.borderLayer.update()
		}

		if (needsBackgroundColorLayer) {
			self.backgroundColorLayer.update()
		}

		if (needsBackgroundImageLayer) {
			self.backgroundImageLayer.update()
		}

		self.toggleShadowLayer(needsShadowLayer)
		self.toggleBackgroundImageLayer(needsBackgroundImageLayer)
		self.toggleBackgroundColorLayer(needsBackgroundColorLayer)
		self.toggleBorderLayer(needsBorderLayer)
	}

	/**
	 * Updates the wrapper's frame.
	 * @method updateFrame
	 * @since 0.1.0
	 */
	open func updateFrame() {

		let borderWidthT = self.borderTopWidth
		let borderWidthL = self.borderLeftWidth
		let borderWidthR = self.borderRightWidth
		let borderWidthB = self.borderBottomWidth

		let x = borderWidthL
		let y = borderWidthT
		let w = self.bounds.width - borderWidthL - borderWidthR
		let h = self.bounds.height - borderWidthT - borderWidthB

		let center = CGPoint(
			x: x + w / 2,
			y: y + h / 2
		)

		let bounds = CGRect(
			x: 0,
			y: 0,
			width: w,
			height: h
		)

		self.content.center = center
		self.content.bounds = bounds

		if let content = self.content as? Resizable {

			let frame = CGRect(
				x: x,
				y: y,
				width: w,
				height: h
			)

			content.didResize(frame: frame)
		}
	}

	/**
	 * Updates the wrapper's shape.
	 * @method updateShape
	 * @since 0.1.0
	 */
	open func updateShape() {

		let borderWidthT = self.borderTopWidth
		let borderWidthL = self.borderLeftWidth
		let borderWidthR = self.borderRightWidth
		let borderWidthB = self.borderBottomWidth

		let shapeW = self.bounds.width
		let shapeH = self.bounds.height

		var outerTL = self.cornerTopLeftRadius
		var outerTR = self.cornerTopRightRadius
		var outerBL = self.cornerBottomLeftRadius
		var outerBR = self.cornerBottomRightRadius

		let maxRadius = (min(shapeW, shapeH) / 2.0)

		if (outerTL > maxRadius) { outerTL = maxRadius }
		if (outerTR > maxRadius) { outerTR = maxRadius }
		if (outerBL > maxRadius) { outerBL = maxRadius }
		if (outerBR > maxRadius) { outerBR = maxRadius }

		var innerRadiusTLY = max(outerTL - borderWidthT, 0)
		var innerRadiusTLX = max(outerTL - borderWidthL, 0)
		var innerRadiusTRY = max(outerTR - borderWidthT, 0)
		var innerRadiusTRX = max(outerTR - borderWidthR, 0)
		var innerRadiusBLY = max(outerBL - borderWidthB, 0)
		var innerRadiusBLX = max(outerBL - borderWidthL, 0)
		var innerRadiusBRY = max(outerBR - borderWidthB, 0)
		var innerRadiusBRX = max(outerBR - borderWidthR, 0)

		if (innerRadiusTLY == 0 || innerRadiusTLX == 0) {
			innerRadiusTLY = 0
			innerRadiusTLX = 0
		}

		if (innerRadiusTRY == 0 || innerRadiusTRX == 0) {
			innerRadiusTRY = 0
			innerRadiusTRX = 0
		}

		if (innerRadiusBLY == 0 || innerRadiusBLX == 0) {
			innerRadiusBLY = 0
			innerRadiusBLX = 0
		}

		if (innerRadiusBRY == 0 || innerRadiusBRX == 0) {
			innerRadiusBRY = 0
			innerRadiusBRX = 0
		}

		var innerTLX: CGFloat = 0
		var innerTLY: CGFloat = 0
		var innerTRX: CGFloat = 0
		var innerTRY: CGFloat = 0
		var innerBRX: CGFloat = 0
		var innerBRY: CGFloat = 0
		var innerBLX: CGFloat = 0
		var innerBLY: CGFloat = 0

		if (borderWidthT == 0) {
			innerTRX = innerRadiusTRX
			innerTLX = innerRadiusTLX
		}

		if (borderWidthL == 0) {
			innerTLY = innerRadiusTLY
			innerBLY = innerRadiusBLY
		}

		if (borderWidthR == 0) {
			innerTRY = innerRadiusTRY
			innerBRY = innerRadiusBRY
		}

		if (borderWidthB == 0) {
			innerBRX = innerRadiusBRX
			innerBLX = innerRadiusBLX
		}

		if (borderWidthT > 0 && borderWidthL > 0) {
			if (borderWidthT > borderWidthL) {
				innerTLX = innerRadiusTLY * (borderWidthL / borderWidthT)
				innerTLY = innerRadiusTLY
			} else {
				innerTLX = innerRadiusTLX
				innerTLY = innerRadiusTLX * (borderWidthT / borderWidthL)
			}
		}

		if (borderWidthT > 0 && borderWidthR > 0) {
			if (borderWidthT > borderWidthR) {
				innerTRX = innerRadiusTRY * (borderWidthR / borderWidthT)
				innerTRY = innerRadiusTRY
			} else {
				innerTRX = innerRadiusTRX
				innerTRY = innerRadiusTRX * (borderWidthT / borderWidthR)
			}
		}

		if (borderWidthB > 0 && borderWidthR > 0) {
			if (borderWidthB > borderWidthR) {
				innerBRX = innerRadiusBRY * (borderWidthR / borderWidthB)
				innerBRY = innerRadiusBRY
			} else {
				innerBRX = innerRadiusBRX
				innerBRY = innerRadiusBRX * (borderWidthB / borderWidthR)
			}
		}

		if (borderWidthB > 0 && borderWidthL > 0) {
			if (borderWidthB > borderWidthL) {
				innerBLX = innerRadiusBLY * (borderWidthL / borderWidthB)
				innerBLY = innerRadiusBLY
			} else {
				innerBLX = innerRadiusBLX
				innerBLY = innerRadiusBLX * (borderWidthB / borderWidthL)
			}
		}

		let innerTL = CGPoint(x: innerTLX, y: innerTLY)
		let innerTR = CGPoint(x: innerTRX, y: innerTRY)
		let innerBL = CGPoint(x: innerBLX, y: innerBLY)
		let innerBR = CGPoint(x: innerBRX, y: innerBRY)

		self.shadowLayer.cornerTopLeftRadius = outerTL
		self.shadowLayer.cornerTopRightRadius = outerTR
		self.shadowLayer.cornerBottomLeftRadius = outerBL
		self.shadowLayer.cornerBottomRightRadius = outerBR

		self.renderLayer.cornerTopLeftRadius = outerTL
		self.renderLayer.cornerTopRightRadius = outerTR
		self.renderLayer.cornerBottomLeftRadius = outerBL
		self.renderLayer.cornerBottomRightRadius = outerBR

		self.borderLayer.cornerTopLeftRadius = outerTL
		self.borderLayer.cornerTopRightRadius = outerTR
		self.borderLayer.cornerBottomLeftRadius = outerBL
		self.borderLayer.cornerBottomRightRadius = outerBR

		self.borderLayer.cornerTopLeftInnerRadius = innerTL
		self.borderLayer.cornerTopRightInnerRadius = innerTR
		self.borderLayer.cornerBottomLeftInnerRadius = innerBL
		self.borderLayer.cornerBottomRightInnerRadius = innerBR

		if (self.content is Clippable == false) {
			return
		}

		let contentW = self.frame.width - borderWidthL - borderWidthR
		let contentH = self.frame.height - borderWidthT - borderWidthB

		if (innerTL != .zero || innerTR != .zero ||
			innerBL != .zero || innerBR != .zero) {

			let path = CGMutablePath()

			path.addRoundedRect(CGRect(
				x: 0,
				y: 0,
				width: contentW,
				height: contentH
			), [
				innerTR.x, innerTR.y,
				innerBR.x, innerBR.y,
				innerBL.x, innerBL.y,
				innerTL.x, innerTL.y
			])

			self.shape.path = path

			self.content.layer.mask = self.shape
			self.content.layer.shouldRasterize = true

		} else {

			self.content.layer.mask = nil
			self.content.layer.shouldRasterize = false

			/*
			 * The shape path must be set after the mask is cleared. Setting
			 * the path during an animation will trigger the
			 * willBeginShapeAnimation method that might set a mask that will
			 * be active for the duration of the animation only.
			 */

			self.shape.path = CGOuterRoundedRectPath(
				contentW,
				contentH,
				0.001,
				0.001,
				0.001,
				0.001
			)
		}
	}

	/**
	 * @method scheduleRedraw
	 * @since 0.1.0
	 * @hidden
	 */
	open func scheduleRedraw() {

	}

	//--------------------------------------------------------------------------
	// MARK: Transition Listener
	//--------------------------------------------------------------------------

	/**
	 * @inherited
	 * @method willAnimate
	 * @since 0.1.0
	 */
	open func willAnimate(layer: CALayer, property: String) {

		if (property == "backgroundColor") {
			self.animatesBackgroundColorLayer = true
			return
		}

		if (property == "borderTopWidth" ||
			property == "borderTopColor" ||
			property == "borderLeftWidth" ||
			property == "borderLeftColor" ||
			property == "borderRightWidth" ||
			property == "borderRightColor" ||
			property == "borderBottomWidth" ||
			property == "borderBottomColor") {
			self.animatesBorderLayer = true
			return
		}

		if (property == "shadowBlur" ||
			property == "shadowColor" ||
			property == "shadowOffsetTop" ||
			property == "shadowOffsetLeft") {
			self.animatesShadowLayer = true
			return
		}

		if (property == "path") {
			self.content.layer.mask = self.shape
			self.content.layer.shouldRasterize = false
		}
	}

	/**
	 * @inherited
	 * @method didBeginTransition
	 * @since 0.1.0
	 */
	open func didBeginTransition(layer: CALayer) {

	}

	/**
	 * @inherited
	 * @method didCommitTransition
	 * @since 0.1.0
	 */
	open func didCommitTransition(layer: CALayer) {

	}

	/**
	 * @inherited
	 * @method didFinishTransition
	 * @since 0.1.0
	 */
	open func didFinishTransition(layer: CALayer) {

		self.animatesBackgroundImageLayer = false
		self.animatesBackgroundColorLayer = false
		self.animatesBorderLayer = false
		self.animatesShadowLayer = false

		self.toggleShadowLayer(self.needsShadowLayer())
		self.toggleBackgroundImageLayer(self.needsBackgroundImageLayer())
		self.toggleBorderLayer(self.needsBorderLayer())

		if (self.borderLayer.cornerTopLeftInnerRadius != .zero ||
			self.borderLayer.cornerTopRightInnerRadius != .zero ||
			self.borderLayer.cornerBottomLeftInnerRadius != .zero ||
			self.borderLayer.cornerBottomRightInnerRadius != .zero) {
			self.content.layer.shouldRasterize = true
			return
		}

		/*
		 * Rasterization during animation was turned off for performance
		 * reasons and can be turned on now. Also, a mask was applied even
		 * if the radius was zero (to animate to 0) and it can be removed.
		 */

		self.content.layer.mask = nil
		self.content.layer.shouldRasterize = false
	}

	//--------------------------------------------------------------------------
	// MARK: Private API
	//--------------------------------------------------------------------------

	/**
	 * @method invalidateFrame
	 * @since 0.1.0
	 * @hidden
	 */
	private func invalidateFrame() {
		self.invalidFrame = true
	}

	/**
	 * @method invalidateShape
	 * @since 0.1.0
	 * @hidden
	 */
	private func invalidateShape() {
		self.invalidShape = true
	}

	/**
	 * @method hasShadow
	 * @since 0.1.0
	 * @hidden
	 */
	private func hasShadow() -> Bool {
		return self.shadowColor.alpha > 0 && (self.shadowBlur > 0 || self.shadowOffsetTop > 0 || self.shadowOffsetLeft > 0)
	}

	/**
	 * @method hasBorder
	 * @since 0.1.0
	 * @hidden
	 */
	private func hasBorder() -> Bool {

		if (self.borderTopColor.alpha > 0 &&
			self.borderTopWidth > 0) {
			return true
		}

		if (self.borderLeftColor.alpha > 0 &&
			self.borderLeftWidth > 0) {
			return true
		}

		if (self.borderRightColor.alpha > 0 &&
			self.borderRightWidth > 0) {
			return true
		}

		if (self.borderBottomColor.alpha > 0 &&
			self.borderBottomWidth > 0) {
			return true
		}

		return false
	}

	/**
	 * @method hasBackgroundColor
	 * @since 0.1.0
	 * @hidden
	 */
	public func hasBackgroundColor() -> Bool {
		return self.backgroundColor != nil || self.backgroundLinearGradient != nil || self.backgroundRadialGradient != nil
	}

	/**
	 * @method hasBackgroundImage
	 * @since 0.1.0
	 * @hidden
	 */
	private func hasBackgroundImage() -> Bool {
		return self.backgroundImage != nil
	}

	/**
	 * @method needsShadowLayer
	 * @since 0.1.0
	 * @hidden
	 */
	private func needsShadowLayer() -> Bool {
		return self.animatesShadowLayer || self.hasShadow()
	}

	/**
	 * @method needsBorderLayer
	 * @since 0.1.0
	 * @hidden
	 */
	private func needsBorderLayer() -> Bool {
		return self.animatesBorderLayer || self.hasBorder()
	}

	/**
	 * @method needsBackgroundColorLayer
	 * @since 0.1.0
	 * @hidden
	 */
	private func needsBackgroundColorLayer() -> Bool {
		return self.animatesBackgroundColorLayer || self.hasBackgroundColor()
	}

	/**
	 * @method needsBackgroundImageLayer
	 * @since 0.1.0
	 * @hidden
	 */
	private func needsBackgroundImageLayer() -> Bool {
		return self.animatesBackgroundImageLayer || self.hasBackgroundImage()
	}

	/**
	 * @method needsCanvasLayer
	 * @since 0.1.0
	 * @hidden
	 */
	private func needsCanvasLayer() -> Bool {
		return false
	}

	/**
	 * @method toggleShadowLayer
	 * @since 0.1.0
	 * @hidden
	 */
	private func toggleShadowLayer(_ toggle: Bool) {
		self.toggleLayer(self.shadowLayer, toggle: toggle, at: 1, in: self.layer)
	}

	/**
	 * @method toggleBackgroundColorLayer
	 * @since 0.1.0
	 * @hidden
	 */
	private func toggleBackgroundColorLayer(_ toggle: Bool) {
		self.toggleLayer(self.backgroundImageLayer, toggle: toggle, at: 0, in: self.renderLayer)
	}

	/**
	 * @method toggleBackgroundImageLayer
	 * @since 0.1.0
	 * @hidden
	 */
	private func toggleBackgroundImageLayer(_ toggle: Bool) {
		self.toggleLayer(self.backgroundImageLayer, toggle: toggle, at: 1, in: self.renderLayer)
	}

	/**
	 * @method toggleBorderLayer
	 * @since 0.1.0
	 * @hidden
	 */
	private func toggleBorderLayer(_ toggle: Bool) {
		self.toggleLayer(self.borderLayer, toggle: toggle, at: 2, in: self.renderLayer)
	}

	/**
	 * @method toggleLayer
	 * @since 0.1.0
	 * @hidden
	 */
	private func toggleLayer(_ layer: CALayer, toggle: Bool, at: Int, in parent: CALayer) {

		if (toggle) {

			if (layer.superlayer == nil) {
				parent.insertLayer(layer, at: at)
			}

		} else {

			if (layer.superlayer == parent) {
				parent.removeLayer(layer)
			}
		}
	}
}

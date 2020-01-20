import UIKit

/**
 * @class ImageView
 * @super UIView
 * @since 0.1.0
 */
open class ImageView: UIView, Updatable, Clippable {

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
			self.invalidImageFrame = true
		}
	}

	/**
	 * The image view's image.
	 * @property image
	 * @since 0.1.0
	 */
	open var image: UIImage? {
		willSet {
			self.imageLayer.image = newValue?.cgImage
		}
	}

	/**
	 * The image view's image fit.
	 * @property imageFit
	 * @since 0.1.0
	 */
	open var imageFit: ImageFit = .contain {
		willSet {
			self.imageLayer.imageFit = newValue
		}
	}

	/**
	 * The image view's image position.
	 * @property imagePosition
	 * @since 0.1.0
	 */
	open var imagePosition: ImagePosition = .middleCenter {
		willSet {
			self.imageLayer.imagePosition = newValue
		}
	}

	/**
	 * The image view's top padding.
	 * @property paddingTop
	 * @since 0.1.0
	 */
	open var paddingTop: CGFloat = 0 {
		willSet {
			self.invalidImageFrame = true
		}
	}

	/**
	 * The image view's left padding.
	 * @property paddingLeft
	 * @since 0.1.0
	 */
	open var paddingLeft: CGFloat = 0 {
		willSet {
			self.invalidImageFrame = true
		}
	}

	/**
	 * The image view's right padding.
	 * @property paddingRight
	 * @since 0.1.0
	 */
	open var paddingRight: CGFloat = 0 {
		willSet {
			self.invalidImageFrame = true
		}
	}

	/**
	 * The image view's bottom padding.
	 * @property paddingBottom
	 * @since 0.1.0
	 */
	open var paddingBottom: CGFloat = 0 {
		willSet {
			self.invalidImageFrame = true
		}
	}

	/**
	 * The image view's tint.
	 * @property tint
	 * @since 0.1.0
	 */
	open var tint: UIColor = .clear {
		willSet {
			self.imageLayer.tint = newValue.cgColor
		}
	}

	/**
	 * @property imageLayer
	 * @since 0.1.0
	 * @hidden
	 */
	private var imageLayer: ImageLayer = ImageLayer()

	/**
	 * @property invalidImageFrame
	 * @since 0.1.0
	 * @hidden
	 */
	private var invalidImageFrame: Bool = false

	//----------------------------------------------------------------------
	// MARK: Methods
	//----------------------------------------------------------------------

	/**
	 * @constructor
	 * @since 0.1.0
	 * @hidden
	 */
	required public init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	/**
	 * Initializes the image view.
	 * @constructor
	 * @since 0.1.0
	 */
	public override init(frame: CGRect) {
		super.init(frame: frame)
		self.imageLayer.frame = frame
		self.layer.addSublayer(self.imageLayer)
	}

	/**
	 * Measures the image view's intrinsic size.
	 * @method measure
	 * @since 0.1.0
	 */
	open func measure(bounds: CGSize, min: CGSize, max: CGSize) -> CGSize {

		guard let image = self.image else {
			return .zero
		}

		let frameW = bounds.width
		let frameH = bounds.height
		let imageW = image.size.width
		let imageH = image.size.height

		let scaleW = imageW / imageH
		let scaleH = imageH / imageW

		if (frameW == 0 &&
			frameH == 0) {
			return CGSize(width: imageW, height: imageH).clamp(min: min, max: max)
		}

		if (frameW == 0) { return CGSize(width: frameH * scaleW, height: frameH).clamp(min: min, max: max) }
		if (frameH == 0) { return CGSize(width: frameW, height: frameW * scaleH).clamp(min: min, max: max) }

		return bounds
	}

	/**
	 * Updates the image view's visual properties.
	 * @method update
	 * @since 0.1.0
	 */
	open func update() {

		if (self.invalidImageFrame) {
			self.invalidImageFrame = false
			self.updateImageFrame()
		}

		self.imageLayer.update()
	}

	/**
	 * Update the image view's image frame.
	 * @method updateImageFrame
	 * @since 0.1.0
	 */
	open func updateImageFrame() {

		let paddingT = self.paddingTop
		let paddingL = self.paddingLeft
		let paddingR = self.paddingRight
		let paddingB = self.paddingBottom

		var bounds = self.bounds
		bounds.size.width = bounds.size.width - paddingL - paddingR
		bounds.size.height = bounds.size.height - paddingT - paddingB
		bounds.origin.x = paddingL
		bounds.origin.y = paddingT

		self.imageLayer.frame = bounds
	}
}

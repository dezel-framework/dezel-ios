import UIKit

/**
 * @class TextView
 * @super UIView
 * @since 0.1.0
 */
open class TextView: UIView, Updatable, Clippable {

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

	//----------------------------------------------------------------------
	// MARK: Properties
	//----------------------------------------------------------------------

	/**
	 * @overridden
	 * @property bounds
	 * @since 0.1.0
	 */
	override open var bounds: CGRect {
		willSet {
			self.invalidTextFrame = true
		}
	}

	/**
	 * The text view's font family.
	 * @property fontFamily
	 * @since 0.1.0
	 */
	open var fontFamily: String = "default" {
		willSet {
			self.textLayer.fontFamily = newValue
		}
	}

	/**
	 * The text view's font weight.
	 * @property fontWeight
	 * @since 0.1.0
	 */
	open var fontWeight: String = "normal" {
		willSet {
			self.textLayer.fontWeight = newValue
		}
	}

	/**
	 * The text view's font style.
	 * @property fontStyle
	 * @since 0.1.0
	 */
	open var fontStyle: String = "normal" {
		willSet {
			self.textLayer.fontStyle = newValue
		}
	}

	/**
	 * The text view's font size.
	 * @property fontSize
	 * @since 0.1.0
	 */
	open var fontSize: CGFloat = 17 {
		willSet {
			self.textLayer.fontSize = newValue
		}
	}

	/**
	 * The text view's text.
	 * @property text
	 * @since 0.1.0
	 */
	open var text: String = "" {
		willSet {
			self.textLayer.text = newValue
		}
	}

	/**
	 * The text view's text color.
	 * @property textColor
	 * @since 0.1.0
	 */
	open var textColor: UIColor = .black {
		willSet {
			self.textLayer.textColor = newValue.cgColor
		}
	}

	/**
	 * The text view's text align.
	 * @property textAlign
	 * @since 0.1.0
	 */
	open var textAlign: TextAlign = .middleLeft {
		willSet {
			self.textLayer.textAlign = newValue
		}
	}

	/**
	 * The text view's text baseline.
	 * @property textBaseline
	 * @since 0.1.0
	 */
	open var textBaseline: CGFloat = 0 {
		willSet {
			self.textLayer.textBaseline = newValue
		}
	}

	/**
	 * The text view's text kerning.
	 * @property textKerning
	 * @since 0.1.0
	 */
	open var textKerning: CGFloat = 0 {
		willSet {
			self.textLayer.textKerning = newValue
		}
	}

	/**
	 * The text view's text leading.
	 * @property textLeading
	 * @since 0.1.0
	 */
	open var textLeading: CGFloat = 0 {
		willSet {
			self.textLayer.textLeading = newValue
		}
	}

	/**
	 * The text view's text shadow blur.
	 * @property textShadowBlur
	 * @since 0.1.0
	 */
	open var textShadowBlur: CGFloat = 0 {
		willSet {
			self.textLayer.shadowRadius = newValue / CGFloat(Double.pi)
		}
	}

	/**
	 * The text view's text shadow color.
	 * @property textShadowColor
	 * @since 0.1.0
	 */
	open var textShadowColor: UIColor = .black {
		willSet {
			self.textLayer.shadowColor = newValue.cgColor
		}
	}

	/**
	 * The text view's text top shadow offset.
	 * @property textShadowOffsetTop
	 * @since 0.1.0
	 */
	open var textShadowOffsetTop: CGFloat = 0 {
		willSet {
			self.textLayer.shadowOffset = self.textLayer.shadowOffset.setTop(newValue)
		}
	}

	/**
	 * The text view's text left shadow offset.
	 * @property textShadowOffsetLeft
	 * @since 0.1.0
	 */
	open var textShadowOffsetLeft: CGFloat = 0 {
		willSet {
			self.textLayer.shadowOffset = self.textLayer.shadowOffset.setLeft(newValue)
		}
	}

	/**
	 * The text view's text decoration.
	 * @property textDecoration
	 * @since 0.1.0
	 */
	open var textDecoration: TextDecoration = .none {
		willSet {
			self.textLayer.textDecoration = newValue
		}
	}

	/**
	 * The text view's text transform.
	 * @property textTransform
	 * @since 0.1.0
	 */
	open var textTransform: TextTransform = .none {
		willSet {
			self.textLayer.textTransform = newValue
		}
	}

	/**
	 * The text view's text overflow.
	 * @property textOverflow
	 * @since 0.1.0
	 */
	open var textOverflow: TextOverflow = .ellipsis {
		willSet {
			self.textLayer.textOverflow = newValue
		}
	}

	/**
	 * The text view's link color.
	 * @property linkColor
	 * @since 0.1.0
	 */
	open var linkColor: UIColor = .blue {
		willSet {
			self.textLayer.linkColor = newValue
		}
	}

	/**
	 * The text view's link decoration.
	 * @property linkDecoration
	 * @since 0.1.0
	 */
	open var linkDecoration: TextDecoration = .underline {
		willSet {
			self.textLayer.linkDecoration = newValue
		}
	}

	/**
	 * The text view's maximum amount of lines.
	 * @property maxLines
	 * @since 0.1.0
	 */
	open var maxLines: Int = 0 {
		willSet {
			self.textLayer.maxLines = newValue
		}
	}

	/**
	 * The text view's top padding.
	 * @property paddingTop
	 * @since 0.1.0
	 */
	open var paddingTop: CGFloat = 0 {
		willSet {
			self.invalidTextFrame = true
		}
	}

	/**
 	 * The text view's left padding.
	 * @property paddingLeft
	 * @since 0.1.0
	 */
	open var paddingLeft: CGFloat = 0 {
		willSet {
			self.invalidTextFrame = true
		}
	}

	/**
	 * The text view's right padding.
	 * @property paddingRight
	 * @since 0.1.0
	 */
	open var paddingRight: CGFloat = 0 {
		willSet {
			self.invalidTextFrame = true
		}
	}

	/**
	 * The text view's bottom padding.
	 * @property paddingBottom
	 * @since 0.1.0
	 */
	open var paddingBottom: CGFloat = 0 {
		willSet {
			self.invalidTextFrame = true
		}
	}

	/**
	 * @property delegate
	 * @since 0.1.0
	 * @hidden
	 */
	private weak var observer: TextViewObserver?

	/**
	 * @property textLayer
	 * @since 0.1.0
	 * @hidden
	 */
	private let textLayer: TextLayer = TextLayer()

	/**
	 * @property invalidTextFrame
	 * @since 0.1.0
	 * @hidden
	 */
	private var invalidTextFrame: Bool = false

	//--------------------------------------------------------------------------
	// MARK: Methods
	//--------------------------------------------------------------------------

	/**
	 * @constructor
	 * @since 0.1.0
	 */
	public required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	/**
	 * Initializes the text view.
	 * @constructor
	 * @since 0.1.0
	 */
	public init(frame: CGRect, observer: TextViewObserver?) {

		super.init(frame: frame)

		self.layer.masksToBounds = true

		self.textLayer.frame = frame
		self.textLayer.textColor = .black
		self.textLayer.textKerning = 0
		self.textLayer.textLeading = 0
		self.textLayer.textBaseline = 0

		self.layer.addSublayer(self.textLayer)

		self.observer = observer
	}

	/**
	 * Measures the text view's intrinsic size.
	 * @method measure
	 * @since 0.1.0
	 */
	open func measure(bounds: CGSize, min: CGSize, max: CGSize) -> CGSize {

		let paddingT = self.paddingTop
		let paddingL = self.paddingLeft
		let paddingR = self.paddingRight
		let paddingB = self.paddingBottom

		var frame = bounds
		if (frame.width > 0) {

			frame.width -= paddingL
			frame.width -= paddingR

			if (frame.width < 0) {
				frame.width = 1
			}
		}

		if (frame.height > 0) {

			frame.height -= paddingT
			frame.height -= paddingB

			if (frame.height < 0) {
				frame.height = 1
			}
		}

		return self.textLayer.measure(size: frame, min: min, max: max)
	}

	/**
	 * Updates the text view's visual properties.
	 * @method update
	 * @since 0.1.0
	 */
	open func update() {

		if (self.invalidTextFrame) {
			self.invalidTextFrame = false
			self.updateTextFrame()
		}

		self.textLayer.update()
	}

	/**
	 * Updates the text view's text frame.
	 * @method updateTextFrame
	 * @since 0.1.0
	 */
	open func updateTextFrame() {

		let paddingT = self.paddingTop
		let paddingL = self.paddingLeft
		let paddingR = self.paddingRight
		let paddingB = self.paddingBottom

		var bounds = self.bounds
		bounds.size.width = bounds.size.width - paddingL - paddingR
		bounds.size.height = bounds.size.height - paddingT - paddingB
		bounds.origin.x = paddingL
		bounds.origin.y = paddingT

		self.textLayer.frame = bounds
	}

	//--------------------------------------------------------------------------
	// MARK: Private API
	//--------------------------------------------------------------------------

	/**
	 * @property trackedTouch
	 * @since 0.1.0
	 * @hidden
	 */
	private var trackedTouch: UITouch?

	/**
	 * @property trackedPoint
	 * @since 0.1.0
	 * @hidden
	 */
	private var trackedPoint: CGPoint = .zero

	/**
	 * @method touchesBegan
	 * @since 0.1.0
	 */
	override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

		guard let touch = touches.first else {
			return
		}

		if (self.trackedTouch == nil) {
			self.trackedTouch = touch
			self.trackedPoint = touch.location(in: self)
		}
	}

	/**
	 * @method touchesEnded
	 * @since 0.1.0
	 */
	override open func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {

		for touch in touches {

			if (self.trackedTouch == touch) {
				self.trackedTouch = nil

				let point = touch.location(in: self)

				if (abs(self.trackedPoint.x - point.x) > 10 ||
					abs(self.trackedPoint.y - point.y) > 10) {
					return
				}

				if let character = self.textLayer.string(at: point) {
					if let link = character.link {
						self.observer?.didPressLink(textView: self, url: link)
					}
				}
			}
		}
	}
}

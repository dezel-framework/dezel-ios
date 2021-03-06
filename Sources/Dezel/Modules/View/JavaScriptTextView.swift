import UIKit

/**
 * @class JavaScriptTextView
 * @super JavaScriptView
 * @since 0.1.0
 */
open class JavaScriptTextView: JavaScriptView, TextViewObserver {

	//--------------------------------------------------------------------------
	// MARK: Properties
	//--------------------------------------------------------------------------

	/**
	 * @property invalidFontSize
	 * @since 0.1.0
	 * @hidden
	 */
	private var invalidFontSize: Bool = false

	/**
	 * @property view
	 * @since 0.1.0
	 * @hidden
	 */
	private var view: TextView {
		return self.content as! TextView
	}

	//--------------------------------------------------------------------------
	// MARK: Methods
	//--------------------------------------------------------------------------

	/**
	 * @inherited
	 * @method createContentView
	 * @since 0.1.0
	 */
	override open func createContentView() -> TextView {
		return TextView(frame: .zero, observer: self)
	}

	/**
	 * @inherited
	 * @method measure
	 * @since 0.1.0
	 */
	override open func measure(bounds: CGSize, min: CGSize, max: CGSize) -> CGSize {

		if (self.invalidFontSize) {
			self.invalidFontSize = false
			self.updateFontSize()
		}

		return self.view.measure(bounds: bounds, min: min, max: max)
	}

	/**
	 * @inherited
	 * @method update
	 * @since 0.1.0
	 */
	override open func update() {

		super.update()

		if (self.invalidFontSize) {
			self.invalidFontSize = false
			self.updateFontSize()
		}
	}

	/**
	 * Updates the text view's font size.
	 * @method updateFontSize
	 * @since 0.1.0
	 */
	open func updateFontSize() {

		let value: CGFloat

		switch (self.fontSize.unit) {

			case .px: value = CGFloat(self.fontSize.number)
			case .vw: value = CGFloat(self.fontSize.number / 100 * self.node.display.viewportWidth)
			case .vh: value = CGFloat(self.fontSize.number / 100 * self.node.display.viewportHeight)

			default:
				value = CGFloat(self.fontSize.number)
				break
		}

		self.view.fontSize = value.clamp(
			CGFloat(self.minFontSize.number),
			CGFloat(self.maxFontSize.number)
		)

		if (self.node.isWrappingContentWidth ||
			self.node.isWrappingContentHeight) {
			self.node.invalidateSize()
		}
	}

	/**
	 * @inherited
	 * @method didResolvePadding
	 * @since 0.1.0
	 */
	override open func didResolvePadding(node: DisplayNode) {
		super.didResolvePadding(node: node)
		self.view.paddingTop = CGFloat(self.resolvedPaddingTop)
		self.view.paddingLeft = CGFloat(self.resolvedPaddingLeft)
		self.view.paddingRight = CGFloat(self.resolvedPaddingRight)
		self.view.paddingBottom = CGFloat(self.resolvedPaddingBottom)
	}

	/**
	 * Called when a link is pressed.
	 * @method didPressLink
	 * @since 0.1.0
	 */
	open func didPressLink(textView: TextView, url: String) {
		self.callMethod("nativeOnPressLink", arguments: [self.context.createString(url)])
	}

	//--------------------------------------------------------------------------
	// MARK: Private API
	//--------------------------------------------------------------------------

	/**
	 * @method invalidateFontSize
	 * @since 0.1.0
	 * @hidden
	 */
	private func invalidateFontSize() {
		if (self.invalidFontSize == false) {
			self.invalidFontSize = true
			self.scheduleUpdate()
		}
	}

	/**
	 * @method getTextAlign
	 * @since 0.1.0
	 * @hidden
	 */
	private func getTextAlign(_ value: String) -> TextAlign {

		switch (value) {

			case "top left":
				return .topLeft
			case "top right":
				return .topRight
			case "top center":
				return .topCenter

			case "left":
				return .middleLeft
			case "right":
				return .middleRight
			case "center":
				return .middleCenter

			case "bottom left":
				return .bottomLeft
			case "bottom right":
				return .bottomRight
			case "bottom center":
				return .bottomCenter

			default:
				NSLog("Unrecognized value for textAlign: \(value)")
		}

		return .middleLeft
	}

	/**
	 * @method getTextDecoration
	 * @since 0.1.0
	 * @hidden
	 */
	private func getTextDecoration(_ value: String) -> TextDecoration {

		switch (value) {

			case "none":
				return .none
			case "underline":
				return .underline

			default:
				NSLog("Unrecognized value for textDecoration: \(value)")
		}

		return .none
	}

	/**
	 * @method getTextTransform
	 * @since 0.1.0
	 * @hidden
	 */
	private func getTextTransform(_ value: String) -> TextTransform {

		switch (value) {

			case "none":
				return .none
			case "uppercase":
				return .uppercase
			case "lowercase":
				return .lowercase
			case "capitalize":
				return .capitalize

			default:
				NSLog("Unrecognized value for textTransform: \(value)")
		}

		return .none
	}

	/**
	 * @method getTextOverflow
	 * @since 0.1.0
	 * @hidden
	 */
	private func getTextOverflow(_ value: String) -> TextOverflow {

		switch (value) {

			case "clip":
				return .clip
			case "ellipsis":
				return .ellipsis

			default:
				NSLog("Unrecognized value for textOverflow: \(value)")
		}

		return .ellipsis
	}

	//--------------------------------------------------------------------------
	// MARK: JS Properties
	//--------------------------------------------------------------------------

	/**
	 * @property fontFamily
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open lazy var fontFamily = JavaScriptProperty(string: "default") { value in

		self.view.fontFamily = value.string

		if (self.node.isWrappingContentWidth ||
			self.node.isWrappingContentHeight) {
			self.node.invalidateSize()
		}
	}

	/**
	 * @property fontWeight
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open lazy var fontWeight = JavaScriptProperty(string: "normal") { value in

		self.view.fontWeight = value.string

		if (self.node.isWrappingContentWidth ||
			self.node.isWrappingContentHeight) {
			self.node.invalidateSize()
		}
	}

	/**
	 * @property fontStyle
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open lazy var fontStyle = JavaScriptProperty(string: "normal") { value in

		self.view.fontStyle = value.string

		if (self.node.isWrappingContentWidth ||
			self.node.isWrappingContentHeight) {
			self.node.invalidateSize()
		}
	}

	/**
	 * @property fontSize
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open lazy var fontSize = JavaScriptProperty(number: 17) { value in
		self.invalidateFontSize()
	}

	/**
	 * @property minFontSize
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open lazy var minFontSize = JavaScriptProperty(number: 0) { value in
		self.invalidateFontSize()
	}

	/**
	 * @property maxFontSize
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open lazy var maxFontSize = JavaScriptProperty(number: Double.max) { value in
		self.invalidateFontSize()
	}

	/**
	 * @property text
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open lazy var text = JavaScriptProperty(string: "") { value in

		self.view.text = value.string

		if (self.node.isWrappingContentWidth ||
			self.node.isWrappingContentHeight) {
			self.node.invalidateSize()
		}
	}

	/**
	 * @property textColor
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open lazy var textColor = JavaScriptProperty(string: "#000") { value in
		self.view.textColor = UIColor(color: value)
	}

	/**
	 * @property textAlign
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open lazy var textAlign = JavaScriptProperty(string: "left") { value in
		self.view.textAlign = self.getTextAlign(value.string)
	}

	/**
	 * @property textBaseline
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open lazy var textBaseline = JavaScriptProperty(number: 0) { value in

		self.view.textBaseline = CGFloat(value.number)

		if (self.node.isWrappingContentWidth ||
			self.node.isWrappingContentHeight) {
			self.node.invalidateSize()
		}
	}

	/**
	 * @property textKerning
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open lazy var textKerning = JavaScriptProperty(number: 0) { value in

		self.view.textKerning = CGFloat(value.number)

		if (self.node.isWrappingContentWidth ||
			self.node.isWrappingContentHeight) {
			self.node.invalidateSize()
		}
	}

	/**
	 * @property textLeading
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open lazy var textLeading = JavaScriptProperty(number: 0) { value in

		self.view.textLeading = CGFloat(value.number)

		if (self.node.isWrappingContentWidth ||
			self.node.isWrappingContentHeight) {
			self.node.invalidateSize()
		}
	}

	/**
	 * @property textDecoration
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open lazy var textDecoration = JavaScriptProperty(string: "none") { value in

		self.view.textDecoration = self.getTextDecoration(value.string)

		if (self.node.isWrappingContentWidth ||
			self.node.isWrappingContentHeight) {
			self.node.invalidateSize()
		}
	}

	/**
	 * @property textTransform
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open lazy var textTransform = JavaScriptProperty(string: "none") { value in

		self.view.textTransform = self.getTextTransform(value.string)

		if (self.node.isWrappingContentWidth ||
			self.node.isWrappingContentHeight) {
			self.node.invalidateSize()
		}
	}

	/**
	 * @property textOverflow
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open lazy var textOverflow = JavaScriptProperty(string: "ellipsis") { value in

		self.view.textOverflow = self.getTextOverflow(value.string)

		if (self.node.isWrappingContentWidth ||
			self.node.isWrappingContentHeight) {
			self.node.invalidateSize()
		}
	}

	/**
	 * @property textShadowBlur
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open lazy var textShadowBlur = JavaScriptProperty(number: 0) { value in
		self.view.textShadowBlur = CGFloat(value.number)
	}

	/**
	 * @property textShadowColor
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open lazy var textShadowColor = JavaScriptProperty(string: "#000") { value in
		self.view.textShadowColor = UIColor(color: value)
	}

	/**
	 * @property textShadowOffsetTop
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open lazy var textShadowOffsetTop = JavaScriptProperty(number: 0) { value in
		self.view.textShadowOffsetTop = CGFloat(value.number)
	}

	/**
	 * @property textShadowOffsetLeft
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open lazy var textShadowOffsetLeft = JavaScriptProperty(number: 0) { value in
		self.view.textShadowOffsetLeft = CGFloat(value.number)
	}

	/**
	 * @property linkColor
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open lazy var linkColor = JavaScriptProperty(string: "blue") { value in
		self.view.linkColor = UIColor(color: value)
	}

	/**
	 * @property linkDecoration
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open lazy var linkDecoration = JavaScriptProperty(string: "underline") { value in

		self.view.linkDecoration = self.getTextDecoration(value.string)

		if (self.node.isWrappingContentWidth ||
			self.node.isWrappingContentHeight) {
			self.node.invalidateSize()
		}
	}

	/**
	 * @property maxLines
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open lazy var maxLines = JavaScriptProperty(number: 0) { value in

		self.view.maxLines = Int(value.number)

		if (self.node.isWrappingContentWidth ||
			self.node.isWrappingContentHeight) {
			self.node.invalidateSize()
		}
	}

	//--------------------------------------------------------------------------

	/**
	 * @method jsGet_fontFamily
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open func jsGet_fontFamily(callback: JavaScriptGetterCallback) {
		callback.returns(self.fontFamily)
	}

	/**
	 * @method jsSet_fontFamily
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open func jsSet_fontFamily(callback: JavaScriptSetterCallback) {
		self.fontFamily.reset(callback.value, lock: self)
	}

	//--------------------------------------------------------------------------

	/**
	 * @method jsGet_fontWeight
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open func jsGet_fontWeight(callback: JavaScriptGetterCallback) {
		callback.returns(self.fontWeight)
	}

	/**
	 * @method jsSet_fontWeight
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open func jsSet_fontWeight(callback: JavaScriptSetterCallback) {
		self.fontWeight.reset(callback.value, lock: self)
	}

	//--------------------------------------------------------------------------

	/**
	 * @method jsGet_fontStyle
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open func jsGet_fontStyle(callback: JavaScriptGetterCallback) {
		callback.returns(self.fontStyle)
	}

	/**
	 * @method jsSet_fontStyle
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open func jsSet_fontStyle(callback: JavaScriptSetterCallback) {
		self.fontStyle.reset(callback.value, lock: self)
	}

	//--------------------------------------------------------------------------

	/**
	 * @method jsGet_fontSize
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open func jsGet_fontSize(callback: JavaScriptGetterCallback) {
		callback.returns(self.fontSize)
	}

	/**
	 * @method jsSet_fontSize
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open func jsSet_fontSize(callback: JavaScriptSetterCallback) {
		self.fontSize.reset(callback.value, lock: self, parse: true)
	}

	//--------------------------------------------------------------------------

	/**
	 * @method jsGet_minFontSize
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open func jsGet_minFontSize(callback: JavaScriptGetterCallback) {
		callback.returns(self.minFontSize)
	}

	/**
	 * @method jsSet_minFontSize
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open func jsSet_minFontSize(callback: JavaScriptSetterCallback) {
		self.minFontSize.reset(callback.value, lock: self, parse: true)
	}

	//--------------------------------------------------------------------------

	/**
	 * @method jsGet_maxFontSize
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open func jsGet_maxFontSize(callback: JavaScriptGetterCallback) {
		callback.returns(self.maxFontSize)
	}

	/**
	 * @method jsSet_maxFontSize
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open func jsSet_maxFontSize(callback: JavaScriptSetterCallback) {
		self.maxFontSize.reset(callback.value, lock: self, parse: true)
	}

	//--------------------------------------------------------------------------

	/**
	 * @method jsGet_text
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open func jsGet_text(callback: JavaScriptGetterCallback) {
		callback.returns(self.text)
	}

	/**
	 * @method jsSet_text
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open func jsSet_text(callback: JavaScriptSetterCallback) {
		self.text.reset(callback.value, lock: self)
	}

	//--------------------------------------------------------------------------

	/**
	 * @method jsGet_textColor
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open func jsGet_textColor(callback: JavaScriptGetterCallback) {
		callback.returns(self.textColor)
	}

	/**
	 * @method jsSet_textColor
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open func jsSet_textColor(callback: JavaScriptSetterCallback) {
		self.textColor.reset(callback.value, lock: self, parse: true)
	}

	//--------------------------------------------------------------------------

	/**
	 * @method jsGet_textAlign
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open func jsGet_textAlign(callback: JavaScriptGetterCallback) {
		callback.returns(self.textAlign)
	}

	/**
	 * @method jsSet_textAlign
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open func jsSet_textAlign(callback: JavaScriptSetterCallback) {
		return self.textAlign.reset(callback.value, lock: self)
	}

	//--------------------------------------------------------------------------

	/**
	 * @method jsGet_textBaseline
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open func jsGet_textBaseline(callback: JavaScriptGetterCallback) {
		callback.returns(self.textBaseline)
	}

	/**
	 * @method jsSet_textBaseline
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open func jsSet_textBaseline(callback: JavaScriptSetterCallback) {
		self.textBaseline.reset(callback.value, lock: self)
	}

	//--------------------------------------------------------------------------

	/**
	 * @method jsGet_textKerning
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open func jsGet_textKerning(callback: JavaScriptGetterCallback) {
		callback.returns(self.textKerning)
	}

	/**
	 * @method jsSet_textKerning
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open func jsSet_textKerning(callback: JavaScriptSetterCallback) {
		self.textKerning.reset(callback.value, lock: self, parse: true)
	}

	//--------------------------------------------------------------------------

	/**
	 * @method jsGet_textLeading
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open func jsGet_textLeading(callback: JavaScriptGetterCallback) {
		callback.returns(self.textLeading)
	}

	/**
	 * @method jsSet_textLeading
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open func jsSet_textLeading(callback: JavaScriptSetterCallback) {
		self.textLeading.reset(callback.value, lock: self, parse: true)
	}

	//--------------------------------------------------------------------------

	/**
	 * @method jsGet_textDecoration
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open func jsGet_textDecoration(callback: JavaScriptGetterCallback) {
		callback.returns(self.textDecoration)
	}

	/**
	 * @method jsSet_textDecoration
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open func jsSet_textDecoration(callback: JavaScriptSetterCallback) {
		self.textDecoration.reset(callback.value, lock: self)
	}

	//--------------------------------------------------------------------------

	/**
	 * @method jsGet_textTransform
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open func jsGet_textTransform(callback: JavaScriptGetterCallback) {
		callback.returns(self.textTransform)
	}

	/**
	 * @method jsSet_textTransform
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open func jsSet_textTransform(callback: JavaScriptSetterCallback) {
		self.textTransform.reset(callback.value, lock: self)
	}

	//--------------------------------------------------------------------------

	/**
	 * @method jsGet_textOverflow
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open func jsGet_textOverflow(callback: JavaScriptGetterCallback) {
		callback.returns(self.textOverflow)
	}

	/**
	 * @method jsSet_textOverflow
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open func jsSet_textOverflow(callback: JavaScriptSetterCallback) {
		self.textOverflow.reset(callback.value, lock: self)
	}

	//--------------------------------------------------------------------------

	/**
	 * @method jsGet_textShadowBlur
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open func jsGet_textShadowBlur(callback: JavaScriptGetterCallback) {
		callback.returns(self.textShadowBlur)
	}

	/**
	 * @method jsSet_textShadowBlur
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open func jsSet_textShadowBlur(callback: JavaScriptSetterCallback) {
		self.textShadowBlur.reset(callback.value, lock: self, parse: true)
	}

	//--------------------------------------------------------------------------

	/**
	 * @method jsGet_textShadowColor
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open func jsGet_textShadowColor(callback: JavaScriptGetterCallback) {
		callback.returns(self.textShadowColor)
	}

	/**
	 * @method jsSet_textShadowColor
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open func jsSet_textShadowColor(callback: JavaScriptSetterCallback) {
		self.textShadowColor.reset(callback.value, lock: self, parse: true)
	}

	//--------------------------------------------------------------------------

	/**
	 * @method jsGet_textShadowOffsetTop
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open func jsGet_textShadowOffsetTop(callback: JavaScriptGetterCallback) {
		callback.returns(self.textShadowOffsetTop)
	}

	/**
	 * @method jsSet_textShadowOffsetTop
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open func jsSet_textShadowOffsetTop(callback: JavaScriptSetterCallback) {
		self.fontFamily.reset(callback.value, lock: self, parse: true)
	}

	//--------------------------------------------------------------------------

	/**
	 * @method jsGet_textShadowOffsetLeft
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open func jsGet_textShadowOffsetLeft(callback: JavaScriptGetterCallback) {
		callback.returns(self.textShadowOffsetLeft)
	}

	/**
	 * @method jsSet_textShadowOffsetLeft
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open func jsSet_textShadowOffsetLeft(callback: JavaScriptSetterCallback) {
		self.textShadowOffsetLeft.reset(callback.value, lock: self, parse: true)
	}

	//--------------------------------------------------------------------------

	/**
	 * @method jsGet_linkColor
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open func jsGet_linkColor(callback: JavaScriptGetterCallback) {
		callback.returns(self.linkColor)
	}

	/**
	 * @method jsSet_linkColor
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open func jsSet_linkColor(callback: JavaScriptSetterCallback) {
		self.linkColor.reset(callback.value, lock: self, parse: true)
	}

	//--------------------------------------------------------------------------

	/**
	 * @method jsGet_linkDecoration
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open func jsGet_linkDecoration(callback: JavaScriptGetterCallback) {
		callback.returns(self.linkDecoration)
	}

	/**
	 * @method jsSet_linkDecoration
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open func jsSet_linkDecoration(callback: JavaScriptSetterCallback) {
		self.linkDecoration.reset(callback.value, lock: self, parse: true)
	}

	//--------------------------------------------------------------------------

	/**
	 * @method jsGet_maxLines
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open func jsGet_maxLines(callback: JavaScriptGetterCallback) {
		callback.returns(self.maxLines)
	}

	/**
	 * @method jsSet_maxLines
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open func jsSet_maxLines(callback: JavaScriptSetterCallback) {
		self.maxLines.reset(callback.value, lock: self)
	}

	//--------------------------------------------------------------------------
	// MARK: JS Functions
	//--------------------------------------------------------------------------

	/**
	 * @method jsSet_maxLines
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open func jsFunction_measureText(callback: JavaScriptFunctionCallback) {

		if (callback.arguments < 1) {
			fatalError("Function TextView.measureText() requires 3 arguments argument.")
		}

		let w = callback.argument(0).number
		let h = callback.argument(1).number
		let result = callback.argument(2)

		self.node.resolveTraits()

		let size = self.view.measure(
			bounds: CGSize(width: CGFloat(w), height: CGFloat(h)),
			min: CGSize.min,
			max: CGSize.max
		)

		result.property("width", number: size.width)
		result.property("height", number: size.height)
	}
}

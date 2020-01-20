import UIKit

/**
 * @class TextInput
 * @super UITextField
 * @since 0.1.0
 */
open class TextInput: UITextField, UITextFieldDelegate {

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
	 * The text input's type.
	 * @property type
	 * @since 0.1.0
	 */
	open var type: InputType = .text {

		willSet {

			self.inputView = nil
			self.inputAccessoryView = nil
			self.isSecureTextEntry = false

			switch (newValue) {

				case .date:
					self.createDatePicker()
				case .time:
					self.createTimePicker()

				case .text:
					self.keyboardType = .default
				case .number:
				 	self.keyboardType = .decimalPad
				case .phone:
					self.keyboardType = .numberPad
				case .email:
				 	self.keyboardType = .emailAddress

				case .password:
					self.keyboardType = .default
					self.isSecureTextEntry = true
			}
		}
	}

	/**
	 * The text input's value.
	 * @property value
	 * @since 0.1.0
	 */
	open var value: String = "" {

		didSet {

			if (self.value == oldValue) {
				return
			}

			if (self.type == .date ||
				self.type == .time) {
				self.date = DateParser.parse(self.value)
			}

			self.attributedText = self.getAttributedText()
		}
	}

	/**
	 * The text input's placeholder.
	 * @property placeholder
	 * @since 0.1.0
	 */
	override open var placeholder: String? {
		didSet {
			self.attributedPlaceholder = self.getAttributedPlaceholder()
		}
	}

	/**
	 * The text input's placeholder color.
	 * @property placeholderColor
	 * @since 0.1.0
	 */
	open var placeholderColor: UIColor = .gray {
		didSet {
			self.attributedPlaceholder = self.getAttributedPlaceholder()
		}
	}

	/**
	 * The text input's format.
	 * @property format
	 * @since 0.1.0
	 */
	open var format: String = "" {
		didSet {
			self.invalidateAttributedText()
		}
	}

	/**
	 * The text input's locale.
	 * @property locale
	 * @since 0.1.0
	 */
	open var locale: String = "" {
		didSet {
			self.invalidateAttributedText()
		}
	}

	/**
	 * The text input's font family.
	 * @property fontFamily
	 * @since 0.1.0
	 */
	open var fontFamily: String = "" {
		willSet {
			self.invalidateFont()
			self.invalidateAttributedText()
		}
	}

	/**
	 * The text input's font weight.
	 * @property fontWeight
	 * @since 0.1.0
	 */
	open var fontWeight: String = "normal" {
		willSet {
			self.invalidateFont()
			self.invalidateAttributedText()
		}
	}

	/**
	 * The text input's font style.
	 * @property fontStyle
	 * @since 0.1.0
	 */
	open var fontStyle: String = "normal" {
		willSet {
			self.invalidateFont()
			self.invalidateAttributedText()
		}
	}

	/**
	 * The text input's font size.
	 * @property fontSize
	 * @since 0.1.0
	 */
	open var fontSize: CGFloat = 17.0 {
		willSet {
			self.invalidateFont()
			self.invalidateAttributedText()
		}
	}

	/**
	 * The text input's text color.
	 * @property textColor
	 * @since 0.1.0
	 */
	override open var textColor: UIColor? {
		willSet {
			self.invalidateAttributedText()
		}
	}

	/**
	 * The text input's text align.
	 * @property textAlign
	 * @since 0.1.0
	 */
	open var textAlign: TextAlign = .middleLeft {
		willSet {
			self.invalidateAttributedText()
		}
	}

	/**
	 * The text input's text kerning.
	 * @property textKerning
	 * @since 0.1.0
	 */
	open var textKerning: CGFloat = 0 {
		willSet {
			self.invalidateAttributedText()
		}
	}

	/**
	 * The text input's text leading.
	 * @property textLeading
	 * @since 0.1.0
	 */
	open var textLeading: CGFloat = 0 {
		willSet {
			self.invalidateAttributedText()
		}
	}

	/**
	 * The text input's text decoration.
	 * @property textDecoration
	 * @since 0.1.0
	 */
	open var textDecoration: TextDecoration = .none {
		willSet {
			self.invalidateAttributedText()
		}
	}

	/**
	 * The text input's text transform.
	 * @property textTransform
	 * @since 0.1.0
	 */
	open var textTransform: TextTransform = .none {
		willSet {
			self.invalidateAttributedText()
		}
	}

	/**
	 * The text input's text shadow blur.
	 * @property textShadowBlur
	 * @since 0.1.0
	 */
	open var textShadowBlur: CGFloat = 0 {
		willSet {
			self.layer.shadowRadius = newValue / CGFloat(Double.pi)
		}
	}

	/**
	 * The text input's text shadow color.
	 * @property textShadowColor
	 * @since 0.1.0
	 */
	open var textShadowColor: UIColor = .black {
		willSet {
			self.layer.shadowColor = newValue.cgColor
		}
	}

	/**
	 * The text input's text top shadow offset.
	 * @property textShadowOffsetTop
	 * @since 0.1.0
	 */
	open var textShadowOffsetTop: CGFloat = 0 {
		willSet {
			self.layer.shadowOffset = self.layer.shadowOffset.setTop(newValue)
		}
	}

	/**
	 * The text input's text left shadow offset.
	 * @property textShadowOffsetLeft
	 * @since 0.1.0
	 */
	open var textShadowOffsetLeft: CGFloat = 0 {
		willSet {
			self.layer.shadowOffset = self.layer.shadowOffset.setLeft(newValue)
		}
	}

	/**
	 * The text input's top padding.
	 * @property paddingTop
	 * @since 0.1.0
	 */
	open var paddingTop: CGFloat = 0 {
		willSet {
			self.setNeedsLayout()
		}
	}

	/**
	 * The text input's left padding.
	 * @property paddingLeft
	 * @since 0.1.0
	 */
	open var paddingLeft: CGFloat = 0 {
		willSet {
			self.setNeedsLayout()
		}
	}

	/**
	 * The text input's right padding.
	 * @property paddingRight
	 * @since 0.1.0
	 */
	open var paddingRight: CGFloat = 0 {
		willSet {
			self.setNeedsLayout()
		}
	}

	/**
	 * The text input's bottom padding.
	 * @property paddingBottom
	 * @since 0.1.0
	 */
	open var paddingBottom: CGFloat = 0 {
		willSet {
			self.setNeedsLayout()
		}
	}

	/**
	 * @property observer
	 * @since 0.1.0
	 * @hidden
	 */
	private weak var observer: TextInputObserver?

	/**
	 * @property date
	 * @since 0.1.0
	 * @hidden
	 */
	private var date: Date = Date()

	/**
	 * @property datePicker
	 * @since 0.1.0
	 * @hidden
	 */
	private var datePicker: UIDatePicker?

	/**
	 * @property timePicker
	 * @since 0.1.0
	 * @hidden
	 */
	private var timePicker: UIDatePicker?

	/**
	 * @property invalidFont
	 * @since 0.1.0
	 * @hidden
	 */
	private var invalidFont: Bool = false

	/**
	 * @property invalidAttributedText
	 * @since 0.1.0
	 * @hidden
	 */
	private var invalidAttributedText: Bool = false

	/**
	 * @property invalidAttributedPlaceholder
	 * @since 0.1.0
	 * @hidden
	 */
	private var invalidAttributedPlaceholder: Bool = false

	//--------------------------------------------------------------------------
	// MARK: Methods
	//--------------------------------------------------------------------------

	/**
	 * @constructor
	 * @since 0.1.0
	 * @hidden
	 */
	public required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	/**
	 * Initializes the text input.
	 * @constructor
	 * @since 0.1.0
	 */
	public init(frame: CGRect, observer: TextInputObserver?) {

		super.init(frame: frame)

		self.font = UIFont.systemFont(ofSize: 17)

		self.delegate = self
		self.autocorrectionType = .yes
		self.autocapitalizationType = .sentences

		self.observer = observer
	}

	/**
	 * Moves the focus to the text input.
	 * @method focus
	 * @since 0.1.0
	 */
	open func focus() {
		if (self.isFirstResponder == false) {
			self.becomeFirstResponder()
		}
	}

	/**
	 * Removes the focus from the text input.
	 * @method blur
	 * @since 0.1.0
	 */
	open func blur() {
		if (self.isFirstResponder) {
			self.resignFirstResponder()
		}
	}

	/**
	 * @method textTextForBounds
	 * @since 0.1.0
	 * @hidden
	 */
	override open func textRect(forBounds bounds: CGRect) -> CGRect {
		return bounds.inset(by: UIEdgeInsets(top: self.paddingTop, left: self.paddingLeft, bottom: self.paddingBottom, right: self.paddingRight))
	}

	/**
	 * @methods editingRetForBounds
	 * @since 0.1.0
	 * @hidden
	 */
	override open func editingRect(forBounds bounds: CGRect) -> CGRect {
		return bounds.inset(by: UIEdgeInsets(top: self.paddingTop, left: self.paddingLeft, bottom: self.paddingBottom, right: self.paddingRight))
	}

	/**
	 * @inherited
	 * @method draw
	 * @since 0.1.0
	 */
	override open func draw(_ rect: CGRect) {

		if (self.invalidFont) {
			self.invalidFont = false
			self.updateFont()
		}

		if (self.invalidAttributedText) {
			self.invalidAttributedText = false
			self.attributedText = self.getAttributedText()
		}

		if (self.invalidAttributedPlaceholder) {
			self.invalidAttributedPlaceholder = false
			self.attributedPlaceholder = self.getAttributedPlaceholder()
		}

		switch (self.textAlign) {
			case .topLeft, .topRight, .topCenter:
				self.contentVerticalAlignment = .top
			case .middleLeft, .middleRight, .middleCenter:
				self.contentVerticalAlignment = .center
			case .bottomLeft, .bottomRight, .bottomCenter:
				self.contentVerticalAlignment = .bottom
		}

		super.draw(rect)
	}

	/**
	 * @method textFieldShouldChangeCharactersIn
	 * @since 0.1.0
	 * @hidden
	 */
	open func textField(_ textField: UITextField, shouldChangeCharactersIn charactersRange: NSRange, replacementString string: String) -> Bool {

		if (string.length > 0) {

			if (self.type == .phone) {
				if (string.range(of: "[0123456789-#*()]+", options: .regularExpression) == nil) {
					return false
				}
			}

			if (self.type == .number) {
				if (string.range(of: "[0123456789eE+-.,]+", options: .regularExpression) == nil) {
					return false
				}
			}
		}

		if let text = textField.text, let range = Range(charactersRange, in: text) {

			let begin = textField.beginningOfDocument
			let start = textField.position(from: begin, offset: charactersRange.location)
			let offset = textField.offset(from: begin, to: start!) + string.count

			let value = text.replacingCharacters(in: range, with: string)

			self.updateValue(value)

			if let cursor = textField.position(from: begin, offset: offset) {
				textField.selectedTextRange = textField.textRange(
					from: cursor,
					to: cursor
				)
			}
		}

		return false
	}

	/**
	 * @method textFieldShouldReturn
	 * @since 0.1.0
	 * @hidden
	 */
	open func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		return true
	}

	/**
	 * @method textFieldDidBeginEditing
	 * @since 0.1.0
	 * @hidden
	 */
	open func textFieldDidBeginEditing(_ textField: UITextField) {

		if (self.type == .date) {
			self.datePicker!.date = self.date
		}

		if (self.type == .time) {
			self.timePicker!.date = self.date
		}

		self.observer?.didFocus(textInput: self)
	}

	/**
	 * @method textFieldDidEndEditing
	 * @since 0.1.0
	 * @hidden
	 */
	open func textFieldDidEndEditing(_ textField: UITextField) {

		if (self.type == .date) {
			self.date = self.datePicker!.date
		}

		if (self.type == .time) {
			self.date = self.timePicker!.date
		}

		if (self.type == .date ||
			self.type == .time) {
			self.updateValue(self.date.iso)
		}

		self.observer?.didBlur(textInput: self)
	}

	/**
	 * @method didSelectDate
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open func didSelectDate() {

		switch (self.type) {

			case .date:
				self.date = self.datePicker!.date
			case .time:
				self.date = self.timePicker!.date

			default:
				break
		}

		self.endEditing(true)
	}

	/**
	 * @method didCancelDate
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open func didCancelDate() {

		switch (self.type) {

			case .date:
				self.datePicker!.date = self.date
			case .time:
				self.timePicker!.date = self.date

			default:
				break
		}

		self.endEditing(true)
	}

	//--------------------------------------------------------------------------
	// MARK: Private API
	//--------------------------------------------------------------------------

	/**
	 * @method invalidateFont
	 * @since 0.1.0
	 * @hidden
	 */
	private func invalidateFont() {
		if (self.invalidFont == false) {
			self.invalidFont = true
			self.setNeedsDisplay()
		}
	}

	/**
	 * @method invalidateAttributedText
	 * @since 0.1.0
	 * @hidden
	 */
	private func invalidateAttributedText() {
		if (self.invalidAttributedText == false) {
			self.invalidAttributedText = true
			self.setNeedsDisplay()
		}
	}

	/**
	 * @method invalidateAttributedPlaceholder
	 * @since 0.1.0
	 * @hidden
	 */
	private func invalidateAttributedPlaceholder() {
		if (self.invalidAttributedPlaceholder == false) {
			self.invalidAttributedPlaceholder = true
			self.setNeedsDisplay()
		}
	}

	/**
	 * @method updateFont
	 * @since 0.1.0
	 * @hidden
	 */
	private func updateFont() {
		self.font = UIFont.from(family: self.fontFamily, weight: self.fontWeight, style: self.fontStyle, size: self.fontSize)
	}

	/**
	 * @method updateValue
	 * @since 0.1.0
	 * @hidden
	 */
	private func updateValue(_ value: String) {

		var normalized = value

		if (self.type == .number) {

			/*
			 * In some locale such as french, the decimal separator is a comma
			 * which does not play nice with parsing
			 */

			normalized = normalized.replacingOccurrences(of: ",", with: ".")
		}

		if (self.value == normalized) {
			return
		}

		self.value = normalized

		self.observer?.didChange(textInput: self, value: normalized)
	}

	/**
	 * @method createDatePicker
	 * @since 0.1.0
	 * @hidden
	 */
	private func createDatePicker() {

		let acceptButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(didSelectDate))
		let spacerButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
		let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(didCancelDate))

		let toolbar = UIToolbar()
		toolbar.sizeToFit()
		toolbar.items = [
			cancelButton,
			spacerButton,
			acceptButton
		]

		let picker = UIDatePicker()
		picker.datePickerMode = .date

		self.inputAccessoryView = toolbar
		self.inputView = picker
		self.datePicker = picker
	}

	/**
	 * @method createTimePicker
	 * @since 0.1.0
	 * @hidden
	 */
	private func createTimePicker() {

		let acceptButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(didSelectDate))
		let spacerButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
		let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(didCancelDate))

		let toolbar = UIToolbar()
		toolbar.sizeToFit()
		toolbar.items = [
			cancelButton,
			spacerButton,
			acceptButton
		]

		let picker = UIDatePicker()
		picker.datePickerMode = .time

		self.inputAccessoryView = toolbar
		self.inputView = picker
		self.timePicker = picker
	}

	/**
	 * @method getAttributedText
	 * @since 0.1.0
	 * @hidden
	 */
	private func getAttributedText() -> NSAttributedString? {

		var attributes = TextAttributes()
		attributes.setFont(self.font)
		attributes.setTextColor(self.textColor)
		attributes.setTextKerning(self.textKerning)
		attributes.setTextLeading(self.textLeading)
		attributes.setTextAlign(self.textAlign)
		attributes.setTextDecoration(self.textDecoration)
		attributes.setBaselineOffset(0)

		var value = self.value

		if (self.type == .date ||
			self.type == .time) {
			value = self.date.format(self.format, self.locale)
		}

		switch (self.textTransform) {

			case .uppercase:
				value = value.uppercased()
			case .lowercase:
				value = value.uppercased()
			case .capitalize:
				value = value.capitalized

			default: break
		}

		return NSAttributedString(string: value, attributes: attributes)
	}

	/**
	 * @method getAttributedPlaceholder
	 * @since 0.1.0
	 * @hidden
	 */
	private func getAttributedPlaceholder() -> NSAttributedString? {

		guard var placeholder = self.placeholder else {
			return nil
		}

		var attributes = TextAttributes()
		attributes.setFont(self.font)
		attributes.setTextColor(self.placeholderColor)
		attributes.setTextKerning(self.textKerning)
		attributes.setTextLeading(self.textLeading)
		attributes.setTextAlign(self.textAlign)
		attributes.setTextDecoration(self.textDecoration)
		attributes.setBaselineOffset(0)

		switch (self.textTransform) {

			case .uppercase:
				placeholder = placeholder.uppercased()
			case .lowercase:
				placeholder = placeholder.uppercased()
			case .capitalize:
				placeholder = placeholder.capitalized

			default: break
		}

		return NSAttributedString(string: placeholder, attributes: attributes)
	}
}

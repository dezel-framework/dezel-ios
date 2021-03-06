import UIKit

/**
 * @extension NSAttributedString
 * @since 0.1.0
 * @hidden
 */
internal extension NSAttributedString {

	/**
	 * @property link
	 * @since 0.1.0
	 * @hidden
	 */
	var link: String? {
		return self.attribute(.link, at: 0, effectiveRange: nil) as? String
	}

	/**
	 * @method substring
	 * @since 0.1.0
	 * @hidden
	 */
	func substring(offset: Int, length: Int) -> NSAttributedString {
		return self.attributedSubstring(from: NSRange(location: offset, length: length))
	}

	/**
	 * @method truncate
	 * @since 0.1.0
	 * @hidden
	 */
	func truncate(range: NSRange, bounds: CGSize, character: NSAttributedString) -> CTLine? {
		return CTLineCreateTruncatedLine(CTLineCreateWithAttributedString(self.substring(offset: range.location, length: self.length - range.location)), Double(bounds.width), .end, CTLineCreateWithAttributedString(character))
	}

	/**
	 * @method truncate
	 * @since 0.1.0
	 * @hidden
	 */
	func truncate(range: CFRange, bounds: CGSize, character: NSAttributedString) -> CTLine? {
		return CTLineCreateTruncatedLine(CTLineCreateWithAttributedString(self.substring(offset: range.location, length: self.length - range.location)), Double(bounds.width), .end,  CTLineCreateWithAttributedString(character))
	}
}

/**
 * @extension NSMutableAttributedString
 * @since 0.1.0
 * @hidden
 */
internal extension NSMutableAttributedString {

	/**
	 * @method addFont
	 * @since 0.1.0
	 * @hidden
	 */
	func addFont(_ value: UIFont, range: NSRange) {
		self.addAttribute(.font, value: value, range: range)
	}

	/**
	 * @method addBackgroundColor
	 * @since 0.1.0
	 * @hidden
	 */
	func addBackgroundColor(_ value: CGColor, range: NSRange) {
		self.addAttribute(.backgroundColor, value: UIColor(cgColor: value), range: range)
	}

	/**
	 * @method addBackgroundColor
	 * @since 0.1.0
	 * @hidden
	 */
	func addBackgroundColor(_ value: UIColor, range: NSRange) {
		self.addAttribute(.backgroundColor, value: value, range: range)
	}

	/**
	 * @method addTextColor
	 * @since 0.1.0
	 * @hidden
	 */
	func addTextColor(_ value: CGColor, range: NSRange) {
		self.addAttribute(.foregroundColor, value: UIColor(cgColor: value), range: range)
	}

	/**
	 * @method addTextColor
	 * @since 0.1.0
	 * @hidden
	 */
	func addTextColor(_ value: UIColor, range: NSRange) {
		self.addAttribute(.foregroundColor, value: value, range: range)
	}

	/**
	 * @method addTextKerning
	 * @since 0.1.0
	 * @hidden
	 */
	func addTextKerning(_ value: CGFloat, range: NSRange) {
		self.addAttribute(.kern, value: value, range: range)
	}

	/**
	 * @method addBaselineOffset
	 * @since 0.1.0
	 * @hidden
	 */
	func addBaselineOffset(_ value: CGFloat, range: NSRange) {
		self.addAttribute(.baselineOffset, value: value, range: range)
	}

	/**
	 * @method addTextDecoration
	 * @since 0.1.0
	 * @hidden
	 */
	func addTextDecoration(_ value: TextDecoration, range: NSRange) {

		switch (value) {

			case .underline:
				self.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: range)
			case .linethrough:
				self.addAttribute(.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: range)

			default:
				break
		}
	}

	/**
	 * @method addLink
	 * @since 0.1.0
	 * @hidden
	 */
	func addLink(_ value: String, range: NSRange) {
		self.addAttribute(.link, value: value, range: range)
	}
}

/**
 * @typealias TextAttributes
 * @since 0.1.0
 */
public typealias TextAttributes = [NSAttributedString.Key: Any]

/**
 * @extension Dictionary
 * @since 0.1.0
 * @hidden
 */
internal extension Dictionary where Key == NSAttributedString.Key, Value == Any {

	/**
	 * @property paragraph
	 * @since 0.1.0
	 * @hidden
	 */
	mutating private func paragraph() -> NSMutableParagraphStyle {

		if (self[.paragraphStyle] == nil) {
			self[.paragraphStyle] = NSMutableParagraphStyle()
		}

		return self[.paragraphStyle] as! NSMutableParagraphStyle
	}

	/**
	 * @method setFont
	 * @since 0.1.0
	 * @hidden
	 */
	mutating func setFont(_ value: UIFont?) {
		self[.font] = value
	}

	/**
	 * @method setBackgroundColor
	 * @since 0.1.0
	 * @hidden
	 */
	mutating func setBackgroundColor(_ value: CGColor) {
		self[.backgroundColor] = UIColor(cgColor: value)
	}

	/**
	 * @method setBackgroundColor
	 * @since 0.1.0
	 * @hidden
	 */
	mutating func setBackgroundColor(_ value: UIColor?) {
		self[.backgroundColor] = value
	}

	/**
	 * @method setTextColor
	 * @since 0.1.0
	 * @hidden
	 */
	mutating func setTextColor(_ value: CGColor) {
		self[.foregroundColor] = UIColor(cgColor: value)
	}

	/**
	 * @method setTextColor
	 * @since 0.1.0
	 * @hidden
	 */
	mutating func setTextColor(_ value: UIColor?) {
		self[.foregroundColor] = value
	}

	/**
	 * @method setTextAlign
	 * @since 0.1.0
	 * @hidden
	 */
	mutating func setTextAlign(_ value: TextAlign) {

		switch (value) {

			case .topLeft, .middleLeft, .bottomLeft:
				self.paragraph().alignment = .left
			case .topRight, .middleRight, .bottomRight:
				self.paragraph().alignment = .right
			case .topCenter, .middleCenter, .bottomCenter:
				self.paragraph().alignment = .center
		}
	}

	/**
	 * @method setTextKerning
	 * @since 0.1.0
	 * @hidden
	 */
	mutating func setTextKerning(_ value: CGFloat) {
		self[.kern] = value
	}

	/**
	 * @method setTextLeading
	 * @since 0.1.0
	 * @hidden
	 */
	mutating func setTextLeading(_ value: CGFloat) {
		self.paragraph().lineSpacing = value
	}

	/**
	 * @method setBaselineOffset
	 * @since 0.1.0
	 * @hidden
	 */
	mutating func setBaselineOffset(_ value: CGFloat) {
		self[.baselineOffset] = value
	}

	/**
	 * @method setTextDecoration
	 * @since 0.1.0
	 * @hidden
	 */
	mutating func setTextDecoration(_ value: TextDecoration) {

		switch (value) {

			case .underline:
				self[.underlineStyle] = NSUnderlineStyle.single.rawValue
			case .linethrough:
				self[.strikethroughStyle] = NSUnderlineStyle.single.rawValue

			default:
				break
		}
	}
}

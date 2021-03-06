import UIKit

/**
 * @extension String
 * @since 0.1.0
 * @hidden
 */
internal extension String {

	/**
	 * @property length
	 * @since 0.1.0
	 * @hidden
	 */
	var length: Int {
		return self.count
	}

	/**
	 * @property isHTML
	 * @since 0.1.0
	 * @hidden
	 */
	var isHTML: Bool {
		return NSRegularExpression.isHTML(self)
	}

	/**
	 * @method substring
	 * @since 0.1.0
	 * @hidden
	 */
	func substring(start: Int, end: Int) -> String {
		let s = self.index(self.startIndex, offsetBy: start)
		let e = self.index(self.startIndex, offsetBy: end + 1)
		return String(self[s..<e])
	}

	/**
	 * @method trim
	 * @since 0.1.0
	 * @hidden
	 */
	func trim(set: CharacterSet = CharacterSet.whitespacesAndNewlines) -> String {
		return self.trimmingCharacters(in: set)
	}

	/**
	 * @method ltrim
	 * @since 0.1.0
	 * @hidden
	 */
	func ltrim(set: CharacterSet = CharacterSet.whitespacesAndNewlines) -> String {

        for character in self.enumerated() {
            let matched = character.element.unicodeScalars.contains { set.contains($0) }
            if (matched == false) {
            	return self.substring(start: character.offset, end: self.length - character.offset)
            }
        }

        return self
	}

	/**
	 * @method rtrim
	 * @since 0.1.0
	 * @hidden
	 */
	func rtrim(set: CharacterSet = CharacterSet.whitespacesAndNewlines) -> String {

        for character in self.enumerated().reversed() {
            let matched = character.element.unicodeScalars.contains { set.contains($0) }
            if (matched == false) {
            	return self.substring(start: self.length - character.offset, end: self.length)
            }
        }

        return self
	}

	/**
	 * @method match
	 * @since 0.1.0
	 * @hidden
	 */
	func match(_ regex: String) -> Bool {
		return range(of: regex, options: .regularExpression, range: nil, locale: nil) != nil
	}

	/**
	 * @method normalize
	 * @since 0.1.0
	 * @hidden
	 */
	func normalize() -> String {
		return (
			self.trim()
				.replacingOccurrences(of: "\\n", with: "\n")
				.replacingOccurrences(of: "[\t ]+", with: " ", options: .regularExpression, range: nil)
				.replacingOccurrences(of: "\n ", with: "\n")
			)
	}

	/**
	 * @method toLocale
	 * @since 0.1.0
	 * @hidden
	 */
	func toLocale() -> Locale {

		if (self == "") {
			return Locale.current
		}

		if (locales[self] == nil) {
			locales[self] = Locale(identifier: self)
		}

		return locales[self]!
	}

	/**
	 * @method toNumber
	 * @since 0.1.0
	 * @hidden
	 */
	func toNumber() -> Double {

		if (self.length == 0) {
			return 0.0
		}

		var limit = 0
		var chars = [Character]()

		for char in self {

			limit += 1

			if (char.isNumber == false &&
				char != "+" &&
				char != "-" &&
				char != ".") {
				break
			}

			chars.append(char)
		}

		if (limit == 1) {
			return Double.nan
		}

		if let number = Double(String(chars)) {
			return number
		}

		return Double.nan
	}

	/**
	 * @method toColor
	 * @since 0.1.0
	 * @hidden
	 */
	func toColor() -> UIColor {
		return UIColor(color: self)
	}
}

/**
 * @extension String
 * @since 0.1.0
 */
public extension String {

}

/**
 * @const locales
 * @since 0.1.0
 * @hidden
 */
private var locales: [String: Locale] = [:]

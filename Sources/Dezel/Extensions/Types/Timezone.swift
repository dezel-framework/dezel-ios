import UIKit

/**
 * @extension TimeZone
 * @since 0.1.0
 * @hidden
 */
internal extension TimeZone {

	/**
	 * @property utc
	 * @since 0.1.0
	 * @hidden
	 */
	static var utc: TimeZone {
		return TimeZone(secondsFromGMT: 0)!
	}
}

import Foundation
import QuartzCore

/**
* @extension CABasicAnimation
* @since 0.1.0
*/
internal extension CABasicAnimation {

	/**
	 * @constructor
	 * @since 0.1.0
	 * @hidden
	 */
	convenience init(key: String, delay: CFTimeInterval) {
		self.init(keyPath: key)
		self.beginTime = CACurrentMediaTime() + delay
		self.fillMode = .both
	}
}

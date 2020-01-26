import UIKit

/**
 * @class Script
 * @super Source
 * @since 0.1.0
 */
open class Script: Source {

	/**
	 * @inherited
	 * @method apply
	 * @since 0.1.0
	 */
	override open func apply(application: ApplicationController) {
		application.context.evaluate(self.data, url: self.path)
	}
}

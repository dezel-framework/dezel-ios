import UIKit

/**
 * @class Styles
 * @super Source
 * @since 0.1.0
 */
open class Styles: Source {

	/**
	 * Applies the source to the application.
	 * @method apply
	 * @since 0.1.0
	 */
	override open func apply(application: ApplicationController) {
		application.stylesheet.evaluate(self.data, url: self.path)
	}
}

import UIKit

/**
 * @class JavaScriptGraphicModule
 * @super JavaScriptModule
 * @since 0.1.0
 */
open class JavaScriptGraphicModule: JavaScriptModule {

	//--------------------------------------------------------------------------
	// MARK: Methods
	//--------------------------------------------------------------------------

	/**
 	 * @inherited
	 * @method configure
	 * @since 0.1.0
	 */
	override open func configure(context: JavaScriptContext) {
		context.registerClass("dezel.graphic.Bitmap", with: JavaScriptBitmap.self)
		// context.registerClass("dezel.graphic.Canvas", with: JavaScriptCanvas.self)
	}
}

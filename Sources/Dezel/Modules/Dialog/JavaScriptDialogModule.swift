import UIKit

/**
 * @class JavaScriptDialogModule
 * @super JavaScriptModule
 * @since 0.1.0
 */
open class JavaScriptDialogModule: JavaScriptModule {

	//--------------------------------------------------------------------------
	// MARK: Methods
	//--------------------------------------------------------------------------

	/**
	 * @inherited
	 * @method configure
	 * @since 0.1.0
	 */
	override open func configure(context: JavaScriptContext) {
		context.registerClass("dezel.dialog.Alert", with: JavaScriptAlert.self)
		context.registerClass("dezel.dialog.AlertButton", with: JavaScriptAlertButton.self)
	}
}

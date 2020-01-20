import UIKit

/**
 * @class JavaScriptFormModule
 * @super JavaScriptModule
 * @since 0.1.0
 */
open class JavaScriptFormModule: JavaScriptModule {

	//--------------------------------------------------------------------------
	// MARK: Methods
	//--------------------------------------------------------------------------

	/**
	 * @inherited
	 * @method configure
	 * @since 0.1.0
	 */
	override open func configure(context: JavaScriptContext) {
		context.registerClass("dezel.form.TextInput", with: JavaScriptTextInput.self)
		context.registerClass("dezel.form.TextArea", with: JavaScriptTextArea.self)
	}
}

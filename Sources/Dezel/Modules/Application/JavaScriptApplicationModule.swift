import UIKit

/**
 * @class JavaScriptApplicationModule
 * @super JavaScriptModule
 * @since 0.1.0
 */
public class JavaScriptApplicationModule: JavaScriptModule {

	/**
	 * @inherited
	 * @method configure
	 * @since 0.1.0
	 */
	public override func configure(context: JavaScriptContext) {
		context.registerClass("dezel.application.Application", with: JavaScriptApplication.self)
	}
}

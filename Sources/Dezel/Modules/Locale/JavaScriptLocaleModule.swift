import UIKit

/**
 * @class JavaScriptLocaleModule
 * @super JavaScriptModule
 * @since 0.1.0
 */
public class JavaScriptLocaleModule : JavaScriptModule {

	/**
	 * @inherited
	 * @method configure
	 * @since 0.1.0
	 */
	open override func configure(context: JavaScriptContext) {
		context.registerClass("dezel.locale.Locale", with: JavaScriptLocale.self)
	}
}

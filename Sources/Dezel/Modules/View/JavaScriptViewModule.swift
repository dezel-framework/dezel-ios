import UIKit

/**
 * @class JavaScriptViewModule
 * @super JavaScriptModule
 * @since 0.1.0
 */
open class JavaScriptViewModule: JavaScriptModule {

	//--------------------------------------------------------------------------
	// MARK: Methods
	//--------------------------------------------------------------------------

	/**
 	 * @inherited
	 * @method configure
	 * @since 0.1.0
	 */
	override open func configure(context: JavaScriptContext) {
		context.registerClass("dezel.view.ImageView", with: JavaScriptImageView.self)
		context.registerClass("dezel.view.SpinnerView", with: JavaScriptSpinnerView.self)
		context.registerClass("dezel.view.TextView", with: JavaScriptTextView.self)
		context.registerClass("dezel.view.View", with: JavaScriptView.self)
		context.registerClass("dezel.view.Window", with: JavaScriptWindow.self)
		context.registerClass("dezel.view.WebView", with: JavaScriptWebView.self)
		context.registerClass("dezel.view.Recycler", with: JavaScriptRecycler.self)
	}
}

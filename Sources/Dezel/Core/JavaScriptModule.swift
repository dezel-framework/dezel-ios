import JavaScriptCore
import DezelCoreJS

/**
 * @class JavaScriptModule
 * @since 0.1.0
 */
open class JavaScriptModule {

	//--------------------------------------------------------------------------
	// MARK: Methods
	//--------------------------------------------------------------------------

	/**
	 * Configures the module.
	 * @method configure
	 * @since 0.1.0
	 */
	open func configure(context: JavaScriptContext) {

	}

	/**
	 * Disposes the module.
	 * @method dispose
	 * @since 0.1.0
	 */
	open func dispose(context: JavaScriptContext) {

	}

	/**
	 * Called before the module's context is reloaded.
	 * @method willReload
	 * @since 0.1.0
	 */
	open func willReload(context: JavaScriptContext) {

	}

	/**
	 * Called after the module's context is reloaded.
	 * @method willReload
	 * @since 0.1.0
	 */
	open func didReload(context: JavaScriptContext) {

	}
}

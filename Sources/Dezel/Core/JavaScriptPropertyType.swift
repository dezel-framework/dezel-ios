import JavaScriptCore
import DezelCoreJS

/**
 * The JavaScript property type enumeration.
 * @enum JavaScriptPropertyType
 * @since 0.1.0
 */
public enum JavaScriptPropertyType : Int {
	case null = 0
	case string = 1
	case number = 2
	case boolean = 3
	case array = 4
	case object = 5
	case callback = 6
	case variable = 7
	case function = 8
	case composite = 9
}

import UIKit
import DezelCoreUI

/**
 * @class DisplayNode
 * @since 0.1.0
 */
open class DisplayNode {

	//--------------------------------------------------------------------------
	// MARK: Properties
	//--------------------------------------------------------------------------

	/**
	 * The display node's delegate.
	 * @property delegate
	 * @since 0.1.0
	 */
	open weak var delegate: DisplayNodeDelegate?

	/**
	 * The display node's display.
	 * @property display
	 * @since 0.1.0
	 */
	private(set) public var display: Display

	/**
	 * The display node's measured top.
	 * @property measuredTop
	 * @since 0.1.0
	 */
	public var measuredTop: Double {
		return DisplayNodeGetMeasuredTop(self.handle)
	}

	/**
	 * The display node's measured left.
	 * @property measuredLeft
	 * @since 0.1.0
	 */
	public var measuredLeft: Double {
		return DisplayNodeGetMeasuredLeft(self.handle)
	}

	/**
	 * The display node's measured right
	 * @property measuredRight
	 * @since 0.1.0
	 */
	public var measuredRight: Double {
		return DisplayNodeGetMeasuredRight(self.handle)
	}

	/**
	 * The display node's measured bottom.
	 * @property measuredBottom
	 * @since 0.1.0
	 */
	public var measuredBottom: Double {
		return DisplayNodeGetMeasuredBottom(self.handle)
	}

	/**
	 * The display node's measured width.
	 * @property measuredWidth
	 * @since 0.1.0
	 */
	public var measuredWidth: Double {
		return DisplayNodeGetMeasuredWidth(self.handle)
	}

	/**
	 * The display node's measured height.
	 * @property measuredHeight
	 * @since 0.1.0
	 */
	public var measuredHeight: Double {
		return DisplayNodeGetMeasuredHeight(self.handle)
	}

	/**
	 * The display node's measured inner width.
	 * @property measuredInnerWidth
	 * @since 0.1.0
	 */
	public var measuredInnerWidth: Double {
		return DisplayNodeGetMeasuredInnerWidth(self.handle)
	}

	/**
	 * The display node's measured inner height.
	 * @property measuredInnerHeight
	 * @since 0.1.0
	 */
	public var measuredInnerHeight: Double {
		return DisplayNodeGetMeasuredInnerHeight(self.handle)
	}

	/**
	 * The display node's measured content width.
	 * @property measuredContentWidth
	 * @since 0.1.0
	 */
	public var measuredContentWidth: Double {
		return DisplayNodeGetMeasuredContentWidth(self.handle)
	}

	/**
	 * The display node's measured content height.
	 * @property measuredContentHeight
	 * @since 0.1.0
	 */
	public var measuredContentHeight: Double {
		return DisplayNodeGetMeasuredContentHeight(self.handle)
	}

	/**
	 * The display node's measured margin top.
	 * @property measuredMarginTop
	 * @since 0.1.0
	 */
	public var measuredMarginTop: Double {
		return DisplayNodeGetMeasuredMarginTop(self.handle)
	}

	/**
	 * The display node's measured margin left.
	 * @property measuredMarginLeft
	 * @since 0.1.0
	 */
	public var measuredMarginLeft: Double {
		return DisplayNodeGetMeasuredMarginLeft(self.handle)
	}

	/**
	 * The display node's measured margin right.
	 * @property measuredMarginRight
	 * @since 0.1.0
	 */
	public var measuredMarginRight: Double {
		return DisplayNodeGetMeasuredMarginRight(self.handle)
	}

	/**
	 * The display node's measured margin bottom.
	 * @property measuredMarginBottom
	 * @since 0.1.0
	 */
	public var measuredMarginBottom: Double {
		return DisplayNodeGetMeasuredMarginBottom(self.handle)
	}

	/**
	 * The display node's measured top border.
	 * @property measuredBorderTop
	 * @since 0.1.0
	 */
	public var measuredBorderTop: Double {
		return DisplayNodeGetMeasuredBorderTop(self.handle)
	}

	/**
	 * The display node's measured left border.
	 * @property measuredBorderLeft
	 * @since 0.1.0
	 */
	public var measuredBorderLeft: Double {
		return DisplayNodeGetMeasuredBorderLeft(self.handle)
	}

	/**
	 * The display node's measured right border.
	 * @property measuredBorderRight
	 * @since 0.1.0
	 */
	public var measuredBorderRight: Double {
		return DisplayNodeGetMeasuredBorderRight(self.handle)
	}

	/**
	 * The display node's measured bottom border.
	 * @property measuredBorderBottom
	 * @since 0.1.0
	 */
	public var measuredBorderBottom: Double {
		return DisplayNodeGetMeasuredBorderBottom(self.handle)
	}

	/**
	 * The display node's measured top padding.
	 * @property measuredPaddingTop
	 * @since 0.1.0
	 */
	public var measuredPaddingTop: Double {
		return DisplayNodeGetMeasuredPaddingTop(self.handle)
	}

	/**
	 * The display node's measured left padding.
	 * @property measuredPaddingLeft
	 * @since 0.1.0
	 */
	public var measuredPaddingLeft: Double {
		return DisplayNodeGetMeasuredPaddingLeft(self.handle)
	}

	/**
	 * The display node's measured right padding.
	 * @property measuredPaddingRight
	 * @since 0.1.0
	 */
	public var measuredPaddingRight: Double {
		return DisplayNodeGetMeasuredPaddingRight(self.handle)
	}

	/**
	 * The display node's measured bottom padding.
	 * @property measuredPaddingBottom
	 * @since 0.1.0
	 */
	public var measuredPaddingBottom: Double {
		return DisplayNodeGetMeasuredPaddingBottom(self.handle)
	}

	/**
	 * Whether the width is set to fill.
	 * @property isFillingParentWidth
	 * @since 0.1.0
	 */
	public var isFillingParentWidth: Bool {
		return DisplayNodeIsFillingParentWidth(self.handle)
	}

	/**
	 * Whether the height is set to fill.
	 * @property fillsParentHeight
	 * @since 0.1.0
	 */
	public var isFillingParentHeight: Bool {
		return DisplayNodeIsFillingParentHeight(self.handle)
	}

	/**
	 * Whether the width is set to wrap.
	 * @property isWrappingContentWidth
	 * @since 0.1.0
	 */
	public var isWrappingContentWidth: Bool {
		return DisplayNodeIsWrappingContentWidth(self.handle)
	}

	/**
	 * Whether the height is set to wrap.
	 * @property isWrappingContentHeight
	 * @since 0.1.0
	 */
	public var isWrappingContentHeight: Bool {
		return DisplayNodeIsWrappingContentHeight(self.handle)
	}

	/**
	 * @property handle
	 * @since 0.1.0
	 * @hidden
	 */
	private(set) public var handle: DisplayNodeRef!

	//--------------------------------------------------------------------------
	// MARK: Methods
	//--------------------------------------------------------------------------

	/**
	 * Initializes the display node.
	 * @constructor
	 * @since 0.1.0
	 */
	internal init(display: Display) {

		self.display = display

		self.handle = DisplayNodeCreate()

		DisplayNodeSetDisplay(self.handle, display.handle)

		DisplayNodeSetInvalidateCallback(self.handle, displayNodeInvalidateCallback)
		DisplayNodeSetResolveSizeCallback(self.handle, displayNodeResolveSizeCallback)
		DisplayNodeSetResolveOriginCallback(self.handle, displayNodeResolveOriginCallback)
		DisplayNodeSetResolveInnerSizeCallback(self.handle, displayNodeResolveInnerSizeCallback)
		DisplayNodeSetResolveContentSizeCallback(self.handle, displayNodeResolveContentSizeCallback)
		DisplayNodeSetResolveMarginsCallback(self.handle, displayNodeResolveMarginsCallback)
		DisplayNodeSetResolveBordersCallback(self.handle, displayNodeResolveBordersCallback)
		DisplayNodeSetResolvePaddingCallback(self.handle, displayNodeResolvePaddingCallback)
		DisplayNodeSetPrepareLayoutCallback(self.handle, displayNodePrepareLayoutCallback)
		DisplayNodeSetResolveLayoutCallback(self.handle, displayNodeResolveLayoutCallback)
		DisplayNodeSetMeasureCallback(self.handle, displayNodeMeasureCallback)
		DisplayNodeSetUpdateCallback(self.handle, displayNodeUpdateCallback);

		DisplayNodeSetData(self.handle, UnsafeMutableRawPointer(unretained: self))
	}

	/**
	 * @destructor
	 * @since 0.1.0
	 * @hidden
	 */
	deinit {
		DisplayNodeDelete(self.handle)
	}

	/**
	 * Make the display node opaque.
	 * @method setOpaque
	 * @since 0.1.0
	 */
	public func setOpaque() {
		DisplayNodeSetOpaque(self.handle)
	}

	/**
	 * Assigns the display node's name.
	 * @method setName
	 * @since 0.1.0
	 */
	public func setName(_ name: String) {
		DisplayNodeSetName(self.handle, name)
	}

	/**
	 * Assigns the display node's type.
	 * @method setType
	 * @since 0.1.0
	 */
	public func setType(_ type: String) {
		DisplayNodeSetType(self.handle, type)
	}

	/**
	 * Appends a display node style.
	 * @method appendStyle
	 * @since 0.1.0
	 */
	public func appendStyle(_ style: String) {
		DisplayNodeAppendStyle(self.handle, style)
	}

	/**
	 * Removes a display node style.
	 * @method removeStyle
	 * @since 0.1.0
	 */
	public func removeStyle(_ style: String) {
		DisplayNodeRemoveStyle(self.handle, style)
	}

	/**
	 * Indicate whether the display node has a specified style.
	 * @method hasStyle
	 * @since 0.1.0
	 */
	public func hasStyle(_ style: String) -> Bool {
		return DisplayNodeHasStyle(self.handle, style)
	}

	/**
	 * Appends a display node state.
	 * @method appendState
	 * @since 0.1.0
	 */
	public func appendState(_ state: String) {
		DisplayNodeAppendState(self.handle, state)
	}

	/**
	 * Removes a display node state.
	 * @method removeState
	 * @since 0.1.0
	 */
	public func removeState(_ state: String) {
		DisplayNodeRemoveState(self.handle, state)
	}

	/**
	 * Whether the display node has a specified state.
	 * @method hasState
	 * @since 0.1.0
	 */
	public func hasState(_ state: String) -> Bool {
		return DisplayNodeHasState(self.handle, state)
	}

	/**
	 * Assigns the display node's top anchor.
	 * @method setAnchorTop
	 * @since 0.1.0
	 */
	public func setAnchorTop(_ value: JavaScriptProperty) {

		if (value.type == .string) {

			switch (value.string) {
				case "top":    self.setAnchorTop(type: kAnchorTypeLength, unit: kAnchorUnitPC, length: 0)
				case "center": self.setAnchorTop(type: kAnchorTypeLength, unit: kAnchorUnitPC, length: 50)
				case "bottom": self.setAnchorTop(type: kAnchorTypeLength, unit: kAnchorUnitPC, length: 100)
				default: break
			}

			return
		}

		if (value.type == .number) {

			switch (value.unit) {

				case .px: self.setAnchorTop(type: kAnchorTypeLength, unit: kAnchorUnitPX, length: value.number)
				case .pc: self.setAnchorTop(type: kAnchorTypeLength, unit: kAnchorUnitPC, length: value.number)
				case .vw: self.setAnchorTop(type: kAnchorTypeLength, unit: kAnchorUnitVW, length: value.number)
				case .vh: self.setAnchorTop(type: kAnchorTypeLength, unit: kAnchorUnitVH, length: value.number)
				case .pw: self.setAnchorTop(type: kAnchorTypeLength, unit: kAnchorUnitPW, length: value.number)
				case .ph: self.setAnchorTop(type: kAnchorTypeLength, unit: kAnchorUnitPH, length: value.number)
				case .cw: self.setAnchorTop(type: kAnchorTypeLength, unit: kAnchorUnitCW, length: value.number)
				case .ch: self.setAnchorTop(type: kAnchorTypeLength, unit: kAnchorUnitCH, length: value.number)
				default:  self.setAnchorTop(type: kAnchorTypeLength, unit: kAnchorUnitPX, length: value.number)

			}

			return
		}

		fatalError("Invalid property type.")
	}

	/**
	 * Assigns the display node's top anchor.
	 * @method setAnchorTop
	 * @since 0.1.0
	 */
	public func setAnchorTop(type: AnchorType, unit: AnchorUnit, length: Double) {
		DisplayNodeSetAnchorTop(self.handle, type, unit, length)
	}

	/**
	 * Assigns the display node's left anchor.
	 * @method setAnchorLeft
	 * @since 0.1.0
	 */
	public func setAnchorLeft(_ value: JavaScriptProperty) {

		if (value.type == .string) {

			switch (value.string) {
				case "left":   self.setAnchorLeft(type: kAnchorTypeLength, unit: kAnchorUnitPC, length: 0)
				case "center": self.setAnchorLeft(type: kAnchorTypeLength, unit: kAnchorUnitPC, length: 50)
				case "right":  self.setAnchorLeft(type: kAnchorTypeLength, unit: kAnchorUnitPC, length: 100)
				default: break
			}

			return
		}

		if (value.type == .number) {

			switch (value.unit) {

				case .px: self.setAnchorLeft(type: kAnchorTypeLength, unit: kAnchorUnitPX, length: value.number)
				case .pc: self.setAnchorLeft(type: kAnchorTypeLength, unit: kAnchorUnitPC, length: value.number)
				case .vw: self.setAnchorLeft(type: kAnchorTypeLength, unit: kAnchorUnitVW, length: value.number)
				case .vh: self.setAnchorLeft(type: kAnchorTypeLength, unit: kAnchorUnitVH, length: value.number)
				case .pw: self.setAnchorLeft(type: kAnchorTypeLength, unit: kAnchorUnitPW, length: value.number)
				case .ph: self.setAnchorLeft(type: kAnchorTypeLength, unit: kAnchorUnitPH, length: value.number)
				case .cw: self.setAnchorLeft(type: kAnchorTypeLength, unit: kAnchorUnitCW, length: value.number)
				case .ch: self.setAnchorLeft(type: kAnchorTypeLength, unit: kAnchorUnitCH, length: value.number)
				default:  self.setAnchorLeft(type: kAnchorTypeLength, unit: kAnchorUnitPX, length: value.number)
			}

			return
		}

		fatalError("Invalid property type.")
	}

	/**
	 * Assigns the display node's left anchor.
	 * @method setAnchorLeft
	 * @since 0.1.0
	 */
	public func setAnchorLeft(type: AnchorType, unit: AnchorUnit, length: Double) {
		DisplayNodeSetAnchorLeft(self.handle, type, unit, length)
	}

	/**
	 * Assigns the display node's top position.
	 * @method setTop
	 * @since 0.1.0
	 */
	public func setTop(_ value: JavaScriptProperty) {

		if (value.type == .string) {

			switch (value.string) {
				case "auto": self.setTop(type: kOriginTypeAuto, unit: kOriginUnitNone, length: 0)
				default: break
			}

			return
		}

		if (value.type == .number) {

			switch (value.unit) {
				case .px: self.setTop(type: kOriginTypeLength, unit: kOriginUnitPX, length: value.number)
				case .pc: self.setTop(type: kOriginTypeLength, unit: kOriginUnitPC, length: value.number)
				case .vw: self.setTop(type: kOriginTypeLength, unit: kOriginUnitVW, length: value.number)
				case .vh: self.setTop(type: kOriginTypeLength, unit: kOriginUnitVH, length: value.number)
				case .pw: self.setTop(type: kOriginTypeLength, unit: kOriginUnitPW, length: value.number)
				case .ph: self.setTop(type: kOriginTypeLength, unit: kOriginUnitPH, length: value.number)
				case .cw: self.setTop(type: kOriginTypeLength, unit: kOriginUnitCW, length: value.number)
				case .ch: self.setTop(type: kOriginTypeLength, unit: kOriginUnitCH, length: value.number)
				default:  self.setTop(type: kOriginTypeLength, unit: kOriginUnitPX, length: value.number)
			}

			return
		}

		fatalError("Invalid property type.")
	}

	/**
	 * Assigns the display node's top position.
	 * @method setTop
	 * @since 0.1.0
	 */
	public func setTop(type: OriginType, unit: OriginUnit, length: Double) {
		DisplayNodeSetTop(self.handle, type, unit, length)
	}

	/**
	 * Assigns the display node's minimum top position.
	 * @method setMinTop
	 * @since 0.1.0
	 */
	public func setMinTop(_ min: Double) {
		DisplayNodeSetMinTop(self.handle, min)
	}

	/**
	 * Assigns the display node's maximum top position.
	 * @method setMaxTop
	 * @since 0.1.0
	 */
	public func setMaxTop(_ max: Double) {
		DisplayNodeSetMaxTop(self.handle, max)
	}

	/**
	 * Assigns the display node's left position.
	 * @method setLeft
	 * @since 0.1.0
	 */
	public func setLeft(_ value: JavaScriptProperty) {

		if (value.type == .string) {

			switch (value.string) {
				case "auto": self.setLeft(type: kOriginTypeAuto, unit: kOriginUnitNone, length: 0)
				default: break
			}

			return
		}

		if (value.type == .number) {

			switch (value.unit) {
				case .px: self.setLeft(type: kOriginTypeLength, unit: kOriginUnitPX, length: value.number)
				case .pc: self.setLeft(type: kOriginTypeLength, unit: kOriginUnitPC, length: value.number)
				case .vw: self.setLeft(type: kOriginTypeLength, unit: kOriginUnitVW, length: value.number)
				case .vh: self.setLeft(type: kOriginTypeLength, unit: kOriginUnitVH, length: value.number)
				case .pw: self.setLeft(type: kOriginTypeLength, unit: kOriginUnitPW, length: value.number)
				case .ph: self.setLeft(type: kOriginTypeLength, unit: kOriginUnitPH, length: value.number)
				case .cw: self.setLeft(type: kOriginTypeLength, unit: kOriginUnitCW, length: value.number)
				case .ch: self.setLeft(type: kOriginTypeLength, unit: kOriginUnitCH, length: value.number)
				default:  self.setLeft(type: kOriginTypeLength, unit: kOriginUnitPX, length: value.number)
			}

			return
		}

		fatalError("Invalid property type.")
	}

	/**
	 * Assigns the display node's left position.
	 * @method setLeft
	 * @since 0.1.0
	 */
	public func setLeft(type: OriginType, unit: OriginUnit, length: Double) {
		DisplayNodeSetLeft(self.handle, type, unit, length)
	}

	/**
	 * Assigns the display node's minimum left position.
	 * @method setMinLeft
	 * @since 0.1.0
	 */
	public func setMinLeft(_ min: Double) {
		DisplayNodeSetMinLeft(self.handle, min)
	}

	/**
	 * Assigns the display node's maximum left position.
	 * @method setMaxLeft
	 * @since 0.1.0
	 */
	public func setMaxLeft(_ max: Double) {
		DisplayNodeSetMaxLeft(self.handle, max)
	}

	/**
	 * Assigns the display node's right position.
	 * @method setRight
	 * @since 0.1.0
	 */
	public func setRight(_ value: JavaScriptProperty) {

		if (value.type == .string) {

			switch (value.string) {
				case "auto": self.setRight(type: kOriginTypeAuto, unit: kOriginUnitNone, length: 0)
				default: break
			}

			return
		}

		if (value.type == .number) {

			switch (value.unit) {
				case .px: self.setRight(type: kOriginTypeLength, unit: kOriginUnitPX, length: value.number)
				case .pc: self.setRight(type: kOriginTypeLength, unit: kOriginUnitPC, length: value.number)
				case .vw: self.setRight(type: kOriginTypeLength, unit: kOriginUnitVW, length: value.number)
				case .vh: self.setRight(type: kOriginTypeLength, unit: kOriginUnitVH, length: value.number)
				case .pw: self.setRight(type: kOriginTypeLength, unit: kOriginUnitPW, length: value.number)
				case .ph: self.setRight(type: kOriginTypeLength, unit: kOriginUnitPH, length: value.number)
				case .cw: self.setRight(type: kOriginTypeLength, unit: kOriginUnitCW, length: value.number)
				case .ch: self.setRight(type: kOriginTypeLength, unit: kOriginUnitCH, length: value.number)
				default:  self.setRight(type: kOriginTypeLength, unit: kOriginUnitPX, length: value.number)
			}

			return
		}

		fatalError("Invalid property type.")
	}

	/**
	 * Assigns the display node's right position.
	 * @method setRight
	 * @since 0.1.0
	 */
	public func setRight(type: OriginType, unit: OriginUnit, length: Double) {
		DisplayNodeSetRight(self.handle, type, unit, length)
	}

	/**
	 * Assigns the display node's minimum right position.
	 * @method setMinRight
	 * @since 0.1.0
	 */
	public func setMinRight(_ min: Double) {
		DisplayNodeSetMinRight(self.handle, min)
	}

	/**
	 * Assigns the display node's maximum right position.
	 * @method setMaxRight
	 * @since 0.1.0
	 */
	public func setMaxRight(_ max: Double) {
		DisplayNodeSetMaxRight(self.handle, max)
	}

	/**
	 * Assigns the display node's bottom position.
	 * @method setBottom
	 * @since 0.1.0
	 */
	public func setBottom(_ value: JavaScriptProperty) {

		if (value.type == .string) {

			switch (value.string) {
				case "auto": self.setBottom(type: kOriginTypeAuto, unit: kOriginUnitNone, length: 0)
				default: break
			}

			return
		}

		if (value.type == .number) {

			switch (value.unit) {
				case .px: self.setBottom(type: kOriginTypeLength, unit: kOriginUnitPX, length: value.number)
				case .pc: self.setBottom(type: kOriginTypeLength, unit: kOriginUnitPC, length: value.number)
				case .vw: self.setBottom(type: kOriginTypeLength, unit: kOriginUnitVW, length: value.number)
				case .vh: self.setBottom(type: kOriginTypeLength, unit: kOriginUnitVH, length: value.number)
				case .pw: self.setBottom(type: kOriginTypeLength, unit: kOriginUnitPW, length: value.number)
				case .ph: self.setBottom(type: kOriginTypeLength, unit: kOriginUnitPH, length: value.number)
				case .cw: self.setBottom(type: kOriginTypeLength, unit: kOriginUnitCW, length: value.number)
				case .ch: self.setBottom(type: kOriginTypeLength, unit: kOriginUnitCH, length: value.number)
				default:  self.setBottom(type: kOriginTypeLength, unit: kOriginUnitPX, length: value.number)
			}

			return
		}

		fatalError("Invalid property type.")
	}

	/**
	 * Assigns the display node's bottom position.
	 * @method setBottom
	 * @since 0.1.0
	 */
	public func setBottom(type: OriginType, unit: OriginUnit, length: Double) {
		DisplayNodeSetBottom(self.handle, type, unit, length)
	}

	/**
	 * Assigns the display node's minimum bottom position.
	 * @method setMinBottom
	 * @since 0.1.0
	 */
	public func setMinBottom(_ min: Double) {
		DisplayNodeSetMinBottom(self.handle, min)
	}

	/**
	 * Assigns the display node's maximum bottom position.
	 * @method setMaxBottom
	 * @since 0.1.0
	 */
	public func setMaxBottom(_ max: Double) {
		DisplayNodeSetMaxBottom(self.handle, max)
	}

	/**
	 * Assigns the display node's width.
	 * @method setWidth
	 * @since 0.1.0
	 */
	public func setWidth(_ value: JavaScriptProperty) {

		if (value.type == .string) {

			switch (value.string) {
				case "fill": self.setWidth(type: kSizeTypeFill, unit: kSizeUnitNone, length: 0)
				case "wrap": self.setWidth(type: kSizeTypeWrap, unit: kSizeUnitNone, length: 0)
				default: break
			}

			return
		}

		if (value.type == .number) {

			switch (value.unit) {
				case .px: self.setWidth(type: kSizeTypeLength, unit: kSizeUnitPX, length: value.number)
				case .pc: self.setWidth(type: kSizeTypeLength, unit: kSizeUnitPC, length: value.number)
				case .vw: self.setWidth(type: kSizeTypeLength, unit: kSizeUnitVW, length: value.number)
				case .vh: self.setWidth(type: kSizeTypeLength, unit: kSizeUnitVH, length: value.number)
				case .pw: self.setWidth(type: kSizeTypeLength, unit: kSizeUnitPW, length: value.number)
				case .ph: self.setWidth(type: kSizeTypeLength, unit: kSizeUnitPH, length: value.number)
				case .cw: self.setWidth(type: kSizeTypeLength, unit: kSizeUnitVW, length: value.number)
				case .ch: self.setWidth(type: kSizeTypeLength, unit: kSizeUnitVH, length: value.number)
				default:  self.setWidth(type: kSizeTypeLength, unit: kSizeUnitPX, length: value.number)
			}

			return
		}

		fatalError("Invalid property type.")
	}

	/**
	 * Assigns the display node's width.
	 * @method setWidth
	 * @since 0.1.0
	 */
	public func setWidth(type: SizeType, unit: SizeUnit, length: Double) {
		DisplayNodeSetWidth(self.handle, type, unit, length)
	}

	/**
	 * Assigns the display node's minimum width.
	 * @method setMinWidth
	 * @since 0.1.0
	 */
	public func setMinWidth(_ min: Double) {
		DisplayNodeSetMinWidth(self.handle, min)
	}

	/**
	 * Assigns the display node's maximum width.
	 * @method setMaxWidth
	 * @since 0.1.0
	 */
	public func setMaxWidth(_ max: Double) {
		DisplayNodeSetMaxWidth(self.handle, max)
	}

	/**
	 * Assigns the display node's height.
	 * @method setHeight
	 * @since 0.1.0
	 */
	public func setHeight(_ value: JavaScriptProperty) {

		if (value.type == .string) {

			switch (value.string) {
				case "fill": self.setHeight(type: kSizeTypeFill, unit: kSizeUnitNone, length: 0)
				case "wrap": self.setHeight(type: kSizeTypeWrap, unit: kSizeUnitNone, length: 0)
				default: break
			}

			return
		}

		if (value.type == .number) {

			switch (value.unit) {
				case .px: self.setHeight(type: kSizeTypeLength, unit: kSizeUnitPX, length: value.number)
				case .pc: self.setHeight(type: kSizeTypeLength, unit: kSizeUnitPC, length: value.number)
				case .vw: self.setHeight(type: kSizeTypeLength, unit: kSizeUnitVW, length: value.number)
				case .vh: self.setHeight(type: kSizeTypeLength, unit: kSizeUnitVH, length: value.number)
				case .pw: self.setHeight(type: kSizeTypeLength, unit: kSizeUnitPW, length: value.number)
				case .ph: self.setHeight(type: kSizeTypeLength, unit: kSizeUnitPH, length: value.number)
				case .cw: self.setHeight(type: kSizeTypeLength, unit: kSizeUnitVW, length: value.number)
				case .ch: self.setHeight(type: kSizeTypeLength, unit: kSizeUnitVH, length: value.number)
				default:  self.setHeight(type: kSizeTypeLength, unit: kSizeUnitPX, length: value.number)
			}

			return
		}

		fatalError("Invalid property type.")
	}

	/**
	 * Assigns the display node's height.
	 * @method setHeight
	 * @since 0.1.0
	 */
	public func setHeight(type: SizeType, unit: SizeUnit, length: Double) {
		DisplayNodeSetHeight(self.handle, type, unit, length)
	}

	/**
	 * Assigns the display node's minimum height.
	 * @method setMinHeight
	 * @since 0.1.0
	 */
	public func setMinHeight(_ min: Double) {
		DisplayNodeSetMinHeight(self.handle, min)
	}

	/**
	 * Assigns the display node's maximum height.
	 * @method setMaxHeight
	 * @since 0.1.0
	 */
	public func setMaxHeight(_ max: Double) {
		DisplayNodeSetMaxHeight(self.handle, max)
	}

	/**
	 * Assigns the display node's content direction.
	 * @method setContentDirection
	 * @since 0.1.0
	 */
	public func setContentDirection(_ value: JavaScriptProperty) {

		if (value.type == .string) {

			switch (value.string) {
				case "horizontal": self.setContentDirection(kContentDirectionHorizontal)
				case "vertical":   self.setContentDirection(kContentDirectionVertical)
				default: break
			}

			return
		}

		fatalError("Invalid property type.")
	}

	/**
	 * Assigns the display node's content direction.
	 * @method setContentDirection
	 * @since 0.1.0
	 */
	public func setContentDirection(_ direction: ContentDirection) {
		DisplayNodeSetContentDirection(self.handle, direction)
	}

	/**
	 * Assigns the display node's content alignment.
	 * @method setContentAlignment
	 * @since 0.1.0
	 */
	public func setContentAlignment(_ value: JavaScriptProperty) {

		if (value.type == .string) {

			switch (value.string) {
				case "center": self.setContentAlignment(kContentAlignmentCenter)
				case "start":  self.setContentAlignment(kContentAlignmentStart)
				case "end":    self.setContentAlignment(kContentAlignmentEnd)
				default: break
			}

			return
		}

		fatalError("Invalid property type.")
	}

	/**
	 * Assigns the display node's content alignment.
	 * @method setContentAlignment
	 * @since 0.1.0
	 */
	public func setContentAlignment(_ contentAlignment: ContentAlignment) {
		DisplayNodeSetContentAlignment(self.handle, contentAlignment)
	}

	/**
	 * Assigns the display node's content disposition.
	 * @method setContentDisposition
	 * @since 0.1.0
	 */
	public func setContentDisposition(_ value: JavaScriptProperty) {

		if (value.type == .string) {

			switch (value.string) {
				case "center":        self.setContentDisposition(kContentDispositionCenter)
				case "start":         self.setContentDisposition(kContentDispositionStart)
				case "end":           self.setContentDisposition(kContentDispositionEnd)
				case "space-around":  self.setContentDisposition(kContentDispositionSpaceAround)
				case "space-evenly":  self.setContentDisposition(kContentDispositionSpaceEvenly)
				case "space-between": self.setContentDisposition(kContentDispositionSpaceBetween)
				default: break
			}

			return
		}

		fatalError("Invalid property type.")
	}

	/**
	 * Assigns the display node's content disposition.
	 * @method setContentDisposition
	 * @since 0.1.0
	 */
	public func setContentDisposition(_ contentDisposition: ContentDisposition) {
		DisplayNodeSetContentDisposition(self.handle, contentDisposition)
	}

	/**
	 * Assigns the display node's content top.
	 * @method setContentTop
	 * @since 0.1.0
	 */
	public func setContentTop(_ value: JavaScriptProperty) {

		if (value.type == .number) {

			switch (value.unit) {
				case .px: self.setContentTop(type: kContentOriginTypeLength, unit: kContentOriginUnitPX, length: value.number)
				default:  self.setContentTop(type: kContentOriginTypeLength, unit: kContentOriginUnitPX, length: value.number)
			}

			return
		}

		fatalError("Invalid property type.")
	}

	/**
	 * Assigns the display node's content top.
	 * @method setContentTop
	 * @since 0.1.0
	 */
	public func setContentTop(type: ContentOriginType, unit: ContentOriginUnit, length: Double) {
		DisplayNodeSetContentTop(self.handle, type, unit, length)
	}

	/**
	 * Assigns the display node's content left.
	 * @method setContentLeft
	 * @since 0.1.0
	 */
	public func setContentLeft(_ value: JavaScriptProperty) {

		if (value.type == .number) {

			switch (value.unit) {
				case .px: self.setContentLeft(type: kContentOriginTypeLength, unit: kContentOriginUnitPX, length: value.number)
				default:  self.setContentLeft(type: kContentOriginTypeLength, unit: kContentOriginUnitPX, length: value.number)
			}

			return
		}

		fatalError("Invalid property type.")
	}

	/**
	 * Assigns the display node's content left.
	 * @method setContentLeft
	 * @since 0.1.0
	 */
	public func setContentLeft(type: ContentOriginType, unit: ContentOriginUnit, length: Double) {
		DisplayNodeSetContentLeft(self.handle, type, unit, length)
	}

	/**
	 * Assigns the display node's content width.
	 * @method setContentWidth
	 * @since 0.1.0
	 */
	public func setContentWidth(_ value: JavaScriptProperty) {

		if (value.type == .string) {

			switch (value.string) {
				case "auto": self.setContentWidth(type: kContentSizeTypeAuto, unit: kContentSizeUnitNone, length: 0)
				default: break
			}

			return
		}

		if (value.type == .number) {

			switch (value.unit) {
				case .px: self.setContentWidth(type: kContentSizeTypeLength, unit: kContentSizeUnitPX, length: value.number)
				case .pc: self.setContentWidth(type: kContentSizeTypeLength, unit: kContentSizeUnitPC, length: value.number)
				case .vw: self.setContentWidth(type: kContentSizeTypeLength, unit: kContentSizeUnitVW, length: value.number)
				case .vh: self.setContentWidth(type: kContentSizeTypeLength, unit: kContentSizeUnitVH, length: value.number)
				case .pw: self.setContentWidth(type: kContentSizeTypeLength, unit: kContentSizeUnitPW, length: value.number)
				case .ph: self.setContentWidth(type: kContentSizeTypeLength, unit: kContentSizeUnitPH, length: value.number)
				case .cw: self.setContentWidth(type: kContentSizeTypeLength, unit: kContentSizeUnitCW, length: value.number)
				case .ch: self.setContentWidth(type: kContentSizeTypeLength, unit: kContentSizeUnitCH, length: value.number)
				default:  self.setContentWidth(type: kContentSizeTypeLength, unit: kContentSizeUnitPX, length: value.number)
			}

			return
		}

		fatalError("Invalid property type.")
	}

	/**
	 * Assigns the display node's content width.
	 * @method setContentWidth
	 * @since 0.1.0
	 */
	public func setContentWidth(type: ContentSizeType, unit: ContentSizeUnit, length: Double) {
		DisplayNodeSetContentWidth(self.handle, type, unit, length)
	}

	/**
	 * Assigns the display node's content height.
	 * @method setContentHeight
	 * @since 0.1.0
	 */
	public func setContentHeight(_ value: JavaScriptProperty) {

		if (value.type == .string) {

			switch (value.string) {
				case "auto": self.setContentHeight(type: kContentSizeTypeAuto, unit: kContentSizeUnitNone, length: 0)
				default: break
			}

			return
		}

		if (value.type == .number) {

			switch (value.unit) {
				case .px: self.setContentHeight(type: kContentSizeTypeLength, unit: kContentSizeUnitPX, length: value.number)
				case .pc: self.setContentHeight(type: kContentSizeTypeLength, unit: kContentSizeUnitPC, length: value.number)
				case .vw: self.setContentHeight(type: kContentSizeTypeLength, unit: kContentSizeUnitVW, length: value.number)
				case .vh: self.setContentHeight(type: kContentSizeTypeLength, unit: kContentSizeUnitVH, length: value.number)
				case .pw: self.setContentHeight(type: kContentSizeTypeLength, unit: kContentSizeUnitPW, length: value.number)
				case .ph: self.setContentHeight(type: kContentSizeTypeLength, unit: kContentSizeUnitPH, length: value.number)
				case .cw: self.setContentHeight(type: kContentSizeTypeLength, unit: kContentSizeUnitCW, length: value.number)
				case .ch: self.setContentHeight(type: kContentSizeTypeLength, unit: kContentSizeUnitCH, length: value.number)
				default:  self.setContentHeight(type: kContentSizeTypeLength, unit: kContentSizeUnitPX, length: value.number)
			}

			return
		}

		fatalError("Invalid property type.")
	}

	/**
	 * Assigns the display node's content height.
	 * @method setContentHeight
	 * @since 0.1.0
	 */
	public func setContentHeight(type: ContentSizeType, unit: ContentSizeUnit, length: Double) {
		DisplayNodeSetContentHeight(self.handle, type, unit, length)
	}

	/**
	 * Assigns the display node's top border width.
	 * @method setBorderTop
	 * @since 0.1.0
	 */
	public func setBorderTop(_ value: JavaScriptProperty) {

		if (value.type == .string) {

			switch (value.string) {
				case "thin": self.setBorderTop(type: kBorderTypeLength, unit: kBorderUnitPX, length: Double(1 / UIScreen.main.scale))
				default: break
			}

			return
		}

		if (value.type == .number) {

			switch (value.unit) {
				case .px: self.setBorderTop(type: kBorderTypeLength, unit: kBorderUnitPX, length: value.number)
				case .pc: self.setBorderTop(type: kBorderTypeLength, unit: kBorderUnitPC, length: value.number)
				case .vw: self.setBorderTop(type: kBorderTypeLength, unit: kBorderUnitVW, length: value.number)
				case .vh: self.setBorderTop(type: kBorderTypeLength, unit: kBorderUnitVH, length: value.number)
				case .pw: self.setBorderTop(type: kBorderTypeLength, unit: kBorderUnitVW, length: value.number)
				case .ph: self.setBorderTop(type: kBorderTypeLength, unit: kBorderUnitVH, length: value.number)
				case .cw: self.setBorderTop(type: kBorderTypeLength, unit: kBorderUnitCW, length: value.number)
				case .ch: self.setBorderTop(type: kBorderTypeLength, unit: kBorderUnitCH, length: value.number)
				default:  self.setBorderTop(type: kBorderTypeLength, unit: kBorderUnitPX, length: value.number)
			}

			return
		}

		fatalError("Invalid property type.")
	}

	/**
	 * Assigns the display node's top border width.
	 * @method setBorderTop
	 * @since 0.1.0
	 */
	public func setBorderTop(type: BorderType, unit: BorderUnit, length: Double) {
		DisplayNodeSetBorderTop(self.handle, type, unit, length)
	}

	/**
	 * Assigns the display node's left border width.
	 * @method setBorderLeft
	 * @since 0.1.0
	 */
	public func setBorderLeft(_ value: JavaScriptProperty) {

		if (value.type == .string) {

			switch (value.string) {
				case "thin": self.setBorderLeft(type: kBorderTypeLength, unit: kBorderUnitPX, length: Double(1 / UIScreen.main.scale))
				default: break
			}

			return
		}

		if (value.type == .number) {

			switch (value.unit) {
				case .px: self.setBorderLeft(type: kBorderTypeLength, unit: kBorderUnitPX, length: value.number)
				case .pc: self.setBorderLeft(type: kBorderTypeLength, unit: kBorderUnitPC, length: value.number)
				case .vw: self.setBorderLeft(type: kBorderTypeLength, unit: kBorderUnitVW, length: value.number)
				case .vh: self.setBorderLeft(type: kBorderTypeLength, unit: kBorderUnitVH, length: value.number)
				case .pw: self.setBorderLeft(type: kBorderTypeLength, unit: kBorderUnitVW, length: value.number)
				case .ph: self.setBorderLeft(type: kBorderTypeLength, unit: kBorderUnitVH, length: value.number)
				case .cw: self.setBorderLeft(type: kBorderTypeLength, unit: kBorderUnitCW, length: value.number)
				case .ch: self.setBorderLeft(type: kBorderTypeLength, unit: kBorderUnitCH, length: value.number)
				default:  self.setBorderLeft(type: kBorderTypeLength, unit: kBorderUnitPX, length: value.number)
			}

			return
		}

		fatalError("Invalid property type.")
	}

	/**
	 * Assigns the display node's left border width.
	 * @method setBorderLeft
	 * @since 0.1.0
	 */
	public func setBorderLeft(type: BorderType, unit: BorderUnit, length: Double) {
		DisplayNodeSetBorderLeft(self.handle, type, unit, length)
	}

	/**
	 * Assigns the display node's right border width.
	 * @method setBorderRight
	 * @since 0.1.0
	 */
	public func setBorderRight(_ value: JavaScriptProperty) {

		if (value.type == .string) {

			switch (value.string) {
				case "thin": self.setBorderRight(type: kBorderTypeLength, unit: kBorderUnitPX, length: Double(1 / UIScreen.main.scale))
				default: break
			}

			return
		}

		if (value.type == .number) {

			switch (value.unit) {
				case .px: self.setBorderRight(type: kBorderTypeLength, unit: kBorderUnitPX, length: value.number)
				case .pc: self.setBorderRight(type: kBorderTypeLength, unit: kBorderUnitPC, length: value.number)
				case .vw: self.setBorderRight(type: kBorderTypeLength, unit: kBorderUnitVW, length: value.number)
				case .vh: self.setBorderRight(type: kBorderTypeLength, unit: kBorderUnitVH, length: value.number)
				case .pw: self.setBorderRight(type: kBorderTypeLength, unit: kBorderUnitVW, length: value.number)
				case .ph: self.setBorderRight(type: kBorderTypeLength, unit: kBorderUnitVH, length: value.number)
				case .cw: self.setBorderRight(type: kBorderTypeLength, unit: kBorderUnitCW, length: value.number)
				case .ch: self.setBorderRight(type: kBorderTypeLength, unit: kBorderUnitCH, length: value.number)
				default:  self.setBorderRight(type: kBorderTypeLength, unit: kBorderUnitPX, length: value.number)
			}

			return
		}

		fatalError("Invalid property type.")
	}

	/**
	 * Assigns the display node's right border width.
	 * @method setBorderRight
	 * @since 0.1.0
	 */
	public func setBorderRight(type: BorderType, unit: BorderUnit, length: Double) {
		DisplayNodeSetBorderRight(self.handle, type, unit, length)
	}

	/**
	 * Assigns the display node's bottom border width.
	 * @method setBorderBottom
	 * @since 0.1.0
	 */
	public func setBorderBottom(_ value: JavaScriptProperty) {

		if (value.type == .string) {

			switch (value.string) {
				case "thin": self.setBorderBottom(type: kBorderTypeLength, unit: kBorderUnitPX, length: Double(1 / UIScreen.main.scale))
				default: break
			}

			return
		}

		if (value.type == .number) {

			switch (value.unit) {
				case .px: self.setBorderBottom(type: kBorderTypeLength, unit: kBorderUnitPX, length: value.number)
				case .pc: self.setBorderBottom(type: kBorderTypeLength, unit: kBorderUnitPC, length: value.number)
				case .vw: self.setBorderBottom(type: kBorderTypeLength, unit: kBorderUnitVW, length: value.number)
				case .vh: self.setBorderBottom(type: kBorderTypeLength, unit: kBorderUnitVH, length: value.number)
				case .pw: self.setBorderBottom(type: kBorderTypeLength, unit: kBorderUnitVW, length: value.number)
				case .ph: self.setBorderBottom(type: kBorderTypeLength, unit: kBorderUnitVH, length: value.number)
				case .cw: self.setBorderBottom(type: kBorderTypeLength, unit: kBorderUnitCW, length: value.number)
				case .ch: self.setBorderBottom(type: kBorderTypeLength, unit: kBorderUnitCH, length: value.number)
				default:  self.setBorderBottom(type: kBorderTypeLength, unit: kBorderUnitPX, length: value.number)
			}

			return
		}

		fatalError("Invalid property type.")
	}

	/**
	 * Assigns the display node's bottom border width.
	 * @method setBorderBottom
	 * @since 0.1.0
	 */
	public func setBorderBottom(type: BorderType, unit: BorderUnit, length: Double) {
		DisplayNodeSetBorderBottom(self.handle, type, unit, length)
	}

	/**
	 * Assigns the display node's top margin.
	 * @method setMarginTop
	 * @since 0.1.0
	 */
	public func setMarginTop(_ value: JavaScriptProperty) {

		if (value.type == .number) {

			switch (value.unit) {
				case .px: self.setMarginTop(type: kMarginTypeLength, unit: kMarginUnitPX, length: value.number)
				case .pc: self.setMarginTop(type: kMarginTypeLength, unit: kMarginUnitPC, length: value.number)
				case .vw: self.setMarginTop(type: kMarginTypeLength, unit: kMarginUnitVW, length: value.number)
				case .vh: self.setMarginTop(type: kMarginTypeLength, unit: kMarginUnitVH, length: value.number)
				case .pw: self.setMarginTop(type: kMarginTypeLength, unit: kMarginUnitPW, length: value.number)
				case .ph: self.setMarginTop(type: kMarginTypeLength, unit: kMarginUnitPH, length: value.number)
				case .cw: self.setMarginTop(type: kMarginTypeLength, unit: kMarginUnitVW, length: value.number)
				case .ch: self.setMarginTop(type: kMarginTypeLength, unit: kMarginUnitVH, length: value.number)
				default:  self.setMarginTop(type: kMarginTypeLength, unit: kMarginUnitPX, length: value.number)
			}

			return
		}

		fatalError("Invalid property type.")
	}

	/**
	 * Assigns the display node's top margin.
	 * @method setMarginTop
	 * @since 0.1.0
	 */
	public func setMarginTop(type: MarginType, unit: MarginUnit, length: Double) {
		DisplayNodeSetMarginTop(self.handle, type, unit, length)
	}

	/**
	 * Assigns the display node's left margin.
	 * @method setMarginLeft
	 * @since 0.1.0
	 */
	public func setMarginLeft(_ value: JavaScriptProperty) {

		if (value.type == .number) {

			switch (value.unit) {
				case .px: self.setMarginLeft(type: kMarginTypeLength, unit: kMarginUnitPX, length: value.number)
				case .pc: self.setMarginLeft(type: kMarginTypeLength, unit: kMarginUnitPC, length: value.number)
				case .vw: self.setMarginLeft(type: kMarginTypeLength, unit: kMarginUnitVW, length: value.number)
				case .vh: self.setMarginLeft(type: kMarginTypeLength, unit: kMarginUnitVH, length: value.number)
				case .pw: self.setMarginLeft(type: kMarginTypeLength, unit: kMarginUnitPW, length: value.number)
				case .ph: self.setMarginLeft(type: kMarginTypeLength, unit: kMarginUnitPH, length: value.number)
				case .cw: self.setMarginLeft(type: kMarginTypeLength, unit: kMarginUnitVW, length: value.number)
				case .ch: self.setMarginLeft(type: kMarginTypeLength, unit: kMarginUnitVH, length: value.number)
				default:  self.setMarginLeft(type: kMarginTypeLength, unit: kMarginUnitPX, length: value.number)
			}

			return
		}

		fatalError("Invalid property type.")
	}

	/**
	 * Assigns the display node's left margin.
	 * @method setMarginLeft
	 * @since 0.1.0
	 */
	public func setMarginLeft(type: MarginType, unit: MarginUnit, length: Double) {
		DisplayNodeSetMarginLeft(self.handle, type, unit, length)
	}

	/**
	 * Assigns the display node's right margin.
	 * @method setMarginRight
	 * @since 0.1.0
	 */
	public func setMarginRight(_ value: JavaScriptProperty) {

		if (value.type == .number) {

			switch (value.unit) {
				case .px: self.setMarginRight(type: kMarginTypeLength, unit: kMarginUnitPX, length: value.number)
				case .pc: self.setMarginRight(type: kMarginTypeLength, unit: kMarginUnitPC, length: value.number)
				case .vw: self.setMarginRight(type: kMarginTypeLength, unit: kMarginUnitVW, length: value.number)
				case .vh: self.setMarginRight(type: kMarginTypeLength, unit: kMarginUnitVH, length: value.number)
				case .pw: self.setMarginRight(type: kMarginTypeLength, unit: kMarginUnitPW, length: value.number)
				case .ph: self.setMarginRight(type: kMarginTypeLength, unit: kMarginUnitPH, length: value.number)
				case .cw: self.setMarginRight(type: kMarginTypeLength, unit: kMarginUnitVW, length: value.number)
				case .ch: self.setMarginRight(type: kMarginTypeLength, unit: kMarginUnitVH, length: value.number)
				default:  self.setMarginRight(type: kMarginTypeLength, unit: kMarginUnitPX, length: value.number)
			}

			return
		}

		fatalError("Invalid property type.")
	}

	/**
	 * Assigns the display node's right margin.
	 * @method setMarginRight
	 * @since 0.1.0
	 */
	public func setMarginRight(type: MarginType, unit: MarginUnit, length: Double) {
		DisplayNodeSetMarginRight(self.handle, type, unit, length)
	}

	/**
	 * Assigns the display node's bottom margin.
	 * @method setMarginBottom
	 * @since 0.1.0
	 */
	public func setMarginBottom(_ value: JavaScriptProperty) {

		if (value.type == .number) {

			switch (value.unit) {
				case .px: self.setMarginBottom(type: kMarginTypeLength, unit: kMarginUnitPX, length: value.number)
				case .pc: self.setMarginBottom(type: kMarginTypeLength, unit: kMarginUnitPC, length: value.number)
				case .vw: self.setMarginBottom(type: kMarginTypeLength, unit: kMarginUnitVW, length: value.number)
				case .vh: self.setMarginBottom(type: kMarginTypeLength, unit: kMarginUnitVH, length: value.number)
				case .pw: self.setMarginBottom(type: kMarginTypeLength, unit: kMarginUnitPW, length: value.number)
				case .ph: self.setMarginBottom(type: kMarginTypeLength, unit: kMarginUnitPH, length: value.number)
				case .cw: self.setMarginBottom(type: kMarginTypeLength, unit: kMarginUnitVW, length: value.number)
				case .ch: self.setMarginBottom(type: kMarginTypeLength, unit: kMarginUnitVH, length: value.number)
				default:  self.setMarginBottom(type: kMarginTypeLength, unit: kMarginUnitPX, length: value.number)
			}

			return
		}

		fatalError("Invalid property type.")
	}

	/**
	 * Assigns the display node's bottom margin.
	 * @method setMarginBottom
	 * @since 0.1.0
	 */
	public func setMarginBottom(type: MarginType, unit: MarginUnit, length: Double) {
		DisplayNodeSetMarginBottom(self.handle, type, unit, length)
	}

	/**
	 * Assigns the display node's minimum top margin.
	 * @method setMinMarginTop
	 * @since 0.1.0
	 */
	public func setMinMarginTop(_ min: Double) {
		DisplayNodeSetMinMarginTop(self.handle, min)
	}

	/**
	 * Assigns the display node's maximum top margin.
	 * @method setMaxMarginTop
	 * @since 0.1.0
	 */
	public func setMaxMarginTop(_ max: Double) {
		DisplayNodeSetMinMarginTop(self.handle, max)
	}

	/**
	 * Assigns the display node's minimum left margin.
	 * @method setMinMarginLeft
	 * @since 0.1.0
	 */
	public func setMinMarginLeft(_ min: Double) {
		DisplayNodeSetMinMarginLeft(self.handle, min)
	}

	/**
	 * Assigns the display node's maximum left margin.
	 * @method setMaxMarginLeft
	 * @since 0.1.0
	 */
	public func setMaxMarginLeft(_ max: Double) {
		DisplayNodeSetMinMarginLeft(self.handle, max)
	}

	/**
	 * Assigns the display node's minimum right margin.
	 * @method setMinMarginRight
	 * @since 0.1.0
	 */
	public func setMinMarginRight(_ min: Double) {
		DisplayNodeSetMinMarginRight(self.handle, min)
	}

	/**
	 * Assigns the display node's maximum right margin.
	 * @method setMaxMarginRight
	 * @since 0.1.0
	 */
	public func setMaxMarginRight(_ max: Double) {
		DisplayNodeSetMaxMarginRight(self.handle, max)
	}

	/**
	 * Assigns the display node's minimum bottom margin.
	 * @method setMinMarginBottom
	 * @since 0.1.0
	 */
	public func setMinMarginBottom(_ min: Double) {
		DisplayNodeSetMinMarginBottom(self.handle, min)
	}

	/**
	 * Assigns the display node's maximum bottom margin.
	 * @method setMaxMarginBottom
	 * @since 0.1.0
	 */
	public func setMaxMarginBottom(_ max: Double) {
		DisplayNodeSetMinMarginBottom(self.handle, max)
	}

	/**
	 * Assigns the display node's top padding.
	 * @method setPaddingTop
	 * @since 0.1.0
	 */
	public func setPaddingTop(_ value: JavaScriptProperty) {

		if (value.type == .number) {

			switch (value.unit) {
				case .px: self.setPaddingTop(type: kPaddingTypeLength, unit: kPaddingUnitPX, length: value.number)
				case .pc: self.setPaddingTop(type: kPaddingTypeLength, unit: kPaddingUnitPC, length: value.number)
				case .vw: self.setPaddingTop(type: kPaddingTypeLength, unit: kPaddingUnitVW, length: value.number)
				case .vh: self.setPaddingTop(type: kPaddingTypeLength, unit: kPaddingUnitVH, length: value.number)
				case .pw: self.setPaddingTop(type: kPaddingTypeLength, unit: kPaddingUnitPW, length: value.number)
				case .ph: self.setPaddingTop(type: kPaddingTypeLength, unit: kPaddingUnitPH, length: value.number)
				case .cw: self.setPaddingTop(type: kPaddingTypeLength, unit: kPaddingUnitCW, length: value.number)
				case .ch: self.setPaddingTop(type: kPaddingTypeLength, unit: kPaddingUnitCH, length: value.number)
				default:  self.setPaddingTop(type: kPaddingTypeLength, unit: kPaddingUnitPX, length: value.number)
			}

			return
		}

		fatalError("Invalid property type \(value.string).")
	}

	/**
	 * Assigns the display node's top padding.
	 * @method setPaddingTop
	 * @since 0.1.0
	 */
	public func setPaddingTop(type: PaddingType, unit: PaddingUnit, length: Double) {
		DisplayNodeSetPaddingTop(self.handle, type, unit, length)
	}

	/**
	 * Assigns the display node's left padding.
	 * @method setPaddingLeft
	 * @since 0.1.0
	 */
	public func setPaddingLeft(_ value: JavaScriptProperty) {

		if (value.type == .number) {

			switch (value.unit) {
				case .px: self.setPaddingLeft(type: kPaddingTypeLength, unit: kPaddingUnitPX, length: value.number)
				case .pc: self.setPaddingLeft(type: kPaddingTypeLength, unit: kPaddingUnitPC, length: value.number)
				case .vw: self.setPaddingLeft(type: kPaddingTypeLength, unit: kPaddingUnitVW, length: value.number)
				case .vh: self.setPaddingLeft(type: kPaddingTypeLength, unit: kPaddingUnitVH, length: value.number)
				case .pw: self.setPaddingLeft(type: kPaddingTypeLength, unit: kPaddingUnitPW, length: value.number)
				case .ph: self.setPaddingLeft(type: kPaddingTypeLength, unit: kPaddingUnitPH, length: value.number)
				case .cw: self.setPaddingLeft(type: kPaddingTypeLength, unit: kPaddingUnitCW, length: value.number)
				case .ch: self.setPaddingLeft(type: kPaddingTypeLength, unit: kPaddingUnitCH, length: value.number)
				default:  self.setPaddingLeft(type: kPaddingTypeLength, unit: kPaddingUnitPX, length: value.number)
			}

			return
		}

		fatalError("Invalid property type.")
	}

	/**
	 * Assigns the display node's left padding.
	 * @method setPaddingLeft
	 * @since 0.1.0
	 */
	public func setPaddingLeft(type: PaddingType, unit: PaddingUnit, length: Double) {
		DisplayNodeSetPaddingLeft(self.handle, type, unit, length)
	}

	/**
	 * Assigns the display node's right padding.
	 * @method setPaddingRight
	 * @since 0.1.0
	 */
	public func setPaddingRight(_ value: JavaScriptProperty) {

		if (value.type == .number) {

			switch (value.unit) {
				case .px: self.setPaddingRight(type: kPaddingTypeLength, unit: kPaddingUnitPX, length: value.number)
				case .pc: self.setPaddingRight(type: kPaddingTypeLength, unit: kPaddingUnitPC, length: value.number)
				case .vw: self.setPaddingRight(type: kPaddingTypeLength, unit: kPaddingUnitVW, length: value.number)
				case .vh: self.setPaddingRight(type: kPaddingTypeLength, unit: kPaddingUnitVH, length: value.number)
				case .pw: self.setPaddingRight(type: kPaddingTypeLength, unit: kPaddingUnitPW, length: value.number)
				case .ph: self.setPaddingRight(type: kPaddingTypeLength, unit: kPaddingUnitPH, length: value.number)
				case .cw: self.setPaddingRight(type: kPaddingTypeLength, unit: kPaddingUnitCW, length: value.number)
				case .ch: self.setPaddingRight(type: kPaddingTypeLength, unit: kPaddingUnitCH, length: value.number)
				default:  self.setPaddingRight(type: kPaddingTypeLength, unit: kPaddingUnitPX, length: value.number)
			}

			return
		}

		fatalError("Invalid property type.")
	}

	/**
	 * Assigns the display node's right padding.
	 * @method setPaddingRight
	 * @since 0.1.0
	 */
	public func setPaddingRight(type: PaddingType, unit: PaddingUnit, length: Double) {
		DisplayNodeSetPaddingRight(self.handle, type, unit, length)
	}

	/**
	 * Assigns the display node's bottom padding.
	 * @method setPaddingBottom
	 * @since 0.1.0
	 */
	public func setPaddingBottom(_ value: JavaScriptProperty) {

		if (value.type == .number) {

			switch (value.unit) {
				case .px: self.setPaddingBottom(type: kPaddingTypeLength, unit: kPaddingUnitPX, length: value.number)
				case .pc: self.setPaddingBottom(type: kPaddingTypeLength, unit: kPaddingUnitPC, length: value.number)
				case .vw: self.setPaddingBottom(type: kPaddingTypeLength, unit: kPaddingUnitVW, length: value.number)
				case .vh: self.setPaddingBottom(type: kPaddingTypeLength, unit: kPaddingUnitVH, length: value.number)
				case .pw: self.setPaddingBottom(type: kPaddingTypeLength, unit: kPaddingUnitPW, length: value.number)
				case .ph: self.setPaddingBottom(type: kPaddingTypeLength, unit: kPaddingUnitPH, length: value.number)
				case .cw: self.setPaddingBottom(type: kPaddingTypeLength, unit: kPaddingUnitCW, length: value.number)
				case .ch: self.setPaddingBottom(type: kPaddingTypeLength, unit: kPaddingUnitCH, length: value.number)
				default:  self.setPaddingBottom(type: kPaddingTypeLength, unit: kPaddingUnitPX, length: value.number)
			}

			return
		}

		fatalError("Invalid property type.")
	}

	/**
	 * Assigns the display node's bottom padding.
	 * @method setPaddingBottom
	 * @since 0.1.0
	 */
	public func setPaddingBottom(type: PaddingType, unit: PaddingUnit, length: Double) {
		DisplayNodeSetPaddingBottom(self.handle, type, unit, length)
	}

	/**
	 * Assigns the display node's minimum top padding.
	 * @method setMinPaddingTop
	 * @since 0.1.0
	 */
	public func setMinPaddingTop(_ min: Double) {
		DisplayNodeSetMinPaddingTop(self.handle, min)
	}

	/**
	 * Assigns the display node's maximum top padding.
	 * @method setMaxPaddingTop
	 * @since 0.1.0
	 */
	public func setMaxPaddingTop(_ max: Double) {
		DisplayNodeSetMaxPaddingTop(self.handle, max)
	}

	/**
	 * Assigns the display node's minimum left padding.
	 * @method setMinPaddingLeft
	 * @since 0.1.0
	 */
	public func setMinPaddingLeft(_ min: Double) {
		DisplayNodeSetMinPaddingLeft(self.handle, min)
	}

	/**
	 * Assigns the display node's maximum left padding.
	 * @method setMaxPaddingLeft
	 * @since 0.1.0
	 */
	public func setMaxPaddingLeft(_ max: Double) {
		DisplayNodeSetMaxPaddingLeft(self.handle, max)
	}

	/**
	 * Assigns the display node's minimum right padding.
	 * @method setMinPaddingRight
	 * @since 0.1.0
	 */
	public func setMinPaddingRight(_ min: Double) {
		DisplayNodeSetMinPaddingRight(self.handle, min)
	}

	/**
	 * Assigns the display node's maximum right padding.
	 * @method setMaxPaddingRight
	 * @since 0.1.0
	 */
	public func setMaxPaddingRight(_ max: Double) {
		DisplayNodeSetMaxPaddingRight(self.handle, max)
	}

	/**
	 * Assigns the display node's minimum bottom padding.
	 * @method setMinPaddingBottom
	 * @since 0.1.0
	 */
	public func setMinPaddingBottom(_ min: Double) {
		DisplayNodeSetMinPaddingBottom(self.handle, min)
	}

	/**
	 * Assigns the display node's maximum bottom padding.
	 * @method setMaxPaddingBottom
	 * @since 0.1.0
	 */
	public func setMaxPaddingBottom(_ max: Double) {
		DisplayNodeSetMaxPaddingBottom(self.handle, max)
	}

	/**
	 * Assigns the display node's expand factor.
	 * @method setExpandFactor
	 * @since 0.1.0
	 */
	public func setExpandFactor(_ factor: Double) {
		DisplayNodeSetExpandFactor(self.handle, factor)
	}

	/**
	 * Assigns the display node's shrink factor.
	 * @method setShrinkFactor
	 * @since 0.1.0
	 */
	public func setShrinkFactor(_ factor: Double) {
		DisplayNodeSetShrinkFactor(self.handle, factor)
	}

	/**
	 * Assigns the display node's visibility status.
	 * @method setVisible
	 * @since 0.1.0
	 */
	public func setVisible(_ visible: Bool) {
		DisplayNodeSetVisible(self.handle, visible);
	}

	/**
	 * Invalidates the display node's size.
	 * @method invalidateSize
	 * @since 0.1.0
	 */
	public func invalidateSize() {
		DisplayNodeInvalidateSize(self.handle)
	}

	/**
	 * Invalidates the display node's origin.
	 * @method invalidateOrigin
	 * @since 0.1.0
	 */
	public func invalidateOrigin() {
		DisplayNodeInvalidateOrigin(self.handle)
	}

	/**
	 * Invalidates the display node's layout.
	 * @method invalidateLayout
	 * @since 0.1.0
	 */
	public func invalidateLayout() {
		DisplayNodeInvalidateLayout(self.handle)
	}

	/**
	 * Appends a child display node.
	 * @method appendChild
	 * @since 0.1.0
	 */
	public func appendChild(_ node: DisplayNode) {
		DisplayNodeAppendChild(self.handle, node.handle)
	}

	/**
	 * Inserts a child display node.
	 * @method insertChild
	 * @since 0.1.0
	 */
	public func insertChild(_ node: DisplayNode, at: Int) {
		DisplayNodeInsertChild(self.handle, node.handle, Int32(at))
	}

	/**
	 * Removes a child display node.
	 * @method removeChild
	 * @since 0.1.0
	 */
	public func removeChild(_ node: DisplayNode) {
		DisplayNodeRemoveChild(self.handle, node.handle)
	}

	/**
	 * Measures this display node only.
	 * @method measure
	 * @since 0.1.0
	 */
	public func measure() {
		DisplayNodeMeasure(self.handle)
	}

	/**
	 * Resolves this display node and the whole hierarchy.
	 * @method resolve
	 * @since 0.1.0
	 */
	public func resolve() {
		DisplayNodeResolve(self.handle)
	}

	/**
	 * Resolves the styles and states of this one node.
	 * @method resolveTraits
	 * @since 0.1.0
	 */
	public func resolveTraits() {
		DisplayNodeResolveTraits(self.handle)
	}

	/**
	 * Resolves the layout of this one node.
	 * @method resoleLayout
	 * @since 0.1.0
	 */
	public func resolveLayout() {
		DisplayNodeResolveLayout(self.handle)
	}

	//--------------------------------------------------------------------------
	// MARK: Internal API
	//--------------------------------------------------------------------------

	/**
	 * @method didInvalidate
	 * @since 0.1.0
	 * @hidden
	 */
	internal func didInvalidate() {
		self.delegate?.didInvalidate(node: self)
	}

	/**
	 * @method didResolveSize
	 * @since 0.1.0
	 * @hidden
	 */
	internal func didResolveSize() {
		self.delegate?.didResolveSize(node: self)
	}

	/**
	 * @method didResolveOrigin
	 * @since 0.1.0
	 * @hidden
	 */
	internal func didResolveOrigin() {
		self.delegate?.didResolveOrigin(node: self)
	}

	/**
	 * @method didResolveInnerSize
	 * @since 0.1.0
	 * @hidden
	 */
	internal func didResolveInnerSize() {
		self.delegate?.didResolveInnerSize(node: self)
	}

	/**
	 * @method didResolveContentSize
	 * @since 0.1.0
	 * @hidden
	 */
	internal func didResolveContentSize() {
		self.delegate?.didResolveContentSize(node: self)
	}

	/**
	 * @method didResolveMargins
	 * @since 0.1.0
	 * @hidden
	 */
	internal func didResolveMargins() {
		self.delegate?.didResolveMargins(node: self)
	}

	/**
	 * @method didResolveBorders
	 * @since 0.1.0
	 * @hidden
	 */
	internal func didResolveBorders() {
		self.delegate?.didResolveBorders(node: self)
	}

	/**
	 * @method didResolvePadding
	 * @since 0.1.0
	 * @hidden
	 */
	internal func didResolvePadding() {
		self.delegate?.didResolvePadding(node: self)
	}

	/**
	 * @method didPrepareLayout
	 * @since 0.1.0
	 * @hidden
	 */
	internal func didPrepareLayout() {
		self.delegate?.didPrepareLayout(node: self)
	}

	/**
	 * @method didResolveLayout
	 * @since 0.1.0
	 * @hidden
	 */
	internal func didResolveLayout() {
		self.delegate?.didResolveLayout(node: self)
	}

	/**
	 * @method measure
	 * @since 0.1.0
	 * @hidden
	 */
	internal func measure(in rect: CGSize, min: CGSize, max: CGSize) -> CGSize? {
		return self.delegate?.measure(node: self, bounds: rect, min: min, max: max)
	}

	/**
	 * @method update
	 * @since 0.1.0
	 * @hidden
	 */
	internal func update(name: String, property: PropertyRef?) {

		guard let holder = self.delegate?.resolve(node: self, property: name) else {
			return
		}

		if (property == nil) {
			holder.reset(lock: nil, initial: true)
			return
		}

		holder.reset(PropertyGetValues(property), lock: nil)
	}
}

/**
 * @const displayNodeInvalidateCallback
 * @since 0.1.0
 * @hidden
 */
private let displayNodeInvalidateCallback: @convention(c) (DisplayNodeRef?) -> Void = { ptr in
	if let node = DisplayNodeGetData(ptr).value as? DisplayNode {
		node.didInvalidate()
	}
}

/**
 * @const displayNodeResolveSizeCallback
 * @since 0.1.0
 * @hidden
 */
private let displayNodeResolveSizeCallback: @convention(c) (DisplayNodeRef?) -> Void = { ptr in
	if let node = DisplayNodeGetData(ptr).value as? DisplayNode {
		node.didResolveSize()
	}
}

/**
 * @const displayNodeResolveOriginCallback
 * @since 0.1.0
 * @hidden
 */
private let displayNodeResolveOriginCallback: @convention(c) (DisplayNodeRef?) -> Void = { ptr in
	if let node = DisplayNodeGetData(ptr).value as? DisplayNode {
		node.didResolveOrigin()
	}
}

/**
 * @const displayNodeResolveInnerSizeCallback
 * @since 0.1.0
 * @hidden
 */
private let displayNodeResolveInnerSizeCallback: @convention(c) (DisplayNodeRef?) -> Void = { ptr in
	if let node = DisplayNodeGetData(ptr).value as? DisplayNode {
		node.didResolveInnerSize()
	}
}

/**
 * @const displayNodeResolveContentSizeCallback
 * @since 0.1.0
 * @hidden
 */
private let displayNodeResolveContentSizeCallback: @convention(c) (DisplayNodeRef?) -> Void = { ptr in
	if let node = DisplayNodeGetData(ptr).value as? DisplayNode {
		node.didResolveContentSize()
	}
}

/**
 * @const displayNodeResolveMarginsCallback
 * @since 0.1.0
 * @hidden
 */
private let displayNodeResolveMarginsCallback: @convention(c) (DisplayNodeRef?) -> Void = { ptr in
	if let node = DisplayNodeGetData(ptr).value as? DisplayNode {
		node.didResolveMargins()
	}
}

/**
 * @const displayNodeResolveBordersCallback
 * @since 0.1.0
 * @hidden
 */
private let displayNodeResolveBordersCallback: @convention(c) (DisplayNodeRef?) -> Void = { ptr in
	if let node = DisplayNodeGetData(ptr).value as? DisplayNode {
		node.didResolveBorders()
	}
}

/**
 * @const displayNodeResolvePaddingCallback
 * @since 0.1.0
 * @hidden
 */
private let displayNodeResolvePaddingCallback: @convention(c) (DisplayNodeRef?) -> Void = { ptr in
	if let node = DisplayNodeGetData(ptr).value as? DisplayNode {
		node.didResolvePadding()
	}
}

/**
 * @const displayNodePrepareLayoutCallback
 * @since 0.1.0
 * @hidden
 */
private let displayNodePrepareLayoutCallback: @convention(c) (DisplayNodeRef?) -> Void = { ptr in
	if let node = DisplayNodeGetData(ptr).value as? DisplayNode {
		node.didPrepareLayout()
	}
}

/**
 * @const displayNodeResolveLayoutCallback
 * @since 0.1.0
 * @hidden
 */
private let displayNodeResolveLayoutCallback: @convention(c) (DisplayNodeRef?) -> Void = { ptr in
	if let node = DisplayNodeGetData(ptr).value as? DisplayNode {
		node.didResolveLayout()
	}
}

/**
 * @const displayNodeMeasureCallback
 * @since 0.1.0
 * @hidden
 */
private let displayNodeMeasureCallback: @convention(c) (DisplayNodeRef?, UnsafeMutablePointer<MeasuredSize>?, Double, Double, Double, Double, Double, Double) -> Void = { (ptr, res, w, h, minw, maxw, minh, maxh) in

	if let node = DisplayNodeGetData(ptr).value as? DisplayNode {

		let min = CGSize(width: minw, height: minh)
		let max = CGSize(width: maxw, height: maxh)
		let bounds = CGSize(width: w, height: h)

		if let size = node.measure(in: bounds, min: min, max: max), let res = res {
			res.pointee.width = Double(size.width)
			res.pointee.height = Double(size.height)
		}
	}
}

/**
 * @const PropertySetterCallback
 * @since 0.1.0
 * @hidden
 */
private let displayNodeUpdateCallback: @convention(c) (DisplayNodeRef?, PropertyRef?, UnsafePointer<Int8>?) -> Void = { ptr, property, name in
	if let node = DisplayNodeGetData(ptr).value as? DisplayNode {
		node.update(name: name!.string, property: property)
	}
}

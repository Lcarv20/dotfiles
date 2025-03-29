-- lua/apophis_dark_matter/colors.lua
local util = require("experimental.apophis_dark_matter.util")

local M = {}

---@class ApophisColors
local colors = {
	foreground = "#b3a07dff",
	tab_border = "#121416ff",
	icon_foreground = "#ffcc66ff",
	-- selection_background = "#8c7a57",
	selection_background = "#4d3a29",
	editor_background = "#191d1f",
	panel_background = "#171a1cff",
	panel_border = "#b3a07d20",
	input_foreground = "#ffeac1ff",
	input_border = "#191d1f",
	input_placeholderForeground = "#dfcaa155",
	input_background = "#292d2fff",
	inputOption_activeBorder = "#f7c45e4b",
	inputOption_activeBackground = "#f7c45e3c",
	editorWidget_border = "#ffcc66ff",
	editorWidget_background = "#1d2123ff",
	editorWidget_foreground = "#ffcc66ff",
	tab_activeBorderTop = "#ffcc66ff",
	tab_activeBorder = "#212527ff",
	tab_activeModifiedBorder = "#ffcc66ff",
	tab_activeForeground = "#ffeac1ff",
	tab_inactiveForeground = "#ffeac160",
	tab_inactiveBackground = "#1d2123ff",
	tab_inactiveModifiedBorder = "#ffcc6680",
	tab_unfocusedActiveBorder = "#212527ff",
	tab_unfocusedActiveBorderTop = "#ffcc66a0",
	tab_unfocusedActiveModifiedBorder = "#ffcc66a0",
	tab_unfocusedInactiveModifiedBorder = "#ffcc66a0",
	tab_unfocusedActiveForeground = "#ffeac1a0",
	tab_unfocusedInactiveForeground = "#ffeac140",
	tab_hoverBorder = "#ffcc6680",
	tab_hoverBackground = "#ffcc6610",
	editorGutter_background = "#191d1f",
	editorGroupHeader_border = "#121416ff",
	editorGroupHeader_tabsBorder = "#ffcc6660",
	tab_unfocusedInactiveBackground = "#1d2123ff",
	tab_hoverForeground = "#ffcc66a0",
	tab_unfocusedHoverForeground = "#ffcc6660",
	tab_lastPinnedBorder = "#ffcc6640",
	activityBar_foreground = "#ffcc66ff",
	activityBar_inactiveForeground = "#ffcc6660",
	panelTitle_inactiveForeground = "#ffcc6660",
	panelTitle_activeForeground = "#ffcc66a0",
	panelTitle_activeBorder = "#ffcc66a0",
	editorGutter_modifiedBackground = "#ffcc66ff",
	editorGroup_border = "#121416ff",
	breadcrumb_background = "#212527ff",
	breadcrumb_foreground = "#ffcc66a0",
	breadcrumb_activeSelectionForeground = "#ffcc66a0",
	breadcrumb_focusForeground = "#ffcc66ff",
	sideBarSectionHeader_background = "#191d1f",
	sideBarSectionHeader_border = "#b3a07d20",
	sideBarSectionHeader_foreground = "#ffcc66a0",
	button_background = "#1d2123ff",
	button_foreground = "#e6e2e0ff",
	button_hoverBackground = "#212527ff",
	welcomePage_background = "#191d1f",
	welcomePage_buttonBackground = "#1d2123ff",
	welcomePage_buttonHoverBackground = "#212527ff",
	welcomePage_progress_foreground = "#ffcc66ff",
	tab_activeBackground = "#212527ff",
	notifications_background = "#212527f0",
	notifications_foreground = "#b3a07dff",
	notificationCenterHeader_background = "#212527ff",
	notificationCenterHeader_foreground = "#b3a07dff",
	notificationCenter_border = "#191d1f",
	notificationLink_foreground = "#f7c45eff",
	notificationsErrorIcon_foreground = "#ff003378",
	notificationsWarningIcon_foreground = "#cc884478",
	notificationsInfoIcon_foreground = "#ffcc66ff",
	notifications_border = "#ffcc66f0",
	notificationToast_border = "#ffcc66f0",
	sideBar_dropBackground = "#ffcc6660",
	sideBar_background = "#191d1f",
	sideBar_foreground = "#b3a07da0",
	editorUnnecessaryCode_opacity = "#191d1f80",
	editorUnnecessaryCode_border = "#191d1f80",
	focusBorder = "#73603dff",
	menubar_selectionBorder = "#ffcc6620",
	menubar_selectionBackground = "#ffcc6620",
	menubar_selectionForeground = "#b3a07d80",
	menu_background = "#212527f0",
	menu_foreground = "#b3a07d80",
	menu_border = "#212527f0",
	menu_separatorBackground = "#ffcc6680",
	menu_selectionBackground = "#ffcc6620",
	menu_selectionForeground = "#ffcc66a0",
	menu_selectionBorder = "#ffcc6620",
	progressBar_background = "#212527ff",
	pickerGroup_foreground = "#f5c07bff",
	editorHoverWidget_border = "#73603dff",
	settings_headerForeground = "#ffcc66ff",
	settings_modifiedItemIndicator = "#ffcc6660",
	settings_dropdownBorder = "#191d1f",
	settings_dropdownListBorder = "#191d1f",
	settings_checkboxBorder = "#191d1f",
	settings_textInputBorder = "#191d1f",
	settings_numberInputBorder = "#191d1f",
	settings_checkboxBackground = "#292d2fff",
	scrollbar_shadow = "#090d0fff",
	scrollbarSlider_activeBackground = "#ffcc6680",
	scrollbarSlider_background = "#ffcc6640",
	scrollbarSlider_hoverBackground = "#ffcc6640",
	statusBar_background = "#1d2123ff",
	statusBar_foreground = "#ffcc66a0",
	statusBarItem_activeBackground = "#ffcc6680",
	statusBarItem_prominentBackground = "#ffcc6680",
	statusBarItem_prominentHoverBackground = "#ffcc6640",
	statusBarItem_hoverBackground = "#ffcc6640",
	statusBar_noFolderBackground = "#ffcc6680",
	statusBar_noFolderForeground = "#000000",
	statusBar_debuggingBackground = "#ffc82fc0",
	statusBar_debuggingForeground = "#000000a0",
	statusBar_border = "#b3a07d20",
	editorSuggestWidget_selectedBackground = "#292d2fff",
	editorSuggestWidget_background = "#191d1f",
	editorSuggestWidget_border = "#73603dff",
	textLink_foreground = "#f7c45eff",
	textLink_activeForeground = "#ffe47eff",
	textBlockQuote_border = "#ffcc6680",
	textCodeBlock_background = "#ffcc6680",
	textSeparator_foreground = "#ffcc6680",
	activityBarBadge_background = "#ffc82fc0",
	activityBarBadge_foreground = "#000000",
	badge_background = "#ffc82fc0",
	badge_foreground = "#000000",
	errorForeground = "#ffcc66ff",
	descriptionForeground = "#e6e2e0ff",
	editorError_foreground = "#ff0033",
	activityBar_background = "#141719ff",
	titleBar_activeBackground = "#15191aff",
	titleBar_inactiveBackground = "#1d2122ff",
	titleBar_activeForeground = "#ffcc66a0",
	titleBar_inactiveForeground = "#ffdb9380",
	titleBar_border = "#121416ff",
	editorGroupHeader_noTabsBackground = "#1d2123ff",
	editorGroupHeader_tabsBackground = "#1d2123ff",
	editorPane_background = "#15191aff",
	editor_lineHighlightBackground = "#4d402a",
	activityBar_border = "#121416ff",
	sideBar_border = "#121416ff",
	editorLineNumber_activeForeground = "#ffeac1ff",
	editorLineNumber_foreground = "#ffeac155",
	list_highlightForeground = "#f7c45e80",
	list_activeSelectionBackground = "#ffcc662a",
	list_inactiveSelectionBackground = "#dfac462a",
	list_activeSelectionForeground = "#f5c07bff",
	list_inactiveSelectionForeground = "#d0a369ff",
	list_hoverBackground = "#dfac462a",
	list_focusBackground = "#ffcc662a",
	list_hoverForeground = "#ffcc66a0",
	list_focusForeground = "#ffcc66a0",
	list_dropBackground = "#373b3dff",
	listFilterWidget_outline = "#121416ff",
	dropdown_background = "#373b3dff",
	dropdown_foreground = "#b9bdbfff",
	dropdown_listBackground = "#373b3dff",
	sideBarTitle_foreground = "#ffcc66a0",
	editor_foreground = "#b3a07dff",
	editor_selectionBackground = "#ffcc6640",
	editor_selectionHighlightBackground = "#ffcc6649",
	editor_selectionHighlightBorder = "#ffcc6640",
	editorIndentGuide_activeBackground = "#ffcc6649",
	editor_wordHighlightStrongBackground = "#ffcc6649",
	editor_wordHighlightStrongBorder = "#ffcc66a0",
	editorIndentGuide_background = "#212527ff",
	terminal_foreground = "#b3a07d",
	terminal_background = "#191d1f",
	terminal_selectionBackground = "#ffcc6640",
	terminal_border = "#121416ff",
	terminalCursor_foreground = "#b3a07d",
	terminal_ansiBrightBlue = "#7CB8BB",
	terminal_ansiBrightCyan = "#93E0E3",
	terminal_ansiBrightGreen = "#5F7F5F",
	terminal_ansiBrightMagenta = "#DC8CC3",
	terminal_ansiBrightRed = "#DCA3A3",
	terminal_ansiBrightYellow = "#E0CF9F",
	terminal_ansiBrightBlack = "#4F4F4F",
	terminal_ansiBrightWhite = "#FFFFFF",
	terminal_ansiBlue = "#7CB8BB",
	terminal_ansiCyan = "#93E0E3",
	terminal_ansiGreen = "#5F7F5F",
	terminal_ansiMagenta = "#DC8CC3",
	terminal_ansiRed = "#DCA3A3",
	terminal_ansiYellow = "#E0CF9F",
	terminal_ansiBlack = "#3F3F3F",
	terminal_ansiWhite = "#DCDCCC",
	dropdown_border = "#171a1cff",
	editor_findRangeHighlightBackground = "#cdff9a23",
	editor_findMatchBackground = "#c2d6ff1e",
	editor_findMatchHighlightBackground = "#c2d6ff3c",
	activityBar_activeBorder = "#ffeac1ff",
	activityBar_activeFocusBorder = "#ffeac1ff",
	activityBar_activeBackground = "#141719ff",
	window_activeBorder = "#ffcc6660",
	window_inactiveBorder = "#ffdb9380",
	statusBarItem_remoteBackground = "#1d2123ff",
	statusBarItem_remoteForeground = "#ffcc66ff",
	minimap_errorHighlight = "#ff003378",
	minimap_background = "#191d1f",
	editorOverviewRuler_errorForeground = "#ff0033",
	minimap_warningHighlight = "#cc884478",
	editorOverviewRuler_warningForeground = "#cc884478",
	editorOverviewRuler_findMatchForeground = "#ffcc6640",
	editorOverviewRuler_wordHighlightForeground = "#ffcc6649",
	minimap_selectionHighlight = "#ffcc6640",
	quickInput_foreground = "#b3a07dff",
	editorBracketMatch_background = "#ff336660",
	editorBracketMatch_border = "#ff336660",
	list_errorForeground = "#ff4b7eff",
	list_warningForeground = "#feba76ff",
	list_invalidItemForeground = "#f58fffff",
	gitDecoration_untrackedResourceForeground = "#99bb33",

	-- Token colors (simplified for brevity - see detailed mapping below)
	comment = "#89a9ccdd",
	string = "#98a788dd",
	number = "#ff9c6edd",
	builtin_constant = "#75b6b6dd",
	keyword = "#96f4ffdd", -- Original light cyan/blue (keep for reference or other uses)
	keyword_blue = "#569CD6ff", -- NEW: Add a blue closer to VS Code keywords
	function_cyan = "#9CDCFEff", -- NEW: Light cyan/blue for function names/calls
  builtin_function_red = "#f68c8c", -- Was builtin_function, now more specific name (for fatalError)

	operator = "#6ecdc0dd",
	storage_type = "#ffae08dd",
	class_name = "#fc7d28dd",
	function_name = "#94bdcddd",
	builtin_function = "#f68c8cdd",
	html_tag = "#dfb7b8dd",
	css_id = "#a07aaadd",
	css_property = "#6f706fdd",
	regex = "#cfa249dd",

	-- Define some basic semantic colors (can be expanded)
	bg = "#191d1f", -- editor_background
	fg = "#b3a07d", -- foreground
	bg_alt = "#1d2123", -- tab_inactiveBackground, statusBar_background etc.
	fg_alt = "#ffeac1", -- tab_activeForeground, editorLineNumber_activeForeground etc.
	fg_dark = "#ffeac140", -- tab_unfocusedInactiveForeground
	fg_gutter = "#ffeac155", -- editorLineNumber_foreground

	border = "#121416", -- tab_border, editorGroup_border etc.
	border_highlight = "#ffcc6660", -- editorGroupHeader_tabsBorder, window_activeBorder

	sel_bg = "#8c7a57", -- selection_background
	sel_hl_bg = "#ffcc6649", -- editor_selectionHighlightBackground

	accent = "#ffcc66", -- icon_foreground, editorWidget_border etc.
	accent_alt = "#f7c45e", -- notificationLink_foreground, textLink_foreground

	info = "#ffcc66", -- notificationsInfoIcon_foreground
	warn = "#cc8844", -- notificationsWarningIcon_foreground (base color)
	error = "#ff0033", -- editorError_foreground
	hint = "#b3a07d", -- editor_foreground (used for hint diagnostics)

	git_add = "#98a788", -- string color
	git_change = "#96f4ff", -- keyword color
	git_delete = "#ff0033", -- error color
	git_untracked = "#99bb33", -- gitDecoration_untrackedResourceForeground
}

--- Returns the processed color palette.
---@param config table The configuration table (optional, for future use like styles)
---@return ApophisColors
function M.get(config)
	config = config or {}
	local processed_colors = vim.deepcopy(colors) -- Work on a copy

	-- Apply remove_alpha to all colors in the table
	for k, v in pairs(processed_colors) do
		processed_colors[k] = util.remove_alpha(v)
	end

	-- You could add logic here to modify colors based on config.style if needed
	-- e.g., if config.style == "light" then ... end

	return processed_colors
end

return M

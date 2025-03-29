-- lua/apophis_dark_matter/highlights.lua
local M = {}

--- Sets the highlight groups
---@param colors ApophisColors The processed color palette
---@param config ApophisConfig The final configuration table
function M.setup(colors, config)
	-- Helper function for setting highlight groups
	-- Clears the group first to ensure overrides work correctly
	local function hl(group, tbl)
		-- Add default background if transparent is enabled and no bg is set
		if config.transparent and tbl.bg == nil then
			tbl.bg = "NONE"
		end
		-- Add default foreground if transparent is enabled and no fg is set
		-- (Less common, but possible for some groups)
		-- if config.transparent and tbl.fg == nil then
		--   tbl.fg = "NONE" -- Usually you want a foreground
		-- end

		-- Clear the highlight group before setting it
		-- This prevents merging issues if the theme is reloaded
		vim.api.nvim_set_hl(0, group, {})
		vim.api.nvim_set_hl(0, group, tbl)
	end

	-- Basic Editor UI
	hl("Normal", { fg = colors.foreground, bg = config.transparent and "NONE" or colors.editor_background })
	hl("NormalFloat", { fg = colors.foreground, bg = config.transparent and "NONE" or colors.editorWidget_background }) -- For floating windows like LSP hover
	hl(
		"FloatBorder",
		{ fg = colors.editorWidget_border, bg = config.transparent and "NONE" or colors.editorWidget_background }
	)
	hl("Cursor", { fg = colors.editor_background, bg = colors.foreground })
	hl("CursorLine", { bg = colors.editor_lineHighlightBackground })
	hl("CursorLineNr", { fg = colors.editorLineNumber_activeForeground, bg = colors.editor_lineHighlightBackground })
	hl("LineNr", {
		fg = colors.editorLineNumber_foreground,
		bg = config.transparent and "NONE" or colors.editorGutter_background,
	})
	hl("SignColumn", {
		fg = colors.editorLineNumber_foreground,
		bg = config.transparent and "NONE" or colors.editorGutter_background,
	}) -- Background for sign column
	hl("Visual", { bg = colors.selection_background })
	hl("VisualNOS", { bg = colors.selection_background }) -- Visual selection when vim is not the owner
	hl("Search", { fg = colors.editor_background, bg = colors.icon_foreground })
	hl("IncSearch", { fg = colors.editor_background, bg = colors.icon_foreground })
	-- hl("MatchParen", { fg = colors.fg_gutter, bg = colors.editorBracketMatch_background, bold = true })
	hl("MatchParen", { fg = colors.editorBracketMatch_border, bold = true })
	hl("ColorColumn", { bg = colors.editor_lineHighlightBackground }) -- Use cursorline bg for subtle indication
	hl("Conceal", { fg = colors.fg_dark, bg = config.transparent and "NONE" or colors.editor_background }) -- Concealed text (e.g., markdown markers)
	hl("Directory", { fg = colors.accent_alt }) -- Directory names in listings
	hl("ErrorMsg", { fg = colors.error, bg = config.transparent and "NONE" or colors.editor_background, bold = true })
	hl("FoldColumn", { fg = colors.fg_dark, bg = config.transparent and "NONE" or colors.editorGutter_background })
	hl("Folded", { fg = colors.fg_dark, bg = colors.bg_alt })
	hl("ModeMsg", { fg = colors.foreground, bold = true }) -- Mode message (e.g., -- INSERT --)
	hl("MoreMsg", { fg = colors.accent, bold = true }) -- Hit-enter prompt
	hl("NonText", { fg = colors.fg_gutter }) -- Characters like end-of-line markers, trailing whitespace
	hl("Question", { fg = colors.accent, bold = true }) -- Confirmation prompts
	hl("SpecialKey", { fg = colors.fg_gutter }) -- Unprintable characters in Normal mode
	hl("StatusLine", { fg = colors.statusBar_foreground, bg = colors.statusBar_background })
	hl("StatusLineNC", { fg = colors.fg_dark, bg = colors.statusBar_background }) -- Status line of inactive windows
	hl("StatusLineTerm", { fg = colors.statusBar_foreground, bg = colors.statusBar_background })
	hl("StatusLineTermNC", { fg = colors.fg_dark, bg = colors.statusBar_background })
	hl("TabLine", { fg = colors.tab_inactiveForeground, bg = colors.tab_inactiveBackground })
	hl("TabLineFill", { bg = colors.tab_inactiveBackground })
	hl("TabLineSel", { fg = colors.tab_activeForeground, bg = colors.tab_activeBackground })
	hl("Title", { fg = colors.accent, bold = true }) -- Titles for output of :set all, :autocmd, etc.
	hl("VertSplit", { fg = colors.border, bg = config.transparent and "NONE" or colors.editor_background }) -- Separator between vertical splits
	hl("WarningMsg", { fg = colors.warn, bg = config.transparent and "NONE" or colors.editor_background, bold = true })
	hl("WildMenu", { fg = colors.editor_background, bg = colors.accent }) -- Wildmenu completion

	-- Syntax Highlighting
	hl("Comment", { fg = colors.comment, italic = config.italic_comments })
	hl("String", { fg = colors.string })
	hl("Character", { fg = colors.string }) -- Character constant
	hl("Number", { fg = colors.number })
	-- hl("Boolean", { fg = colors.builtin_constant })
	hl("Boolean", { link = "Constant" })
	hl("Float", { fg = colors.number })

	hl("Constant", { fg = colors.foreground, bold = true }) -- Any constant
	hl("Define", { link = "Keyword" }) -- Links to the new blue (if desired)
	hl("Macro", { link = "Keyword" }) -- Links to the new blue (if desired)
	hl("PreProc", { link = "Keyword" }) -- Links to the new blue (if desired)
	hl("Include", { link = "Keyword" }) -- Links to the new blue (if desired)
	hl("PreCondit", { link = "Keyword" }) -- Links to the new blue (if desired)
	-- hl("Define", { fg = colors.keyword }) -- Preprocessor #define
	-- hl("Macro", { fg = colors.keyword }) -- Same as Define
	-- hl("PreProc", { fg = colors.keyword }) -- Generic Preprocessor
	-- hl("Include", { fg = colors.keyword }) -- Preprocessor #include
	-- hl("PreCondit", { fg = colors.keyword }) -- Preprocessor #if, #else, #endif

	hl("Keyword", { fg = colors.function_cyan })
	hl("Statement", { link = "Keyword" }) -- Links to the new blue
	hl("Conditional", { link = "Keyword" }) -- Links to the new blue
	hl("Repeat", { link = "Keyword" }) -- Links to the new blue
	hl("Label", { link = "Keyword" }) -- Links to the new blue
	hl("Operator", { fg = colors.operator }) -- sizeof, "+", "*", etc.
	hl("Exception", { link = "Keyword" }) -- Links to the new blue

	hl("Type", { fg = colors.storage_type }) -- int, long, char, etc.
	-- hl("StorageClass", { fg = colors.storage_type }) -- static, register, volatile, etc.
	-- hl("Structure", { fg = colors.storage_type }) -- struct, union, enum, etc.
	-- hl("Typedef", { fg = colors.storage_type }) -- A typedef
	hl("StorageClass", { link = "Type" }) -- static, private etc. - maybe link to Keyword instead? Let's try Type first.
	hl("Structure", { link = "Type" })
	hl("Typedef", { link = "Type" })

	hl("Identifier", { fg = colors.foreground, bold = true }) -- Any variable name
	hl("Function", { fg = colors.builtin_function_red }) -- Function name (also calls)

	hl("Special", { fg = colors.accent_alt }) -- Any special symbol
	hl("SpecialChar", { fg = colors.operator }) -- Special character in a string
	hl("Tag", { fg = colors.html_tag }) -- You can use HTML tags like <body>, <p>, etc.
	hl("Delimiter", { fg = colors.foreground }) -- Character that acts as a delimiter
	hl("SpecialComment", { fg = colors.comment, bold = true }) -- Special things inside comments
	hl("Debug", { fg = colors.warn }) -- Debugging statements

	hl("Underlined", { fg = colors.accent_alt, underline = true })
	hl("Ignore", { fg = colors.fg_dark, bg = config.transparent and "NONE" or colors.editor_background }) -- Left blank, hidden
	hl("Error", { fg = colors.error, bg = config.transparent and "NONE" or colors.editor_background }) -- Any erroneous construct
	hl("Todo", { fg = colors.accent, bg = config.transparent and "NONE" or colors.editor_background, bold = true }) -- Anything that needs attention

	-- Popup Menu (Pmenu)
	hl("Pmenu", { fg = colors.foreground, bg = colors.editorWidget_background })
	hl(
		"PmenuSel",
		{ fg = colors.editorWidget_foreground, bg = colors.editorSuggestWidget_selectedBackground, bold = true }
	)
	hl("PmenuSbar", { bg = colors.scrollbarSlider_background })
	hl("PmenuThumb", { bg = colors.scrollbarSlider_activeBackground })

	-- Diffs
	hl("DiffAdd", { fg = colors.git_add, bg = config.transparent and "NONE" or colors.editor_background })
	hl("DiffDelete", { fg = colors.git_delete, bg = config.transparent and "NONE" or colors.editor_background })
	hl("DiffChange", { fg = colors.git_change, bg = config.transparent and "NONE" or colors.editor_background })
	hl("DiffText", { fg = colors.foreground, bg = colors.selection_background }) -- Text inside a changed line

	-- LSP Diagnostics
	hl("DiagnosticError", { fg = colors.error })
	hl("DiagnosticWarn", { fg = colors.warn })
	hl("DiagnosticInfo", { fg = colors.info })
	hl("DiagnosticHint", { fg = colors.hint })
	hl("DiagnosticUnderlineError", { undercurl = true, sp = colors.error })
	hl("DiagnosticUnderlineWarn", { undercurl = true, sp = colors.warn })
	hl("DiagnosticUnderlineInfo", { undercurl = true, sp = colors.info })
	hl("DiagnosticUnderlineHint", { undercurl = true, sp = colors.hint })
	hl("DiagnosticVirtualTextError", { fg = colors.error, bg = config.transparent and "NONE" or colors.bg_alt })
	hl("DiagnosticVirtualTextWarn", { fg = colors.warn, bg = config.transparent and "NONE" or colors.bg_alt })
	hl("DiagnosticVirtualTextInfo", { fg = colors.info, bg = config.transparent and "NONE" or colors.bg_alt })
	hl("DiagnosticVirtualTextHint", { fg = colors.hint, bg = config.transparent and "NONE" or colors.bg_alt })

	-- TreeSitter groups (link to standard groups by default)
	-- You can add specific overrides here if needed
	hl("@comment", { link = "Comment" })
	hl("@string", { link = "String" })
	hl("@string.regex", { fg = colors.regex })
	hl("@string.escape", { link = "SpecialChar" })
	hl("@character", { link = "Character" })
	hl("@number", { link = "Number" })
	hl("@boolean", { link = "Boolean" })
	hl("@float", { link = "Float" })

	hl("@function", { link = "Function" })
	hl("@function.builtin", { fg = colors.builtin_function_red })
	hl("@function.builtin", { fg = colors.builtin_function_red })
	-- hl("@function.call", { link = "Function" })
	hl("@function.macro", { link = "Macro" })
	-- hl("@method", { link = "Function" })
	-- hl("@method.call", { link = "Function" })
	hl("@method", { fg = colors.builtin_function_red })
	hl("@method.call", { fg = colors.builtin_function_red })

	hl("@constructor", { fg = colors.builtin_function_red })
	-- hl("@constructor", { link = "Function" }) -- Calls like URL(), String()

	hl("@parameter", { link = "Identifier" })
	hl("@property", { link = "Identifier" }) -- Class/struct properties

	hl("@keyword", { link = "Keyword" })
	hl("@keyword.function", { link = "Keyword" })
	hl("@keyword.operator", { link = "Operator" }) -- Note: TS uses this for `in`, `of` etc. not symbols
	hl("@keyword.return", { link = "Keyword" })

	-- hl("@conditional", { link = "Conditional" })
	-- hl("@repeat", { link = "Repeat" })
	hl("@conditional", { link = "Keyword" }) -- Links to the new blue
	hl("@repeat", { link = "Keyword" })
	hl("@label", { link = "Label" })
	hl("@operator", { link = "Operator" })
	-- hl("@exception", { link = "Exception" })
	-- hl("@include", { link = "Include" })
	hl("@exception", { link = "Keyword" }) -- Links to the new blue
	hl("@include", { link = "Keyword" })

	hl("@type", { link = "Type" })
	hl("@type.builtin", { link = "Type" })
	-- hl("@type.definition", { link = "Typedef" })
	hl("@type.definition", { link = "Type" })
	-- hl("@type.qualifier", { link = "StorageClass" }) -- static, const etc.
	-- hl("@storageclass", { link = "StorageClass" })
	hl("@type.qualifier", { link = "Keyword" }) -- static, const etc.
	hl("@storageclass", { link = "Keyword" })
	hl("@attribute", { fg = colors.accent_alt }) -- Annotations, attributes
	hl("@namespace", { link = "Identifier" }) -- Module, package, namespace

	hl("@variable", { link = "Identifier" })
	hl("@variable.builtin", { fg = colors.builtin_constant }) -- `self`, `this`, `super` etc.
	-- hl("@variable.builtin", { fg = colors.keyword_blue }) -- 'self' -> Keyword blue

	hl("@constant", { link = "Constant" })
	hl("@constant.builtin", { link = "Constant" })
	hl("@constant.macro", { link = "Define" })

	hl("@symbol", { link = "Identifier" })
	hl("@text", { link = "Normal" })
	hl("@text.strong", { bold = true })
	hl("@text.emphasis", { italic = true })
	hl("@text.underline", { underline = true })
	hl("@text.strike", { strikethrough = true })
	hl("@text.title", { link = "Title" })
	hl("@text.literal", { link = "String" }) -- Code blocks in markdown etc.
	hl("@text.uri", { fg = colors.textLink_foreground, underline = true })
	hl("@text.reference", { link = "Identifier" })
	hl("@text.diff.add", { link = "DiffAdd" })
	hl("@text.diff.delete", { link = "DiffDelete" })

	hl("@tag", { fg = colors.html_tag })
	hl("@tag.attribute", { fg = colors.accent_alt })
	hl("@tag.delimiter", { fg = colors.operator })

	hl("@punctuation.delimiter", { link = "Delimiter" })
	hl("@punctuation.bracket", { link = "Delimiter" })
	hl("@punctuation.special", { link = "Special" }) -- String interpolation markers ${} etc.

	hl("@error", { link = "Error" })
	hl("@todo", { link = "Todo" })
	hl("@warning", { fg = colors.warn })
	hl("@info", { fg = colors.info })
	hl("@hint", { fg = colors.hint })

	-- Plugin Integrations
	-- if config.plugins.telescope then
	-- 	hl("TelescopeBorder", { fg = colors.editorWidget_border, bg = colors.editorWidget_background })
	-- 	hl("TelescopeNormal", { fg = colors.foreground, bg = colors.editorWidget_background })
	-- 	hl("TelescopePreviewBorder", { fg = colors.editorWidget_border, bg = colors.editorWidget_background })
	-- 	hl("TelescopePreviewNormal", { fg = colors.foreground, bg = colors.editorWidget_background })
	-- 	-- hl(
	-- 	-- 	"TelescopePreviewTitle",
	-- 	-- 	{ fg = colors.titleBar_activeForeground, bg = colors.titleBar_activeBackground, bold = true }
	-- 	-- )
	-- 	hl("TelescopePromptBorder", { fg = colors.editorWidget_border, bg = colors.input_background })
	-- 	-- hl("TelescopePromptNormal", { fg = colors.input_foreground, bg = colors.input_background })
	-- 	-- hl("TelescopePromptPrefix", { fg = colors.icon_foreground, bg = colors.input_background })
	-- 	-- hl("TelescopePromptTitle", { fg = colors.titleBar_activeForeground, bg = colors.input_background, bold = true })
	-- 	-- hl("TelescopeResultsBorder", { fg = colors.editorWidget_border, bg = colors.editorWidget_background })
	-- 	-- hl("TelescopeResultsNormal", { fg = colors.foreground, bg = colors.editorWidget_background })
	-- 	-- hl(
	-- 	-- 	"TelescopeResultsTitle",
	-- 	-- 	{ fg = colors.titleBar_activeForeground, bg = colors.editorWidget_background, bold = true }
	-- 	-- )
	-- 	hl(
	-- 		"TelescopeSelection",
	-- 		{ fg = colors.list_activeSelectionForeground, bg = colors.list_activeSelectionBackground }
	-- 	)
	-- 	hl("TelescopeSelectionCaret", { fg = colors.accent, bg = colors.list_activeSelectionBackground })
	-- end
	if config.plugins.telescope then
		-- Define the common background for Telescope windows
		local telescope_bg = colors.editorWidget_background -- Use the background from results/preview

		-- Define a less intrusive selection background
		-- Let's try using the general 'selection_background' color, which is usually darker.
		-- Or define a new subtle color if needed.
		local selection_bg = colors.selection_background -- #8c7a57 (a muted brown/grey)
		-- Ensure the text on the selection is readable, using the main foreground color
		local selection_fg = colors.foreground

		hl("TelescopeNormal", { fg = colors.foreground, bg = telescope_bg }) -- Base for other Telescope groups

		-- Borders for all sections
		hl("TelescopeBorder", { fg = colors.editorWidget_border, bg = telescope_bg })
		hl("TelescopePreviewBorder", { fg = colors.editorWidget_border, bg = telescope_bg })
		hl("TelescopePromptBorder", { fg = colors.editorWidget_border, bg = telescope_bg }) -- Use common BG
		hl("TelescopeResultsBorder", { fg = colors.editorWidget_border, bg = telescope_bg })

		-- Preview Area
		hl("TelescopePreviewNormal", { fg = colors.foreground, bg = telescope_bg })
		hl("TelescopePreviewTitle", { fg = colors.titleBar_activeForeground, bg = telescope_bg, bold = true }) -- Use common BG

		-- Prompt Area (Input)
		hl("TelescopePromptNormal", { fg = colors.input_foreground, bg = telescope_bg }) -- Use common BG
		hl("TelescopePromptPrefix", { fg = colors.icon_foreground, bg = telescope_bg }) -- Use common BG
		hl("TelescopePromptTitle", { fg = colors.titleBar_activeForeground, bg = telescope_bg, bold = true }) -- Use common BG

		-- Results Area
		hl("TelescopeResultsNormal", { fg = colors.foreground, bg = telescope_bg })
		hl("TelescopeResultsTitle", { fg = colors.titleBar_activeForeground, bg = telescope_bg, bold = true })

		-- Selection Area (Adjusted)
		hl("TelescopeSelection", { fg = selection_fg, bg = selection_bg }) -- Use new selection colors
		hl("TelescopeSelectionCaret", { fg = colors.accent, bg = selection_bg }) -- Use new selection BG for caret line
	end

	if config.plugins.gitsigns then
		hl("GitSignsAdd", { fg = colors.git_add })
		hl("GitSignsChange", { fg = colors.git_change })
		hl("GitSignsDelete", { fg = colors.git_delete })
		hl("GitSignsAddLn", { bg = colors.git_add, fg = colors.bg }) -- Line highlighting for added lines
		hl("GitSignsChangeLn", { bg = colors.git_change, fg = colors.bg }) -- Line highlighting for changed lines
		hl("GitSignsDeleteLn", { bg = colors.git_delete, fg = colors.bg }) -- Line highlighting for deleted lines
		hl("GitSignsCurrentLineBlame", { fg = colors.comment, italic = config.italic_comments }) -- Virtual text blame
	end

	if config.plugins.nvim_tree then
		local tree_bg = config.transparent and "NONE" or colors.sideBar_background
		hl("NvimTreeNormal", { fg = colors.foreground, bg = tree_bg })
		hl("NvimTreeNormalNC", { fg = colors.fg_dark, bg = tree_bg }) -- Non-current window
		hl("NvimTreeRootFolder", { fg = colors.titleBar_activeForeground, bold = true, bg = tree_bg })
		hl("NvimTreeFolderIcon", { fg = colors.icon_foreground, bg = tree_bg })
		hl("NvimTreeFileIcon", { fg = colors.foreground, bg = tree_bg }) -- Use normal fg for files unless special
		hl("NvimTreeIndentMarker", { fg = colors.editorIndentGuide_background, bg = tree_bg })
		hl("NvimTreeVertSplit", { fg = colors.border, bg = tree_bg })
		hl("NvimTreeGitDirty", { fg = colors.git_change, bg = tree_bg })
		hl("NvimTreeGitStaged", { fg = colors.git_add, bg = tree_bg })
		hl("NvimTreeGitMerged", { fg = colors.builtin_constant, bg = tree_bg }) -- Merged status
		hl("NvimTreeGitRenamed", { fg = colors.warn, bg = tree_bg }) -- Renamed status
		hl("NvimTreeGitDeleted", { fg = colors.git_delete, bg = tree_bg })
		hl("NvimTreeGitIgnored", { fg = colors.comment, bg = tree_bg })
		hl("NvimTreeGitUntracked", { fg = colors.git_untracked, bg = tree_bg })
		hl("NvimTreeSpecialFile", { fg = colors.accent_alt, bold = true, bg = tree_bg }) -- Symlinks, etc.
		hl("NvimTreeImageFile", { fg = colors.string, bg = tree_bg })
		hl("NvimTreeSymlink", { fg = colors.builtin_constant, bg = tree_bg })
		hl("NvimTreeOpenedFile", { fg = colors.foreground, bg = colors.list_activeSelectionBackground }) -- Currently open file
		hl("NvimTreeOpenedFolderIcon", { fg = colors.icon_foreground, bg = tree_bg })
		hl("NvimTreeEmptyFolderIcon", { fg = colors.icon_foreground, bg = tree_bg })
		hl("NvimTreeExecFile", { fg = colors.git_add, bg = tree_bg }) -- Executable files
	end

	if config.plugins.indent_blankline then
		hl("IndentBlanklineChar", { fg = colors.editorIndentGuide_background })
		hl("IndentBlanklineContextChar", { fg = colors.editorIndentGuide_activeBackground })
		hl("IndentBlanklineContextStart", { sp = colors.editorIndentGuide_activeBackground, underline = true }) -- Mark the start of the context
		-- You might need to configure indent-blankline to use these groups
		-- e.g., scope_color = "IndentBlanklineContextChar"
	end

	if config.plugins.bufferline then
		local buf_bg = colors.tab_inactiveBackground
		local buf_sel_bg = colors.tab_activeBackground
		local buf_fg = colors.tab_inactiveForeground
		local buf_sel_fg = colors.tab_activeForeground
		local buf_mod_fg = colors.editorGutter_modifiedBackground
		local buf_err_fg = colors.error
		local buf_sep_fg = colors.tab_border
		local buf_ind_fg = colors.icon_foreground

		hl("BufferLineFill", { bg = buf_bg })
		hl("BufferLineBackground", { fg = buf_fg, bg = buf_bg })
		hl("BufferLineBufferHidden", { fg = colors.fg_dark, bg = buf_bg }) -- Hidden buffers
		hl("BufferLineBufferVisible", { fg = buf_fg, bg = buf_bg }) -- Visible but not selected
		hl("BufferLineBufferSelected", { fg = buf_sel_fg, bg = buf_sel_bg, bold = true })
		hl("BufferLineCloseButton", { fg = buf_fg, bg = buf_bg })
		hl("BufferLineCloseButtonVisible", { fg = buf_fg, bg = buf_bg })
		hl("BufferLineCloseButtonSelected", { fg = buf_err_fg, bg = buf_sel_bg })
		hl("BufferLineIndicator", { fg = buf_fg, bg = buf_bg }) -- Generic indicator
		hl("BufferLineIndicatorVisible", { fg = buf_fg, bg = buf_bg })
		hl("BufferLineIndicatorSelected", { fg = buf_ind_fg, bg = buf_sel_bg })
		hl("BufferLineModified", { fg = buf_mod_fg, bg = buf_bg })
		hl("BufferLineModifiedVisible", { fg = buf_mod_fg, bg = buf_bg })
		hl("BufferLineModifiedSelected", { fg = buf_mod_fg, bg = buf_sel_bg })
		hl("BufferLineSeparator", { fg = buf_sep_fg, bg = buf_bg })
		hl("BufferLineSeparatorVisible", { fg = buf_sep_fg, bg = buf_bg })
		hl("BufferLineSeparatorSelected", { fg = buf_sep_fg, bg = buf_sel_bg })
		hl("BufferLineTab", { fg = buf_fg, bg = buf_bg }) -- Tabs (if enabled)
		hl("BufferLineTabSelected", { fg = buf_sel_fg, bg = buf_sel_bg })
		hl("BufferLineTabClose", { fg = buf_err_fg, bg = buf_bg })
		hl("BufferLineDuplicate", { fg = colors.comment, bg = buf_bg }) -- Duplicate buffer names
		hl("BufferLineDuplicateSelected", { fg = colors.comment, bg = buf_sel_bg })
		hl("BufferLineError", { fg = buf_err_fg, bg = buf_bg }) -- Diagnostic errors
		hl("BufferLineErrorSelected", { fg = buf_err_fg, bg = buf_sel_bg })
		hl("BufferLineWarning", { fg = colors.warn, bg = buf_bg }) -- Diagnostic warnings
		hl("BufferLineWarningSelected", { fg = colors.warn, bg = buf_sel_bg })
		hl("BufferLineInfo", { fg = colors.info, bg = buf_bg }) -- Diagnostic info
		hl("BufferLineInfoSelected", { fg = colors.info, bg = buf_sel_bg })
		hl("BufferLineHint", { fg = colors.hint, bg = buf_bg }) -- Diagnostic hints
		hl("BufferLineHintSelected", { fg = colors.hint, bg = buf_sel_bg })
	end

	if config.plugins.lualine then
		-- Define base styles for each mode
		local lualine_normal = { fg = colors.foreground, bg = colors.statusBar_background }
		local lualine_insert = { fg = colors.keyword, bg = colors.statusBar_background }
		local lualine_visual = { fg = colors.builtin_constant, bg = colors.statusBar_background }
		local lualine_replace = { fg = colors.error, bg = colors.statusBar_background }
		local lualine_command = { fg = colors.function_name, bg = colors.statusBar_background }
		local lualine_inactive = { fg = colors.fg_dark, bg = colors.statusBar_background }

		-- Define section highlights based on mode styles
		hl("LualineNormal", lualine_normal)
		hl("LualineInsert", lualine_insert)
		hl("LualineVisual", lualine_visual)
		hl("LualineReplace", lualine_replace)
		hl("LualineCommand", lualine_command)
		hl("LualineInactive", lualine_inactive)

		-- Helper to create section highlights
		local function lualine_hl(section, mode, style)
			hl("Lualine" .. section .. "_" .. mode, style)
		end

		local sections = { "a", "b", "c", "x", "y", "z" }
		local modes = {
			{ "normal", lualine_normal },
			{ "insert", lualine_insert },
			{ "visual", lualine_visual },
			{ "replace", lualine_replace },
			{ "command", lualine_command },
			{ "inactive", lualine_inactive },
		}

		for _, section in ipairs(sections) do
			for _, mode_pair in ipairs(modes) do
				local mode_name = mode_pair[1]
				local mode_style = vim.deepcopy(mode_pair[2]) -- Copy style
				-- Section 'a' is often bold
				if section == "a" then
					mode_style.bold = true
				end
				-- You could customize backgrounds per section here if desired
				-- e.g., if section == "a" then mode_style.bg = colors.accent end
				lualine_hl(section:upper(), mode_name, mode_style)
			end
		end
	end

	-- Apply user overrides
	if config.on_highlights then
		local overrides = config.on_highlights(colors, config)
		if type(overrides) == "table" then
			for group, settings in pairs(overrides) do
				if type(settings) == "table" then
					hl(group, settings)
				end
			end
		end
	end

	-- Terminal Colors
	if config.terminal_colors then
		vim.g.terminal_color_0 = colors.terminal_ansiBlack
		vim.g.terminal_color_1 = colors.terminal_ansiRed
		vim.g.terminal_color_2 = colors.terminal_ansiGreen
		vim.g.terminal_color_3 = colors.terminal_ansiYellow
		vim.g.terminal_color_4 = colors.terminal_ansiBlue
		vim.g.terminal_color_5 = colors.terminal_ansiMagenta
		vim.g.terminal_color_6 = colors.terminal_ansiCyan
		vim.g.terminal_color_7 = colors.terminal_ansiWhite
		vim.g.terminal_color_8 = colors.terminal_ansiBrightBlack
		vim.g.terminal_color_9 = colors.terminal_ansiBrightRed
		vim.g.terminal_color_10 = colors.terminal_ansiBrightGreen
		vim.g.terminal_color_11 = colors.terminal_ansiBrightYellow
		vim.g.terminal_color_12 = colors.terminal_ansiBrightBlue
		vim.g.terminal_color_13 = colors.terminal_ansiBrightMagenta
		vim.g.terminal_color_14 = colors.terminal_ansiBrightCyan
		vim.g.terminal_color_15 = colors.terminal_ansiBrightWhite
		if colors.terminal_background then
			vim.g.terminal_color_background = colors.terminal_background
		end
		if colors.terminal_foreground then
			vim.g.terminal_color_foreground = colors.terminal_foreground
		end
	end
end

return M

-- apophis_dark_matter.lua

local M = {}

-- Helper function to remove alpha channel from hex color
local function remove_alpha(hex_color)
  if hex_color:len() == 9 and hex_color:sub(1, 1) == '#' then
    return hex_color:sub(1, 7)  -- Extract the first 7 characters (#RRGGBB)
  else
    return hex_color  -- Return original if not a 9-character hex code
  end
end

function M.setup()
  vim.o.background = "dark"
  vim.o.termguicolors = true

  -- Define colors from the VS Code theme
  local colors = {
    foreground = "#b3a07dff",
    tab_border = "#121416ff",
    icon_foreground = "#ffcc66ff",
    selection_background = "#8c7a57",
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
    editor_lineHighlightBackground = "#93805d20",
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
    keyword = "#96f4ffdd",
    operator = "#6ecdc0dd",
    storage_type = "#ffae08dd",
    class_name = "#fc7d28dd",
    function_name = "#94bdcddd",
    builtin_function = "#f68c8cdd",
    html_tag = "#dfb7b8dd",
    css_id = "#a07aaadd",
    css_property = "#6f706fdd",
    regex = "#cfa249dd",
  }

  -- Apply remove_alpha to all colors in the table
  for k, v in pairs(colors) do
    colors[k] = remove_alpha(v)
  end


  -- Helper function for highlight groups
  local function hl(group, tbl)
    vim.api.nvim_set_hl(0, group, tbl)
  end

  -- General UI
  hl("Normal", { fg = colors.foreground, bg = colors.editor_background })
  hl("Cursor", { fg = colors.editor_background, bg = colors.foreground })
  hl("CursorLine", { bg = colors.editor_lineHighlightBackground })
  hl("CursorLineNr", { fg = colors.editorLineNumber_activeForeground, bg = colors.editor_lineHighlightBackground })
  hl("LineNr", { fg = colors.editorLineNumber_foreground })
  hl("Visual", { bg = colors.selection_background })
  hl("Search", { fg = colors.editor_background, bg = colors.icon_foreground })
  hl("IncSearch", { fg = colors.editor_background, bg = colors.icon_foreground })
  hl("MatchParen", {fg = colors.editorBracketMatch_border, bg = colors.editorBracketMatch_background})

  -- Syntax Highlighting (Mapped from VS Code tokenColors)
  hl("Comment", { fg = colors.comment, italic = true })
  hl("String", { fg = colors.string })
  hl("Number", { fg = colors.number })
  hl("Constant", { fg = colors.builtin_constant }) -- Built-in constant
  hl("Boolean", { fg = colors.builtin_constant })
  hl("Keyword", { fg = colors.keyword })
  hl("Operator", { fg = colors.operator })
  hl("Type", { fg = colors.storage_type })
  hl("StorageClass", { fg = colors.storage_type })
  hl("Identifier", { fg = colors.foreground })
  hl("Function", { fg = colors.function_name })
  hl("PreProc", { fg = colors.keyword }) -- Preprocessor
  hl("Special", { fg = colors.keyword })
  hl("Error", { fg = colors.editorError_foreground })
  hl("Todo", { fg = colors.icon_foreground, bold = true })
  hl("Title", {fg = colors.foreground, bold = true})

  -- Statusline
  hl("StatusLine", { fg = colors.statusBar_foreground, bg = colors.statusBar_background })
  hl("StatusLineNC", { fg = colors.statusBar_foreground, bg = colors.statusBar_background })

  -- Popup Menu
  hl("Pmenu", { fg = colors.foreground, bg = colors.editorWidget_background })
  hl("PmenuSel", { fg = colors.editorWidget_foreground, bg = colors.editorSuggestWidget_selectedBackground })
  hl("PmenuSbar", { bg = colors.scrollbarSlider_background })
  hl("PmenuThumb", { bg = colors.scrollbarSlider_activeBackground })

  -- Tabs
  hl("TabLine", { fg = colors.tab_inactiveForeground, bg = colors.tab_inactiveBackground })
  hl("TabLineFill", { bg = colors.tab_inactiveBackground })
  hl("TabLineSel", { fg = colors.tab_activeForeground, bg = colors.tab_activeBackground })

  -- Diff
  hl("DiffAdd", { fg = colors.string })
  hl("DiffDelete", { fg = colors.editorError_foreground })
  hl("DiffText", { fg = colors.foreground, bg = colors.selection_background })
  hl("DiffChange", { fg = colors.keyword })

  -- Telescope
  hl("TelescopeBorder", { fg = colors.editorWidget_border, bg = colors.editorWidget_background })
  hl("TelescopeNormal", { fg = colors.foreground, bg = colors.editorWidget_background })
  hl("TelescopePreviewBorder", { fg = colors.editorWidget_border, bg = colors.editorWidget_background })
  hl("TelescopePreviewNormal", { fg = colors.foreground, bg = colors.editorWidget_background })
  hl("TelescopePreviewTitle", { fg = colors.titleBar_activeForeground, bg = colors.titleBar_activeBackground })
  hl("TelescopePromptBorder", { fg = colors.editorWidget_border, bg = colors.editorWidget_background })
  hl("TelescopePromptNormal", { fg = colors.input_foreground, bg = colors.input_background })
  hl("TelescopePromptPrefix", { fg = colors.icon_foreground })
  hl("TelescopePromptTitle", { fg = colors.titleBar_activeForeground, bg = colors.titleBar_activeBackground })
  hl("TelescopeResultsBorder", { fg = colors.editorWidget_border, bg = colors.editorWidget_background })
  hl("TelescopeResultsNormal", { fg = colors.foreground, bg = colors.editorWidget_background })
  hl("TelescopeResultsTitle", { fg = colors.titleBar_activeForeground, bg = colors.titleBar_activeBackground })
  hl("TelescopeSelection", { fg = colors.list_activeSelectionForeground, bg = colors.list_activeSelectionBackground })

  -- LSP Diagnostics
  hl("DiagnosticError", { fg = colors.editorError_foreground })
  hl("DiagnosticWarn", { fg = colors.notificationsWarningIcon_foreground })
  hl("DiagnosticInfo", { fg = colors.notificationsInfoIcon_foreground })
  hl("DiagnosticHint", { fg = colors.editor_foreground })
  hl("DiagnosticUnderlineError", { sp = colors.editorError_foreground, undercurl = true })
  hl("DiagnosticUnderlineWarn", { sp = colors.notificationsWarningIcon_foreground, undercurl = true })
  hl("DiagnosticUnderlineInfo", { sp = colors.notificationsInfoIcon_foreground, undercurl = true })
  hl("DiagnosticUnderlineHint", { sp = colors.editor_foreground, undercurl = true })
  hl("DiagnosticVirtualTextError", {fg = colors.editorError_foreground, bg = colors.editor_background})
  hl("DiagnosticVirtualTextWarn", {fg = colors.notificationsWarningIcon_foreground, bg = colors.editor_background})
  hl("DiagnosticVirtualTextInfo", {fg = colors.notificationsInfoIcon_foreground, bg = colors.editor_background})
  hl("DiagnosticVirtualTextHint", {fg = colors.editor_foreground, bg = colors.editor_background})

  -- GitSigns / GitGutter
  hl("GitSignsAdd", { fg = colors.string })
  hl("GitSignsChange", { fg = colors.keyword })
  hl("GitSignsDelete", { fg = colors.editorError_foreground })

  -- nvim-tree
  hl("NvimTreeNormal", {fg = colors.foreground, bg = colors.sideBar_background})
  hl("NvimTreeNormalNC", {fg = colors.foreground, bg = colors.sideBar_background})
  hl("NvimTreeRootFolder", {fg = colors.titleBar_activeForeground, bold = true})
  hl("NvimTreeFolderIcon", {fg = colors.icon_foreground})
  hl("NvimTreeFileIcon", {fg = colors.icon_foreground})
  hl("NvimTreeIndentMarker", {fg = colors.editorIndentGuide_background})
  hl("NvimTreeGitDirty", {fg = colors.keyword})
  hl("NvimTreeGitStaged", {fg = colors.string})
  hl("NvimTreeGitUnstaged", {fg = colors.editorError_foreground})
  hl("NvimTreeGitUntracked", {fg = colors.gitDecoration_untrackedResourceForeground})
  hl("NvimTreeSpecialFile", {fg = colors.keyword, bold = true})
  hl("NvimTreeImageFile", {fg = colors.string})
  hl("NvimTreeSymlink", {fg = colors.builtin_constant})

  -- Indent-blankline.nvim
  hl("IndentBlanklineChar", {fg = colors.editorIndentGuide_background})
  hl("IndentBlanklineContextChar", {fg = colors.editorIndentGuide_activeBackground})
  hl("IndentBlanklineContextStart", {fg = colors.editorIndentGuide_activeBackground, bold = true})

  -- WhichKey
  hl("WhichKey",        { fg = colors.keyword, bg = colors.editorWidget_background })
  hl("WhichKeySeperator", { fg = colors.foreground, bg = colors.editorWidget_background })
  hl("WhichKeyGroup",   { fg = colors.icon_foreground, bg = colors.editorWidget_background })
  hl("WhichKeyDesc",    { fg = colors.foreground, bg = colors.editorWidget_background })

  -- BufferLine
  hl("BufferLineFill", {bg = colors.editor_background})
  hl("BufferLineBackground", {fg = colors.tab_inactiveForeground, bg = colors.tab_inactiveBackground})
  hl("BufferLineBufferVisible", {fg = colors.tab_activeForeground, bg = colors.tab_activeBackground})
  hl("BufferLineBufferSelected", {fg = colors.tab_activeForeground, bg = colors.tab_activeBackground, bold = true})
  hl("BufferLineTabSelected", {fg = colors.tab_activeForeground, bg = colors.tab_activeBackground, bold = true})
  hl("BufferLineTabClose", {fg = colors.editorError_foreground})
  hl("BufferLineIndicatorSelected", {fg = colors.icon_foreground})
  hl("BufferLineModified", {fg = colors.editorGutter_modifiedBackground})
  hl("BufferLineCloseButton", {fg = colors.editorError_foreground})
  hl("BufferLineSeparator", {fg = colors.tab_border, bg = colors.editor_background})
  hl("BufferLineSeparatorVisible", {fg = colors.tab_border, bg = colors.editor_background})
  hl("BufferLineSeparatorSelected", {fg = colors.tab_border, bg = colors.editor_background})

  -- Lualine
  hl("LualineNormal", {fg = colors.foreground, bg = colors.editor_background})
  hl("LualineInsert", {fg = colors.keyword, bg = colors.editor_background, bold = true})
  hl("LualineVisual", {fg = colors.builtin_constant, bg = colors.editor_background, bold = true})
  hl("LualineReplace", {fg = colors.editorError_foreground, bg = colors.editor_background, bold = true})
  hl("LualineCommand", {fg = colors.function_name, bg = colors.editor_background, bold = true})
  hl("LualineInactive", {fg = colors.tab_inactiveForeground, bg = colors.tab_inactiveBackground})
  hl("Lualine_a_normal", {fg = colors.foreground, bg = colors.editor_background, bold = true})
  hl("Lualine_b_normal", {fg = colors.foreground, bg = colors.editor_background})
  hl("Lualine_c_normal", {fg = colors.foreground, bg = colors.editor_background})
  hl("Lualine_x_normal", {fg = colors.foreground, bg = colors.editor_background})
  hl("Lualine_y_normal", {fg = colors.foreground, bg = colors.editor_background})
  hl("Lualine_z_normal", {fg = colors.foreground, bg = colors.editor_background})
  hl("Lualine_a_insert", {fg = colors.keyword, bg = colors.editor_background, bold = true})
  hl("Lualine_b_insert", {fg = colors.keyword, bg = colors.editor_background})
  hl("Lualine_c_insert", {fg = colors.keyword, bg = colors.editor_background})
  hl("Lualine_x_insert", {fg = colors.keyword, bg = colors.editor_background})
  hl("Lualine_y_insert", {fg = colors.keyword, bg = colors.editor_background})
  hl("Lualine_z_insert", {fg = colors.keyword, bg = colors.editor_background})
  hl("Lualine_a_visual", {fg = colors.builtin_constant, bg = colors.editor_background, bold = true})
  hl("Lualine_b_visual", {fg = colors.builtin_constant, bg = colors.editor_background})
  hl("Lualine_c_visual", {fg = colors.builtin_constant, bg = colors.editor_background})
  hl("Lualine_x_visual", {fg = colors.builtin_constant, bg = colors.editor_background})
  hl("Lualine_y_visual", {fg = colors.builtin_constant, bg = colors.editor_background})
  hl("Lualine_z_visual", {fg = colors.builtin_constant, bg = colors.editor_background})
  hl("Lualine_a_replace", {fg = colors.editorError_foreground, bg = colors.editor_background, bold = true})
  hl("Lualine_b_replace", {fg = colors.editorError_foreground, bg = colors.editor_background})
  hl("Lualine_c_replace", {fg = colors.editorError_foreground, bg = colors.editor_background})
  hl("Lualine_x_replace", {fg = colors.editorError_foreground, bg = colors.editor_background})
  hl("Lualine_y_replace", {fg = colors.editorError_foreground, bg = colors.editor_background})
  hl("Lualine_z_replace", {fg = colors.editorError_foreground, bg = colors.editor_background})
  hl("Lualine_a_command", {fg = colors.function_name, bg = colors.editor_background, bold = true})
  hl("Lualine_b_command", {fg = colors.function_name, bg = colors.editor_background})
  hl("Lualine_c_command", {fg = colors.function_name, bg = colors.editor_background})
  hl("Lualine_x_command", {fg = colors.function_name, bg = colors.editor_background})
  hl("Lualine_y_command", {fg = colors.function_name, bg = colors.editor_background})
  hl("Lualine_z_command", {fg = colors.function_name, bg = colors.editor_background})
  hl("Lualine_a_inactive", {fg = colors.tab_inactiveForeground, bg = colors.tab_inactiveBackground})
  hl("Lualine_b_inactive", {fg = colors.tab_inactiveForeground, bg = colors.tab_inactiveBackground})
  hl("Lualine_c_inactive", {fg = colors.tab_inactiveForeground, bg = colors.tab_inactiveBackground})
  hl("Lualine_x_inactive", {fg = colors.tab_inactiveForeground, bg = colors.tab_inactiveBackground})
  hl("Lualine_y_inactive", {fg = colors.tab_inactiveForeground, bg = colors.tab_inactiveBackground})
  hl("Lualine_z_inactive", {fg = colors.tab_inactiveForeground, bg = colors.tab_inactiveBackground})

end

return M

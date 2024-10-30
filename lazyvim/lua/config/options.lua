-- vim.opt.colorcolumn = "80"
vim.opt.clipboard = ""
vim.opt.wrap = false
vim.g.autoformat = false
-- vim.opt.pb = 0 -- blend/transparency on floats

-- vim.opt.listchars:append({ tab = "··" }) -- Use two spaces for the tab character
vim.opt.list = true -- Enable listchars
vim.opt.listchars = {
  tab = "··",       -- Show tabs as two middle dots
  -- trail = "·",      -- Show trailing spaces as a middle dot
  -- extends = "⟩",    -- Show this when text extends beyond screen
  -- precedes = "⟨",   -- Show this when text precedes beyond screen
  nbsp = "␣",       -- Show non-breaking spaces
  lead = "·",       -- Show leading spaces
  multispace = "·", -- Show multiple spaces as middle dots
  -- eol = "↲",        -- Show end of line character
}
-- vim.opt.listchars:append({ tab = "██", trail = "·" }) -- Use two spaces for the tab character

vim.opt.guicursor =
  "n:block-NCursor,ci:block-NoiceCursor,v:block-VCursor,i-ci-ve:block-ICursor,r-cr-o:block-RCursor,sm:block-ComCursor"

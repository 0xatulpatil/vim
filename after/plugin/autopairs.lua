local status_ok, npairs = pcall(require, "nvim-autopairs")
if not status_ok then
  return
end

npairs.setup({
	check_ts = true,
    ts_config = {
        -- lua = {'string'},-- it will not add a pair on that treesitter node
        javascript = {'template_string', 'string'},
    },
	disable_filetype = {"TelescopePrompt"},
    fast_wrap = {
      map = '<M-e>',
      chars = { '{', '[', '(', '"', "'" },
      pattern = [=[[%'%"%>%]%)%}%,]]=],
      end_key = '$',
      keys = 'qwertyuiopzxcvbnmasdfghjkl',
      check_comma = true,
      manual_position = true,
      highlight = 'Search',
      highlight_grey='Comment'
    },
	enable_check_bracket_line = true -- does not adds an extra pair if unclosed bracket exists
})
-- auto-ts-tag

local status, tsTag = pcall(require, "nvim-ts-autotag")
if not status then
  return
end

tsTag.setup({
  autotag = {
    enable = true,
	enable_rename = true,
    enable_close = true,
  }
})

require("render-markdown").setup({
  heading = {
    icons = { " 󰼏 ", " 󰎨 ", " 󰼑 ", " 󰎲 ", " 󰼓 ", " 󰎴 " },
    border = true,
    render_modes = true,
  },
  code = {
    file_types = { "markdown", "vimwiki" },
    width = "block",
    min_width = 80,
    border = "thin",
    left_pad = 1,
    right_pad = 1,
    position = "right",
    highlight_inline = "RenderMarkdownCodeInfo",
  },
  pipe_table = {
    alignment_indicator = "─",
    border = { "╭", "┬", "╮", "├", "┼", "┤", "╰", "┴", "╯", "│", "─" },
  },
  anti_conceal = {
    disabled_modes = { "n" },
    ignore = {
      bullet = true, -- render bullet in insert mode
      head_border = true,
      head_background = true,
    },
  },
  -- https://github.com/MeanderingProgrammer/render-markdown.nvim/issues/509
  win_options = { concealcursor = { rendered = "nvc" } },
  completions = {
    blink = { enabled = true },
    lsp = { enabled = true },
  },
})

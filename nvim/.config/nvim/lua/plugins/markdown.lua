return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown", "vimwiki", "quarto", "org" },
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' },            -- if you use the mini.nvim suite
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.icons" }, -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
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
    },
  },
  {
    "HakonHarnes/img-clip.nvim",
    ft = { "markdown", "vimwiki", "quarto", "org" },
    event = "VeryLazy",
    opts = {
      default = {
        dir_path = "./attachments",
        use_absolute_path = false,
        copy_images = true,
        prompt_for_file_name = false,
        file_name = "%y%m%d-%H%M%S",
        extension = "avif",
        process_cmd = "magick convert - -quality 75 avif:-",
      },
      filetypes = {
        markdown = {
          template = "![image$CURSOR]($FILE_PATH)",
        },
        tex = {
          dir_path = "./figs",
          extension = "png",
          process_cmd = "",
          template = [[
      \begin{figure}[h]
        \centering
        \includegraphics[width=0.8\textwidth]{$FILE_PATH}
      \end{figure}
          ]], ---@type string | fun(context: table): string
        },
        typst = {
          dir_path = "./figs",
          extension = "png",
          process_cmd = "magick convert - -density 300 png:-",
          template = [[
            #align(center)[#image("$FILE_PATH", height: 80%)]
            ]],
        },
      },
    },
    keys = {
      -- suggested keymap
      { "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
    },
  },
  {
    "bullets-vim/bullets.vim",
    ft = { "markdown", "vimwiki", "quarto", "org" },
  },
}

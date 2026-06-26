vim.pack.add({
  'https://github.com/nvim-treesitter/nvim-treesitter',
  -- 'https://github.com/nvim-mini/mini.nvim',            -- if you use the mini.nvim suite
  -- 'https://github.com/nvim-mini/mini.icons',        -- if you use standalone mini plugins
  'https://github.com/nvim-tree/nvim-web-devicons', -- if you prefer nvim-web-devicons
  'https://github.com/MeanderingProgrammer/render-markdown.nvim',
  { src = "https://github.com/HakonHarnes/img-clip.nvim" },
  -- { src = "https://github.com/bullets-vim/bullets.vim" },
})
-- require('render-markdown').setup({}) -- only mandatory if you want to set custom options

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("SetupImgClip", { clear = true }),
  pattern = { "typst", "tex", "markdown" },
  once = true,
  callback = function()
    require("img-clip").setup({
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
    })
    -- require("bullets").setup({ })
  end,
})

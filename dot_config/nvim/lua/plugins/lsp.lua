vim.pack.add({
  { src = "https://github.com/mason-org/mason.nvim" },
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = 'https://github.com/mrcjkb/rustaceanvim',  version = vim.version.range('^9') },
  { src = "https://github.com/stevearc/conform.nvim" },
})

require("mason").setup()
vim.lsp.enable("marksman")
vim.lsp.enable("clangd")
vim.lsp.enable("rust-analyzer")
vim.lsp.enable("lua_ls")
vim.lsp.enable("stylua")
vim.lsp.enable("bashls")

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("SetupLSP", {}),
  callback = function(event)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "[G]oto [D]efinition（跳转到 [[链接]]）" })
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "悬停预览链接内容" })
    vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "[G]oto [R]eferences（查找谁引用了我）" })
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "[R]e[N]ame（重命名所有链接）" })
    vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)
  end,
})

require("conform").setup({
  lua = { "stylua" },
  sh = { "shfmt" },
  -- 格式化markdown文本里面的代码
  markdown = { "prettierd", "cbfmt" },
})

vim.pack.add({
  { src = "https://github.com/saghen/blink.cmp", version = 'v1.8.0' },
  -- { src = "https://github.com/saghen/blink.cmp" },
  -- { src = "https://github.com/saghen/blink.cmp", version = vim.version.range('1.*') },
})

vim.api.nvim_create_autocmd({ "InsertEnter", "CmdlineEnter" }, {
  group = vim.api.nvim_create_augroup("SetupCompletion", { clear = true }),
  once = true,
  callback = function()
    require("blink.cmp").setup({
      keymap = {
        preset = "none",
        -- ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
        ["<C-CR>"] = { "show", "show_documentation", "hide_documentation" },
        -- ["<C-q>"] = { "hide", "fallback" },
        ["<C-e>"] = { "hide", "fallback" },
        ["<Tab>"] = {
          function(cmp)
            if cmp.snippet_active() then
              return cmp.accept()
            else
              return cmp.select_and_accept()
            end
          end,
          "snippet_forward",
          "fallback",
        },
        ["<S-Tab>"] = { "snippet_backward", "fallback" },

        ["<Up>"] = { "select_prev", "fallback" },
        ["<Down>"] = { "select_next", "fallback" },
        ["<C-k>"] = { "select_prev", "fallback_to_mappings" },
        ["<C-j>"] = { "select_next", "fallback_to_mappings" },

        ["<C-b>"] = { "scroll_documentation_up", "fallback" },
        ["<C-f>"] = { "scroll_documentation_down", "fallback" },

        ["<C-h>"] = { "show_signature", "hide_signature", "fallback" },
      },

      appearance = {
        -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        use_nvim_cmp_as_default = false, -- 禁用 nvim-cmp 兼容模式
        nerd_font_variant = "mono",
      },

      -- (Default) Only show the documentation popup when manually triggered
      completion = {
        documentation = {
          auto_show = true,
          -- auto_show_delay_ms = 500,
            window = {
              border = "none",
              scrollbar = false,
            },
        },
        menu = {
          border = "none",
          auto_show = true,
          auto_show_delay_ms = 0,
          scrollbar = false,
        },
        ghost_text = {
          enabled = true,
        },
      },

      -- Default list of enabled providers defined so that you can extend it
      -- elsewhere in your config, without redefining it, due to `opts_extend`
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },

      cmdline = {
        completion = {
          menu = {
            auto_show = true,
          },
        },
      },

      signature = {
        enabled = true,
      },
    })
    end,
  })

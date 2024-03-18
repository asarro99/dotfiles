return {
	"hrsh7th/nvim-cmp",
	event = { "InsertEnter", "CmdlineEnter" },
	dependencies = {
		"hrsh7th/cmp-buffer", -- source for text in buffer
		"hrsh7th/cmp-path", -- source for file system paths
		"L3MON4D3/LuaSnip", -- snippet engine
		"saadparwaiz1/cmp_luasnip", -- for autocompletion

		"hrsh7th/cmp-cmdline",
		"f3fora/cmp-spell",
		"micangl/cmp-vimtex",
		"rafamadriz/friendly-snippets", -- useful snippets
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")

		local kind_icons = {
			article = "󰧮",
			book = "",
			incollection = "󱓷",
			Function = "󰊕",
			Constructor = "",
			Text = "󰦨",
			Method = "",
			Field = "󰅪",
			Variable = "󱃮",
			Class = "",
			Interface = "",
			Module = "",
			Property = "",
			Unit = "",
			Value = "󰚯",
			Enum = "",
			Keyword = "",
			Snippet = "",
			Color = "󰌁",
			-- Color = "",
			File = "",
			Reference = "",
			Folder = "",
			EnumMember = "",
			-- EnumMember = "",
			Constant = "󰀫",
			Struct = "",
			-- Struct = "",
			Event = "",
			Operator = "󰘧",
			TypeParameter = "",
		}

		cmp.setup({
			completion = {
				completeopt = "menu,menuone,preview,noselect",
				keyword_length = 1,
			},
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
				["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<CR>"] = cmp.mapping.confirm({ select = false }),
				["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
				["<C-e>"] = cmp.mapping.abort(), -- close completion window
			}),
			formatting = {
				fields = { "kind", "abbr", "menu" },
				format = function(entry, vim_item)
					vim_item.kind = string.format("%s", kind_icons[vim_item.kind]) -- Kind icons
					vim_item.menu = ({
						-- vimtex = (vim_item.menu ~= nil and vim_item.menu or "[VimTex]"),
						-- vimtex = test_fn(vim_item.menu, entry.source.name),
						vimtex = vim_item.menu,
						luasnip = "[Snippet]",
						nvim_lsp = "[LSP]",
						buffer = "[Buffer]",
						spell = "[Spell]",
						-- orgmode = "[Org]",
						-- latex_symbols = "[Symbols]",
						cmdline = "[CMD]",
						path = "[Path]",
					})[entry.source.name]
					return vim_item
				end,
			},
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "vimtex" },
				{ name = "buffer", keyword_length = 3 },
				{
					name = "spell",
					keyword_length = 4,
					option = {
						keep_all_entries = false,
						enable_in_context = function()
							return true
						end,
					},
				},
				{ name = "path" },
				{ name = "codeium" },
				{ name = "crates" },
			}),
			confirm_opts = {
				behavior = cmp.ConfirmBehavior.Replace,
				select = false,
			},
			view = {
				entries = "custom",
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
				-- completion = {
				--   border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
				-- },
				-- documentation = {
				--   border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
				-- },
			},
			performance = {
				trigger_debounce_time = 500,
				throttle = 550,
				fetching_timeout = 80,
			},
		})
		-- `/` cmdline setup.
		cmp.setup.cmdline("/", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" },
			},
		})

		-- `:` cmdline setup.
		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "path" },
				{ name = "cmdline" },
			},
		})
	end,
}

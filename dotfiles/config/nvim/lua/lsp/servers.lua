return {
	lua_ls = {
		settings = {
			Lua = {
				workspace = { checkThirdParty = false },
				codeLens = { enable = true },
				completion = { callSnippet = "Replace" },
				hint = {
					enable = true,
					setType = false,
					paramType = true,
					paramName = "Disable",
					semicolon = "Disable",
					arrayIndex = "Disable",
				},
			},
		},
	},

	ty = {},

	ruff = {
		cmd_env = { RUFF_TRACE = "messages" },
		init_options = { settings = { logLevel = "error" } },
	},

	gopls = {
		settings = {
			gopls = {
				analyses = {
					unusedparams = true,
					shadow = true,
					nilness = true,
					unusedwrite = true,
				},
				staticcheck = true,
				usePlaceholders = true,
				hints = {
					assignVariableTypes = true,
					compositeLiteralFields = true,
					constantValues = true,
					parameterNames = true,
					rangeVariableTypes = true,
				},
			},
		},
	},

	bashls = {},

	tinymist = {
		single_file_support = true,
		settings = { formatterMode = "typstyle" },
	},

	jsonls = {},

	dockerls = {},

	docker_compose_language_service = {},

	vtsls = {
		settings = {
			typescript = {
				format = { enable = false },
			},
			javascript = {
				format = { enable = false },
			},
		},
	},

	tailwindcss = {
		filetypes = {
			"css",
			"scss",
			"less",
			"html",
			"handlebars",
			"twig",
			"javascriptreact",
			"typescriptreact",
			"svelte",
			"vue",
		},
		settings = {
			tailwindCSS = {
				includeLanguages = {
					elixir = "html-eex",
					eelixir = "html-eex",
					heex = "html-eex",
				},
			},
		},
	},

	yamlls = {
		yaml = {
			format = {
				enable = true,
				singleQuote = false,
				bracketSpacing = true,
			},
			schemaStore = {
				enable = true,
			},
		},
	},

	nixd = {
		settings = {
			nixd = {
				formatting = {
					command = { "nixfmt" },
				},
				options = {
					nixos = {
						expr = '(builtins.getFlake ("git+file://" + toString ./.)).nixosConfigurations.sachin.options',
					},
				},
			},
		},
	},

	texlab = {
		settings = {
			texlab = {
				build = {
					onSave = true,
				},
			},
		},
	},

	biome = {
		filetypes = {
			"css",
			"scss",
			"less",
			"html",
			"handlebars",
			"twig",
			"javascript",
			"typescript",
			"javascriptreact",
			"typescriptreact",
			"svelte",
			"vue",
			"astro",
		},
	},
}

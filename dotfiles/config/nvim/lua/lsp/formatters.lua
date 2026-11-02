return {
	lua = { "stylua" },
	python = { "ruff_format", "ruff_organize_imports" },
	go = { "goimports", "gofumpt" },
	sh = { "shfmt" },
	typst = { "typstyle", opts = { lsp_format = "prefer" } },
	typescript = { "oxfmt" },
	typescriptreact = { "oxfmt" },
	javascript = { "oxfmt" },
	astro = { "oxfmt" },
	nix = { "nixfmt" },
	tex = { "tex-fmt" },
	latex = { "tex-fmt" },
}

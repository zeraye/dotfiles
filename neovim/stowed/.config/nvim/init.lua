vim.o.relativenumber = true
vim.o.number = true

vim.o.tabstop = 2
vim.o.shiftwidth = 2

vim.o.mouse = "a"

vim.o.termguicolors = true
vim.o.background="dark"
vim.cmd('colorscheme gruvbox-material')

-- Bootstrap packer
-- https://github.com/wbthomason/packer.nvim#bootstrapping
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
print(install_path)
local packer_bootstrap = nil
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
end

vim.cmd([[packadd packer.nvim]])

require("packer").startup(function(use)
		use("wbthomason/packer.nvim")

		use("tpope/vim-sensible")
		use("tpope/vim-surround")
		use("tpope/vim-repeat")
		use("wellle/targets.vim")
		use("tpope/vim-unimpaired")
		use("sainnhe/gruvbox-material")

		-- https://github.com/wbthomason/packer.nvim#bootstrapping
		if packer_bootstrap then
			require("packer").sync()
		end
	end)

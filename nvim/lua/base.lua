--vim内のエンコード
vim.scriptencoding  = "utf-8"

local augroup = vim.api.nvim_create_augroup

local autocmd = vim.api.nvim_create_autocmd

autocmd("VimEnter", {
	pattern = "*",

	--ファイラーを開いておく
	command = "Lex|vertical resize 30|wincmd p",
})

autocmd("TermOpen", {
	pattern = "*",

	--ターミナルをインサートモードで開く
	command = "startinsert",
})

local options = {

	--行番号
	number = true,

	--vimで使う文字コードの宣言
	encoding = "utf-8",

	fileencoding = "utf-8",

	--クリップボードの共有
	clipboard = "unnamedplus",

	--インデントを空白4つ分にする
	ts = 4,
	sw = 4,

	--showmatchの時間
	matchtime = 1,

	--ステータスラインをいつも表示する
	laststatus = 2,

	--制御文字を表示
	list,

	--タブをスペースにする
	et,

	--対応する括弧を表示する
	showmatch,

	--Cのインデント
	cin,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.cmd([[
filetype plugin indent on
syntax enable
]])

--WSL clipboard
if vim.fn.has("wsl") then
  vim.g.clipboard = {
    name = "win32yank-wsl",
    copy = {
      ["+"] = "win32yank.exe -i --crlf",
      ["*"] = "win32yank.exe -i --crlf"
    },
    paste = {
      ["+"] = "win32yank.exe -o --crlf",
      ["*"] = "win32yank.exe -o --crlf"
    },
    cache_enable = 0,
  }
end

--dein
if vim.fn.has("win64") == 1 then

	local win_home = '\\Users\\shunt'

	vim.o.runtimepath = win_home..'\\.cache\\dein\\repos\\github.com\\Shougo\\dein.vim'..','..vim.o.runtimepath

	vim.call('dein#begin', win_home..'\\.cache\\dein', {})

	local toml_dir = win_home..'\\AppData\\Local\\nvim\\'

else
	--linux
	local dein_dir = vim.env.HOME..'/.cache/dein'

	local dein_repo_dir = dein_dir..'/repo/github.com/Shougo/dein.vim'

	--deinがなかったら取得する
	if not string.match(vim.o.runtimepath, '/dein.vim') then
		if vim.fn.isdirectory(dein_repo_dir) ~= 1 then
			os.execute('git clone https://github.com/Shougo/dein.vim'..' '..dein_repo_dir)
		end

		vim.o.runtimepath = dein_repo_dir..','..vim.o.runtimepath
	end

	vim.call('dein#begin', dein_dir)

	--必要？
	vim.call('dein#add', dein_repo_dir)

	toml_dir = vim.env.HOME..'/.config/nvim/'

end

vim.call('dein#load_toml', toml_dir..'dein_no_lazy.toml', {lazy = 0})

vim.call('dein#load_toml', toml_dir..'dein_lazy.toml', {lazy = 1})

vim.call('dein#end')

--netrw
--tree形式
vim.g.netrw_liststyle = 3

--ヘッダを非表示にする
vim.g.netrw_banner = 0

--サイズを(K,M,G)で表示する
vim.g.netrw_sizestyle = "H"

--日付フォーマットを yyyy/mm/dd(曜日) hh:mm:ss で表示する
vim.g.netrw_timefmt = "%Y/%m/%d(%a) %H:%M:%S"

--プレビューウィンドウを垂直分割で表示する
vim.g.netrw_preview = 1

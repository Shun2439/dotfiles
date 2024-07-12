vim.opt.fileencodings = {"utf-8", "cp932"}

vim.o.clipboard = "unnamedplus"

vim.o.number = true

vim.o.expandtab = true
vim.o.sw = 2
vim.o.ts = 2
vim.o.smartindent = true

-- ファイルツリーの表示形式、1にするとls -laのような表示になります
vim.g.netrw_liststyle=3
-- ヘッダを非表示にする
vim.g.netrw_banner=0
-- サイズを(K,M,G)で表示する
vim.g.netrw_sizestyle="H"
-- 日付フォーマットを yyyy/mm/dd(曜日) hh:mm:ss で表示する
vim.g.netrw_timefmt="%Y/%m/%d(%a) %H:%M:%S"
-- プレビューウィンドウを垂直分割で表示する
vim.g.netrw_preview=1


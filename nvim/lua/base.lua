local options = {
  fileencodings = {"utf-8", "cp932"},
  clipboard = "unnamedplus",
  number = true,
  expandtab = true,
  sw = 2,
  ts = 2,
  smartindent = true,
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

-- <https://qiita.com/gorilla0513/items/bf2f78dfec67242f5bcf>
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


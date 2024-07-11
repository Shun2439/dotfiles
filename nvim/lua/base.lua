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


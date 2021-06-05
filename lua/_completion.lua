local M = {}

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif vim.fn.call("vsnip#available", {1}) == 1 then
    return t "<Plug>(vsnip-expand-or-jump-next)"
  else
    return t "<Tab>"
  end
end

_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
    return t "<Plug>(vsnip-jump-prev)"
  else
    return t "<S-Tab>"
  end
end

_G.cr_complete_i = function()
  if vim.fn.pumvisible() == 1 then
    if vim.fn.complete_info()["selected"] ~= "-1" then
      return t "<Plug>(completion_confirm_completion)"
    else
      return t "<C-e><CR>"
    end
  elseif vim.fn.call("vsnip#available", {1}) == 1 then
    return t "<Plug>(vsnip-expand-or-jump)"
  else
    return t "<Plug>(PearTreeExpand)"
  end
end

function M.compe()
  require'compe'.setup {
    enabled = true;
    autocomplete = true;
    debug = false;
    min_length = 1;
    preselect = 'enable';
    throttle_time = 80;
    source_timeout = 200;
    incomplete_delay = 400;
    max_abbr_width = 100;
    max_kind_width = 100;
    max_menu_width = 100;
    documentation = true;
    --allow_prefix_unmatch = false;

    source = {
      path = true;
      buffer = {menu = '[BUF]'};
      calc = true;
      vsnip = {menu = '[SNP]'};
      nvim_lsp = {menu = '[LSP]'};
      nvim_lua = {menu = '[LUA]'};
      spell = true;
      tags = true;
      snippets_nvim = true;
      utilsnips = true;
      treesitter = true;
    };
  }
  vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr=true})
  vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr=true})
  vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr=true})
  vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr=true})
  vim.api.nvim_set_keymap("i", "<CR>", "compe#confirm({'keys': '<Plug>(PearTreeExpand)', 'mode':''})", {noremap=true, silent=true, expr=true})
  vim.api.nvim_set_keymap("i", "<C-Space>", "compe#complete()", {noremap=true, silent = true, expr=true})
  vim.api.nvim_set_keymap("i", "<BS>", "<Plug>(PearTreeBackspace)", {})

  vim.g.vsnip_snippet_dir = vim.fn.stdpath("config").."/snippets"
  vim.g.vsnip_filetypes = {
    javascriptreact = {'javascript', 'html'},
    typescriptreact = {'typescript', 'html'}
 }

end

function M.kinds()
  require('vim.lsp.protocol').CompletionItemKind = {
    ' Text';        -- = 1
    'ƒ Method';      -- = 2;
    ' Function';    -- = 3;
    ' Constructor'; -- = 4;
    'Field';         -- = 5;
    ' Variable';    -- = 6;
    ' Class';       -- = 7;
    'ﰮ Interface';   -- = 8;
    ' Module';      -- = 9;
    ' Property';    -- = 10;
    ' Unit';        -- = 11;
    ' Value';       -- = 12;
    '了Enum';        -- = 13;
    ' Keyword';     -- = 14;
    '﬌ Snippet';     -- = 15;
    ' Color';       -- = 16;
    ' File';        -- = 17;
    'Reference';     -- = 18;
    ' Folder';      -- = 19;
    ' EnumMember';  -- = 20;
    ' Constant';    -- = 21;
    ' Struct';      -- = 22;
    'Event';         -- = 23;
    'Operator';      -- = 24;
    'TypeParameter'; -- = 25;
  }
end

return M

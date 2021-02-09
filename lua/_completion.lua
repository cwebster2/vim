local M = {}

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif vim.fn.call("vsnip#jumpable", {1}) == 1 then
    return t "<Plug>(vsnip-jump-next)"
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

function M.completion()
  vim.g.completion_enable_snippet = "vim-vsnip"
  vim.g.completion_matching_ignore_case = 1
  vim.g.completion_matching_strategy_list = {"exact", "substring", "fuzzy"}
  vim.g.completion_auto_change_source = 1
  vim.g.completion_trigger_on_delete = 1
  vim.g.completion_enable_auto_hover = 1
  vim.g.completion_enable_auto_signature = 1
  vim.g.completion_enable_auto_paren = 1
  vim.g.completion_confirm_key = ""
  vim.g.completion_customize_lsp_label = {
    Function = ' [function]',
    Method = ' [method]',
    Reference = ' [refrence]',
  }
  vim.g.completion_items_priority = {
    Function = 10,
    Method = 5,
    Reference = 9
  }
  vim.g.completion_chain_complete_list = {
    default = {
      default = {
        { complete_items = { 'lsp', 'snippet', 'path', 'buffers', 'tags'} },
        {complete_items = {'path'}, triggered_only = {'/'}},
      },
      string = {
        {complete_items = {'path'}, triggered_only = {'/'}},
        { complete_items = { 'buffers'} },
      },
    },
    c = { complete_items = { 'ts' }}
  }

  -- TODO handle esc so it does not leave text behind
  vim.g.lexima_no_default_rules = "v:true"
  --vim.fn.call("lexima#set_default_rules", {})
  vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr=true})
  vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr=true})
  vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr=true})
  vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr=true})
  vim.api.nvim_set_keymap("i", "<CR>", "v:lua.cr_complete_i()", {expr=true})
  vim.api.nvim_set_keymap("i", "<BS>", "<Plug>(PearTreeBackspace)", {})
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

    source = {
      path = true;
      buffer = true;
      calc = true;
      vsnip = true;
      nvim_lsp = true;
      nvim_lua = true;
      spell = true;
      tags = true;
      snippets_nvim = true;
      treesitter = true;
    };
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

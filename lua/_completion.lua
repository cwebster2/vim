local M = {}

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

_G.tab_complete_i = function()
  if vim.fn.call("neosnippet#jumpable", {}) == 1 then
    return t "<Plug>(neosnippet_expand_or_jump)"
  elseif vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  else
    return t "<Tab>"
  end
end

_G.tab_complete_s = function()
  if vim.fn.call("neosnippet#expandable_or_jumpable", {}) == 1 then
    return t "<Plug>(neosnippet_expand_or_jump)"
  elseif vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  else
    return t "<Tab>"
  end
end

_G.stab_complete_i = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  else
    return t "<S-Tab>"
  end
end

--    <expr><CR> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-y>" : "\<Plug>(PearTreeExpand)"
_G.cr_complete_i = function()
  if vim.fn.pumvisible() == 1 then
    if vim.fn.complete_info()["selected"] ~= "-1" then
      return t "<Plug>(completion_confirm_completion)"
    else
      return t "<C-e><CR>"
    end
  elseif vim.fn.call("neosnippet#expandable_or_jumpable", {}) == 1 then
    return t "<Plug>(neosnippet_expand_or_jump)"
  else
    return t "<Plug>(PearTreeExpand)"
  end
end

function M.completion()
  vim.g.completion_enable_snippet = "Neosnippet"
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
  vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete_i()", {expr=true})
  vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete_s()", {expr=true})
  vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.stab_complete_i()", {expr=true})
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

return M

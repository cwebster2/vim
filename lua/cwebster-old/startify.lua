local M = {}
local g =vim.g

function M.setup()
  g.startify_session_autoload = 1
  g.startify_session_delete_buffers = 1
  g.startify_change_to_vcs_root = 1
  g.startify_fortune_use_unicode = 1
  g.startify_session_persistence = 1

  g.startify_lists = {
            { ['type'] = 'files',     ['header'] = {'   Files'}             },
            { ['type'] = 'dir',       ['header'] = {'   Current Directory'} },
            { ['type'] = 'sessions',  ['header'] = {'   Sessions'}          },
            { ['type'] = 'bookmarks', ['header'] = {'   Bookmarks'}         },
            }
  g.startify_bookmarks = {
            { ['c'] = '~/.config/i3/config' },
            { ['k'] = '~/.config/kitty/kitty.conf' },
            { ['i'] = '~/.config/nvim/init.lua' },
            { ['z'] = '~/.zshrc' },
              '~/src',
            }
end

return M

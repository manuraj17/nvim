-- General keymaps for the editor functions
-- Plugin keymaps are not included here

--#region Keymaps
vim.g.mapleader = " "

-- Shift lines up and down using J and K in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- https://github.com/jchilders/dotfiles/blob/main/xdg_config/nvim/lua/core/mappings.lua
-- Prevent `Q` from taking us into Ex mode because this isn't 1980
vim.keymap.set("n", "Q", "<NOP>")

-- center screen after search
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- better up/down
vim.keymap.set(
  "n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true }
)
vim.keymap.set(
  "n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true }
)
-- vim.keymap.set("i", "A-j", ":m '>+1<CR>gv-gv", { expr = true, silent = true })
-- vim.keymap.set("i", "A-k", ":m '<-2<CR>gv-gv", { expr = true, silent = true })

-- Switch buffers with <shift> hl
vim.keymap.set("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
vim.keymap.set("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })

-- Clear search with <esc>
vim.keymap.set(
  { "i", "n" },
  "<esc>",
  "<cmd>noh<cr><esc>",
  { desc = "Escape and clear hlsearch" }
)

-- Clear search and redraw
vim.keymap.set(
  "n",
  "<leader>r",
  "<cmd>noh<cr><cmd>redraw<cr><c-l>",
  { desc = "Redraw and clear hlsearch" }
)

-- Oil
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

local wk = require("which-key")
local gs = package.loaded.gitsigns

-- space space for find_files
wk.register({
  ["<space>"] = {
    ["<space>"] = { "<cmd>Telescope find_files<cr>", "Find File" },
    f = {
      name = "+file",
      f = { "<cmd>Telescope find_files<cr>", "Find File" },
      r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
      n = { "<cmd>enew<cr>", "New File" },
    },
    b = {
      name = "+buffer",
      b = { "<cmd>Telescope buffers<cr>", "Buffers" },
      d = { "<cmd>bd<cr>", "Delete Buffer" },
    },
    g = {
      name = "+git",
      -- status using neogit
      g = {
        function()
          require("neogit").open()
        end,
        "status"
      },
      t = {
        name = "+toggle",
        -- toggle deleted
        d = {
          "<cmd>lua require('gitsigns').toggle_deletions()<cr>",
          "Toggle Deleted"
        },
        -- toggle git blame
        b = {
          "<cmd>lua require('gitsigns').toggle_current_line_blame()<cr>",
          "Toggle Blame"
        },
      },
      C = { "<cmd>Telescope git_commits<cr>", "Git Commits" },
      B = { "<cmd>Telescope git_branches<cr>", "Git Branches" },
      h = {
        name = "+hunk",
        P = {
          function()
            if vim.wo.diff then return ']c' end
            vim.schedule(function() gs.preview_hunk() end)
            return '<Ignore>'
          end,
          "preview hunk"
        },
        p = {
          function()
            if vim.wo.diff then return ']c' end
            vim.schedule(function() gs.next_hunk() end)
            return '<Ignore>'
          end,
          "previous hunk",
        },
        n = {
          function()
            if vim.wo.diff then return '[c' end
            vim.schedule(function() gs.prev_hunk() end)
            return '<Ignore>'
          end,
          "next hunk",
        },
        -- s = {
        --   {
        --     "<cmd>lua require('gitsigns').stage_hunk()<cr>",
        --     "stage hunk"
        --   },
        --   { mode = { 'n', 'v' }, silent = true }
        -- },
        r = {
          {
            "<cmd>lua require('gitsigns').reset_hunk()<cr>",
            "reset hunk"
          },
          { mode = { 'n', 'v' }, silent = true }
        },
        t = { {
          "<cmd><C-u>lua require('gitsigns').select_hunk()<cr>",
          "select hunk"
        }, { mode = { "o", "x" } },
        },
        s = {
          name = "+stage",
          b = { function() gs.stage_buffer() end, "stage buffer" },
          u = { function() gs.undo_stage_buffer() end, "unstage buffer" },
          r = { function() gs.reset_buffer() end, "reset buffer" },
        }
      },
      d = {
        name = "+diff",
        h = { function() gs.diffthis() end, "diff hunk" },
        f = { function() gs.diffthis('~') end, "Diff this" },
      },
      -- D = { function() gs.reset_hunk() end, "reset hunk" },}
    },
    h = {
      name = "+help",
      h = { "<cmd>Telescope help_tags<cr>", "Help Tags" },
      -- c = { "<cmd>Telescope commands<cr>", "Commands" },
      -- command history
      c = { "<cmd>Telescope command_history<cr>", "Command History" },
    },
    p = {
      name = "+project",
      -- list all projects using telescope project extension
      p = { "<cmd>Telescope projects<cr>", "Projects" },
    },
    s = {
      name = "+search",
      s = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
    },

    y = {
      name = "+yank",
      y = { "<cmd>Telescope neoclip<cr>", "Yank History" },
    },
  },
})

-- vim.keymap.set(
--   'n',
--   '<leader>pp',
--   function() require('telescope').extensions.projects.projects() end,
--   { desc = "List all projects" }
-- )


wk.register({
  ["<leader>"] = {
    d = {
      -- Work in progress
      name = "+debug",
      d = { "<cmd>TroubleToggle<cr>", "Trouble" },
      r = { "<cmd>lua require'dap'.repl.open()<cr>", "Repl" },
      c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
      b = {
        "<cmd>lua require'dap'.toggle_breakpoint()<cr>",
        "Toggle Breakpoint"
      },
      B = {
        "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>",
        "Set Breakpoint"
      },
      BB = {
        "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>",
        "Log Point"
      },
    },
    l = {
      name = "+lsp",
      d = {
        name = "+diagnostics",
        -- open trouble plugin
        d = { "<cmd>TroubleToggle<cr>", "Trouble" },
        l = {
          "<cmd>lua vim.diagnostic.setloclist()<cr>",
          "List Diagnostics"
        },
        p = {
          "<cmd>lua vim.diagnostic.goto_prev({popup_opts = {border = 'rounded'}})<cr>",
          "Previous Diagnostic"
        },
        o = {
          "<cmd>lua vim.diagnostic.open_float(0, {border = 'rounded'})<cr>",
          "line diagnostics"
        },
        n = {
          "<cmd>lua vim.diagnostic.goto_next({popup_opts = {border = 'rounded'}})<cr>",
          "Next Diagnostic"
        },
      },
      f = {
        name = "+file",
        -- f = { "<cmd>Telescope find_files<cr>", "Find File" },
        r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
        -- n = { "<cmd>enew<cr>", "New File" },
      },
      a = {
        name = "+actions",
        c = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
        f = { "<cmd>lua vim.lsp.buf.format { async = true }<cr>", "Format" },
      },
      r = {
        name = "+refactor",
        r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
      },
      w = {
        name = "+workspace",
        s = {
          "<cmd>Telescope lsp_workspace_symbols<cr>",
          "Workspace Symbols"
        },
        d = { "<cmd>lua vim.lsp.buf.type_definition()<cr>", "Type Definition" },
        f = {
          name = "+folder",
          a = {
            "<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>",
            "Add Folder"
          },
          r = {
            "<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>",
            "Remove Folder"
          },
          v = {
            "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>",
            "View Folders"
          },
        }
      },
      b = {
        name = "+buffer",
        s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
        d = { "<cmd>lua vim.lsp.buf.document_symbol()<cr>", "Document Symbol" },
        i = { "<cmd>lua vim.lsp.buf.incoming_calls()<cr>", "Incoming Calls" },
        o = { "<cmd>lua vim.lsp.buf.outgoing_calls()<cr>", "Outgoing Calls" },
      }
    }
  },
  ["g"] = {
    name = "+goto",
    t = { "<cmd>lua vim.lsp.buf.type_definition()<cr>", "Type Definition" },
    d = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Definition" },
    D = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Declaration" },
    i = { "<cmd>lua vim.lsp.buf.implementation()<cr>", "Implementation" },
    r = { "<cmd>lua vim.lsp.buf.references()<cr>", "References" },
  },
  t = {
    name = "+treesitter",
    t = { "<cmd>Telescope treesitter<cr>", "Treesitter" },
  },
})

-- register in insert mode i for signature_help
wk.register({
  ["<C-h>"] = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Signature Help" },
}, { mode = "i" })

-- register in normal mode K for hover
wk.register({
  ["K"] = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover" },
}, { mode = "n" })


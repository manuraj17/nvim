-- Galaxyline
-- https://github.com/glepnir/nvim/blob/main/lua/modules/ui/eviline.lua
local status_ok, galaxyline = pcall(require, 'galaxyline')
if not status_ok then
  return
end

-- local colors = require('galaxyline.theme').default
local condition = require('galaxyline.condition')
local gls = galaxyline.section
galaxyline.short_line_list = { 'NvimTree', 'vista', 'dbui', 'packer', 'lspsagaoutline' }

local colors = {
  blue = "#8fbcbb",
  green = "#a3be8c",
  purple = "#c586c0",
  red1 = "#e06c75",
  red2 = "#be5046",
  yellow = "#ebcb8b",
  orange = "#ce9178",
  fg = "#d4d4d4",
  bg = "#1e2027",
  gray1 = "#5c6370",
  gray2 = "#2c323d",
  gray3 = "#3e4452",

  cyan = '#008080',
  darkblue = '#081633',
  violet = '#a9a1e1',
  magenta = '#c678dd',

  -- evil_red = "#ab2417"
}

gls.left[1] = {
  RainbowRed = {
    provider = function()
      return '▊ '
    end,
    highlight = { colors.blue, colors.bg },
  },
}

gls.left[2] = {
  ViMode = {
    provider = function()
      -- auto change color according the vim mode
      local mode_color = {
        ['!'] = colors.red1,
        [''] = colors.yellow,
        [''] = colors.orange,
        ['r?'] = colors.cyan,
        c = colors.magenta,
        ce = colors.red1,
        cv = colors.red1,
        i = colors.green,
        ic = colors.yellow,
        n = colors.fg,
        no = colors.fg,
        r = colors.cyan,
        R = colors.violet,
        rm = colors.cyan,
        Rv = colors.violet,
        s = colors.orange,
        S = colors.orange,
        t = colors.red1,
        v = colors.yellow,
        V = colors.yellow,
      }
      vim.api.nvim_command(
        'hi GalaxyViMode guifg=' .. mode_color[vim.fn.mode()] .. ' guibg=' .. colors.bg
      )
      return '  '
    end,
  },
}

gls.left[3] = {
  FileSize = {
    condition = condition.buffer_not_empty,
    highlight = { colors.fg, colors.bg },
    provider = 'FileSize',
  },
}

gls.left[6] = {
  LineInfo = {
    highlight = { colors.fg, colors.bg },
    provider = 'LineColumn',
    separator = ' ',
    separator_highlight = { 'NONE', colors.bg },
  },
}

gls.left[7] = {
  PerCent = {
    highlight = { colors.fg, colors.bg, 'bold' },
    provider = 'LinePercent',
    separator = ' ',
    separator_highlight = { 'NONE', colors.bg },
  },
}

gls.left[8] = {
  DiagnosticError = {
    highlight = { colors.red, colors.bg },
    icon = '  ',
    provider = 'DiagnosticError',
  },
}

gls.left[9] = {
  DiagnosticWarn = {
    highlight = { colors.yellow, colors.bg },
    icon = '  ',
    provider = 'DiagnosticWarn',
  },
}

gls.left[10] = {
  DiagnosticHint = {
    highlight = { colors.cyan, colors.bg },
    icon = '  ',
    provider = 'DiagnosticHint',
  },
}

gls.left[11] = {
  DiagnosticInfo = {
    highlight = { colors.blue, colors.bg },
    icon = '  ',
    provider = 'DiagnosticInfo',
  },
}

gls.mid[1] = {
  ShowLspClient = {
    condition = function()
      local tbl = { ['dashboard'] = true, [''] = true }
      if tbl[vim.bo.filetype] then
        return false
      end
      return true
    end,
    highlight = { colors.yellow, colors.bg, 'bold' },
    icon = ' LSP:',
    provider = 'GetLspClient',
  },
}

gls.mid[1] = {
  FileIcon = {
    condition = condition.buffer_not_empty,
    highlight = { require('galaxyline.provider_fileinfo').get_file_icon_color, colors.bg },
    provider = 'FileIcon',
  },
}

gls.mid[2] = {
  FileName = {
    condition = condition.buffer_not_empty,
    highlight = { colors.fg, colors.bg, 'bold' },
    provider = 'FileName',
  },
}

gls.mid[3] = {
  GitIcon = {
    provider = function()
      return '  '
    end,
    condition = condition.check_git_workspace,
    highlight = { colors.violet, colors.bg, 'bold' },
    separator = ' ',
    separator_highlight = { 'NONE', colors.bg },
  },
}

gls.mid[4] = {
  GitBranch = {
    condition = condition.check_git_workspace,
    highlight = { colors.violet, colors.bg, 'bold' },
    provider = 'GitBranch',
  },
}

gls.right[1] = {
  ShowLspClient = {
    condition = function()
      local tbl = { ['dashboard'] = true, [''] = true }
      if tbl[vim.bo.filetype] then
        return false
      end
      return true
    end,
    highlight = { colors.yellow, colors.bg, 'bold' },
    icon = ' LSP:',
    provider = 'GetLspClient',
  },
}

gls.right[2] = {
  FileEncode = {
    condition = condition.hide_in_width,
    highlight = { colors.green, colors.bg, 'bold' },
    provider = 'FileEncode',
    separator = ' ',
    separator_highlight = { 'NONE', colors.bg },
  },
}

gls.right[3] = {
  FileFormat = {
    condition = condition.hide_in_width,
    highlight = { colors.green, colors.bg, 'bold' },
    provider = 'FileFormat',
    separator = ' ',
    separator_highlight = { 'NONE', colors.bg },
  },
}

gls.right[4] = {
  Separator = {
    highlight = { colors.fg, colors.bg, 'bold' },
    provider = function()
      return ' '
    end,
  },
}

gls.right[5] = {
  DiffAdd = {
    condition = condition.hide_in_width,
    highlight = { colors.green, colors.bg },
    icon = '  ',
    provider = 'DiffAdd',
  },
}

gls.right[6] = {
  DiffModified = {
    condition = condition.hide_in_width,
    highlight = { colors.orange, colors.bg },
    icon = ' 柳',
    provider = 'DiffModified',
  },
}

gls.right[7] = {
  DiffRemove = {
    condition = condition.hide_in_width,
    highlight = { colors.red, colors.bg },
    icon = '  ',
    provider = 'DiffRemove',
  },
}

gls.right[8] = {
  RainbowBlue = {
    provider = function()
      return ' ▊'
    end,
    highlight = { colors.blue, colors.bg },
  },
}

gls.short_line_left[1] = {
  BufferType = {
    highlight = { colors.blue, colors.bg, 'bold' },
    provider = 'FileTypeName',
    separator = ' ',
    separator_highlight = { 'NONE', colors.bg },
  },
}

gls.short_line_left[2] = {
  SFileName = {
    condition = condition.buffer_not_empty,
    highlight = { colors.fg, colors.bg, 'bold' },
    provider = 'SFileName',
  },
}

gls.short_line_right[1] = {
  BufferIcon = {
    highlight = { colors.fg, colors.bg },
    provider = 'BufferIcon',
  },
}


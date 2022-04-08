local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

local function num()
  return tostring(vim.fn.tabpagenr())
end

local function os_icon()
  local icons = {
    unix = "", -- e712
    dos = "", -- e70f
    mac = "", -- e711
  }
  if vim.fn.has "mac" == 1 then
    return icons.mac
  elseif vim.fn.has "win32" == 1 then
    return icons.dos
  else
    return icons.unix
  end
end

local setup = {
  options = {
    icons_enabled = true,
    -- theme = "ayu_dark",
    theme = "gruvbox_dark",
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch", "diff", "diagnostics" },
    lualine_c = { "filename" },
    lualine_x = { "encoding", "fileformat", "filetype" },
    lualine_y = { "progress" },
    lualine_z = { "location" },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = {
    "toggleterm",
  },
}

local function ins_left(component)
  table.insert(setup.sections.lualine_c, component)
end

local function ins_right(component)
  table.insert(setup.sections.lualine_x, component)
end

ins_left {
  -- Lsp server name .
  function()
    local msg = ""
    local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
      return msg
    end
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        return client.name
      end
    end
    return msg
  end,
  icon = " LSP:",
}

lualine.setup(setup)

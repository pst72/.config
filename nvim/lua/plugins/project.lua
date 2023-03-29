local M = {
  "ahmedkhalf/project.nvim",
  config = function()
    require("project_nvim").setup({
      patterns = {
        ".git",
        "package.json",
        ".terraform",
        "go.mod",
        "requirements.yml",
        "pyrightconfig.json",
        "pyproject.toml",
      },
      -- detection_methods = { "lsp", "pattern" },
      detection_methods = { "pattern" },
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    })
  end,
}
return M

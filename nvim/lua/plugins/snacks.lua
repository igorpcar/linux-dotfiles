return {
  "folke/snacks.nvim",
  opts = function(_, opts)
    table.remove(opts.dashboard.preset.keys, 3)
    table.insert(opts.dashboard.preset.keys, 3, {
      icon = " ",
      key = "p",
      desc = "Projectss",
      action = ":lua Snacks.picker.projects()",
    })
  end,
}

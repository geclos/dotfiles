require("spectre").setup({
  replace_engine = {
    ["sed"] = {
      cmd = "sed",
      args = {
        "-i",
        "",
        "-E",
      },
    },
  },
})
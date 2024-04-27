return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufreadPre", "BufNewFile" },
  main = "ibl",
  opts = {
    indent = { char = "|" },
  },
}


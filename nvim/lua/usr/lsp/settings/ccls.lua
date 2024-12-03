local opts = {
  init_options = {
    index = {
      threads = 10,  -- 设置 ccls 并行度为 10
    },
    clang = {
      excludeArgs = { "-Wall" },
    },

    highlight = {
      lsRanges = true,
    },

    client = {
      snippetSupport = true,
    },
  },
}

return opts

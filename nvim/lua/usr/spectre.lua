
-- 这个配置本意是希望 spectre 搜索完成后，自动关闭搜索窗口
-- 但是目前是没有生效
-- 后续再看看原因
-- 可以先用 leader + g 进行搜索
--
require('spectre').setup({
    mapping={
    ['enter_file'] = {
        map = "<cr>",
        cmd = "<cmd>lua require('spectre.actions').select_entry()<CR>",
        desc = "open file",
        is_close = true,
    }
  }
})

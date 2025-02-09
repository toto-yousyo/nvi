local ls = require("luasnip")
local s = ls.snippet        -- スニペット作成用のショートカット
local i = ls.insert_node    -- 挿入位置ノード
local t = ls.text_node      -- 固定テキストノード

-- "javascript" ファイルタイプ向けにスニペットを追加
ls.add_snippets({ "javascript", "javascriptreact", "typescript", "typescriptreact" }, { 
  s("af", {  -- トリガーは「af」
    t("const "), i(1, "functionName"), t(" = ("), i(2, "params"), t(") => {"),
    t({"", "  "}), i(0, "// body"), t({"", "};"})
  }),
})

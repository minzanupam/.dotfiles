local ls = require("luasnip")
-- some shorthands...
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local l = require("luasnip.extras").lambda
local r = require("luasnip.util.functions").rep
local p = require("luasnip.util.functions").partial

ls.snippets = {
	go = {
		s("func", {
			t("func "),
			i(1, "name"),
			t("("),
			i(2),
			t(") "),
			i(3),
			t({ "{", "" }),
			t("\t"),
			i(0),
			t({ "", "}" }),
		}),
		s("for", {
			t("for "),
			i(1, "i"),
			t(" := "),
			i(2, "0"),
			t("; "),
			f(function(args)
				return args[1][1] .. " "
			end, { 1 }),
			i(3, "< count"),
			t("; "),
			d(4, function(args)
				return sn(nil, {
					i(1, args[1][1] .. "++"),
				})
			end, { 1 }),
			t({ " {", "\t" }),
			i(0),
			t({ "", "}" }),
		}),
		s("forr", {
			t("for "),
			i(1, "i"),
			t(", "),
			i(2, "v"),
			t(" := range "),
			i(3, "arr"),
			t({ " {", "\t" }),
			i(0),
			t({ "", "}" }),
		}),
	},
	typescript = {
		s("fn", {
			t("function "),
			i(1, "function_name"),
			t("("),
			i(2),
			t(") "),
			i(3),
			t({ "{", "" }),
			t("\t"),
			i(0),
			t({ "", "}" }),
		}),
	},
}

--[[
--]]

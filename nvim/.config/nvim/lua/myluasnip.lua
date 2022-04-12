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

local fmt = require("luasnip.extras.fmt").fmt

local filename = tostring(vim.fn.expand("%:r"))

ls.add_snippets("java", {
	s(
		"pcl",
		fmt(
			[[
				public class {} {{
					{}
				}}
			]],
			{
				i(1, filename),
				i(0),
			}
		)
	),
	s(
		"main",
		fmt(
			[[
				public static void main(String args[]) {{
					{}
				}}
			]],
			{
				i(0),
			}
		)
	),
	s(
		"sc",
		fmt(
			[[
				import java.util.Scanner;
				Scanner sc = new Scanner(System.in);
			]],
			{}
		)
	),
	s(
		"p",
		fmt(
			[[
				System.out.println("{}");
			]],
			{
				i(0),
			}
		)
	),
	s(
		"class",
		fmt(
			[[
				class {} {{
					{classname} () {{
						{classname}
					}}
					{}
				}}
			]],
			{
				i(1, "ClassName"),
				classname = f(function(args)
					return args[1][1]
				end, { 1 }),
				i(0),
			}
		)
	),
})

ls.add_snippets("typescriptreact", {
	s(
		"rfc",
		fmt(
			[[
				interface {ifname} {{

				}}
				const {fname} = (props: {ifname}) => {{
					return (
						<>
							{markup}
						</>
					);
				}}
			]],
			{
				ifname = i(2),
				fname = i(1),
				markup = i(0),
			}
		)
	),
})

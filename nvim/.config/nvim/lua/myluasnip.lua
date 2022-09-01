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
	s(
		"set",
		fmt(
			[[
				void set{}({} {val}) {{
					this.{val} = {val};
				}}
			]],
			{
				i(1, "Name"),
				i(2, "String"),
				val = f(function(args)
					local str = args[1][1]
					local ret = str:gsub("^%u", string.lower)
					return ret
				end, { 1 }),
			}
		)
	),
	s(
		"get",
		fmt(
			[[
				{} get{}() {{
					return this.{val};
				}}
			]],
			{
				i(1, "returnType"),
				i(2, "Name"),
				val = f(function(args)
					local str = args[1][1]
					local ret = str:gsub("^%u", string.lower)
					return ret
				end, { 2 }),
			}
		)
	),
	s(
		"gs",
		fmt(
			[[
				{} get{}() {{
					return this.{val};
				}}
				void set{name}({rt} {val}) {{
					this.{val} = {val};
				}}
			]],
			{
				i(1, "String"),
				i(2, "Name"),
				rt = f(function(args)
					return args[1][1]
				end, {1}),
				name = f(function(args)
					return args[1][1]
				end, {2}),
				val = f(function(args)
					local str = args[1][1]
					local ret = str:gsub("^%u", string.lower)
					return ret
				end, { 2 }),
			}
		)
	)
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

local web_snippets = {
	s(
		"paper",
		fmt(
			[[
				box-shadow: 0px 1px 3px rgba(0,0,0,.24), 0 1px 2px rgba(0,0,0,.24);
				transition: all 0.3s cubic-bezier(.25,.8,.25,1);
			]],
			{ }
		)
	),
	s(
		"login",
		fmt(
			[[
				<form action="/login" method="post" class="login-form">
					<div class="login-form-container">
						<h2>Login</h2>
						<div class="input-container">
							<label for="email">email</label>
							<input name="email" type="email" required>
						</div>
						<div class="input-container">
							<label for="password">password</label>
							<input name="password" type="password" required>
						</div>
						<div class="button-container">
							<button type="submit">login</button>
							<button type="button">cancel</button>
						</div>
					</div>
				</form>
			]],
			{}
		)
	),
	s(
		"signup",
		fmt(
			[[
				<form action="/signup" method="post" class="signup-form">
					<div class="signup-form-container">
						<h2>sign-up</h2>
						<div class="input-container">
							<label for="first_name">first name</label>
							<input name="first_name" type="text" required>
						</div>
						<div class="input-container">
							<label for="last_name">last name</label>
							<input name="last_name" type="text" required>
						</div>
						<div class="input-container">
							<label for="username">username</label>
							<input name="username" type="text" required>
						</div>
						<div class="input-container">
							<label for="email">email</label>
							<input name="email" type="email" required>
						</div>
						<div class="input-container">
							<label for="password">password</label>
							<input name="password" type="password" required>
						</div>
						<div class="button-container">
							<button type="submit">signup</button>
							<button type="button">cancel</button>
						</div>
					</div>
				</form>
			]],
			{}
		)
	),
}

local web_langs = {'html', 'css', 'typescriptreact', 'typescript', 'react', 'svelte' }
for _,lang in pairs(web_langs) do
	ls.add_snippets(lang, web_snippets)
end


ls.add_snippets("c", {
	s("for", fmt([[
for (int {iter}=0; {iter_c}<{cont}; {iter_c}++) {{
	{}
}}
		]], {
			i(0),
			iter = i(1, "i"),
			iter_c = f(function(args) return args[1][1] end, {1}),
			cont = i(2, "n"),
	}))
})

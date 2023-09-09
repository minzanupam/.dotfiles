local ls = require("luasnip")
-- some shorthands...
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local l = require("luasnip.extras").lambda
local rep = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local types = require("luasnip.util.types")
local conds = require("luasnip.extras.conditions")
local conds_expand = require("luasnip.extras.conditions.expand")

ls.add_snippets("go", {
	s(
		"err",
		fmt(
			[[
	if err != nil {{
		w.WriteHeader({})
		log.Println(err)
		return
	}}
			]],
			{i(0)}
		)
	),
	s(
		"db",
		fmt(
			[[
	db, err := sql.Open("sqlite3", DB_NAME)
	defer db.Close()
	if err != nil {{
		log.Println(err)
		w.WriteHeader(http.StatusInternalServerError)
		return
	}}
			]],
			{}
		)
	),
	s(
		"queryexec",
		fmt(
			[[
	res, err := db.Exec(`{}`)
	if err != nil {{
		log.Println(err)
		w.WriteHeader(http.StatusInternalServerError)
		return
	}}
			]],
			{ i(0) }
		)
	),
	s(
		"queryrow",
		fmt(
			[[
	row := db.QueryRow(`{}`)
	{}
	row.Scan({})
			]],
			{ i(1), i(2), i(3) }
		)
	),
	s(
		"query",
		fmt(
			[[
	rows, err := db.Query(`{}`)
	defer rows.Close()
	if err != nil {{
		log.Println(err)
		w.WriteHeader(http.StatusInternalServerError)
		return
	}}
	for rows.Next() {{
		{}
		rows.Scan({})
	}}
			]],
			{ i(1), i(2), i(3) }
		)
	),
})

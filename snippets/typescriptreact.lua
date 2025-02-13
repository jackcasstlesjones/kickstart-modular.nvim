-- In ~/.config/nvim/snippets/typescript.lua
local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require('luasnip.extras.fmt').fmt
local rep = require('luasnip.extras').rep -- Add this line!

return {
  -- Basic React Component
  s(
    'rfc',
    fmt(
      [[
export default function {}() {{
  return (
    <>
      {}
    </>
  )
}}
]],
      {
        i(1, 'ComponentName'),
        i(2, '<h1>Hello World</h1>'),
      }
    )
  ),

  -- React Component with Props
  s(
    'rfcp',
    fmt(
      [[
interface {}Props {{
  {}
}}

export default function {}({{ {} }}: {}Props) {{
  return (
    <>
      {}
    </>
  )
}}
]],
      {
        i(1, 'ComponentName'),
        i(2, 'prop: string'),
        rep(1),
        i(3, 'prop'),
        rep(1),
        i(4, '<h1>Hello World</h1>'),
      }
    )
  ),
}

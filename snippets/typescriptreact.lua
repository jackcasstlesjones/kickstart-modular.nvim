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

  -- Arrow function with args

  s(
    'af',
    fmt(
      [[
const {} = ({}) => {{
  {}
}}
]],
      {
        i(1, 'functionName'), -- Function name
        i(2, 'arguments'), -- Function parameters
        i(3, '// Function body'), -- Function body placeholder
      }
    )
  ),

  -- useState
  s(
    'us',
    fmt(
      [[
const [{}] = useState({})
]],
      {
        i(1, 'state, setState'), -- Function name
        i(2, 'state'), -- Function parameters
      }
    )
  ),

  -- useState with type
  s(
    'ust',
    fmt(
      [[
const [{}] = useState<{}>({})
]],
      {
        i(1, 'state, setState'), -- Function name
        i(2, 'type'), -- Function parameters
        i(3, 'state'), -- Function parameters
      }
    )
  ),

  -- experimental useState
  --
  --p

  s(
    'uss',
    fmt(
      [[
const [{}, {}] = useState({});
]],
      {
        i(1, 'example'), -- The state variable name
        f(function(args)
          local var = args[1][1]
          return 'set' .. var:gsub('^%l', string.upper)
        end, { 1 }), -- Automatically generates the setter name (e.g., setExample)
        i(2, 'initialValue'), -- The initial state value
      }
    )
  ),
}

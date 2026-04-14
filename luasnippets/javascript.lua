local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

return {
  s("log", fmt("console.log({})", { i(1) })),

  s("af", fmt([[
const {} = ({}) => {{
  {}
}}]], { i(1, "name"), i(2, "args"), i(0) })),

  s("fn", fmt([[
{} ({}) {{
  {}
}}]], { i(1, "function"), i(2, "args"), i(0) })),

  s("reactfc", fmt([[
import React from 'react'

const {} = ({{ {} }}) => {{
  {}
}}

export default {}]], { i(1, "Component"), i(2), i(0), rep(1) })),

  s("reactcc", fmt([[
import React, {{ Component }} from 'react'

class {} extends Component {{
  constructor (props) {{
    super(props)
  }}

  render () {{
    return (
      {}
    )
  }}
}}

export default {}]], { i(1, "Component"), i(0), rep(1) })),

  s("jest", fmt([[
import React from 'react'
import {{ shallow }} from 'enzyme'
import {} from '../../components/{}'

describe('<{} />', () => {{
  it('renders without crashing', () => {{
    shallow(<{} />)
  }})

  {}
}})]], { i(1, "Component"), rep(1), rep(1), rep(1), i(0) })),

  s("it", fmt([[
it('{}', () => {{
  {}
}})]], { i(1), i(0) })),
}

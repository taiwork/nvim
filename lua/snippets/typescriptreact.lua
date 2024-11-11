local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s("homecomp", {
    t("const Home: React.FC = async () => {"),
    t({ "", "\treturn (" }),
    t({ "", '\t\t<div className="text-center text-x1">' }),
    t({ "", "\t\t\t<div>" }),
    t({ "", "\t\t\t\tHome" }),
    t({ "", "\t\t\t</div>" }),
    t({ "", "\t\t</div>" }),
    t({ "", "\t)" }),
    t({ "", "}", "" }),
    t({ "", "export default Home;" }),
  }),
  s("hello", {
    t('println("Hello World!")'),
  }),
}

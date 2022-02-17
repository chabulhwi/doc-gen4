import DocGen4.Output.Template
import DocGen4.Output.DocString

namespace DocGen4
namespace Output

open scoped DocGen4.Jsx

def ctorToHtml (i : NameInfo) : HtmlM Html := do
  let shortName := i.name.components'.head!.toString
  let name := i.name.toString
  pure <li «class»="constructor" id={name}>{shortName} : [←infoFormatToHtml i.type]</li>

def inductiveToHtml (i : InductiveInfo) : HtmlM (Array Html) := do
  let constructorsHtml := <ul "class"="constructors">[← i.ctors.toArray.mapM ctorToHtml]</ul>
  let docstringHtml? := i.doc.map docStringToHtml
  match docstringHtml? with
  | some d => pure #[constructorsHtml, d]
  | none   => pure #[constructorsHtml]

end Output
end DocGen4

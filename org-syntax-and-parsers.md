* Org Syntax

** Context Free Elements
"Context-free" means that  an element can be recognized  by looking at
its line alone, or at one or two lines above it.

- Headlines: can  contain a section,  except that the text  before the
  first headline belongs  to a section, but is not  contained inside a
  headline.
- Sections:  contains  directly any  greater  element  or element;  is
  usually contained by a headline.
- Planning lines
- Property drawers

Every other syntactical part exists within specific environments.

** Environments
Three categories are used to classify environments:

1. *Greater Elements*: parts that can contain an element or object.
2. *Elements*: defines syntactical parts that are at the same level as a
   paragraph; i.e., cannot contain or be included in a paragraph.
3. *Objects*:  a part that  could be included  in an element.

** Paragraphs
Paragraphs are the unit of measurement. If something does not parse,
then it is considered to be a paragraph.

** Affiliated Keywords
Many element  types can  be assigned  *attributes* by  adding specific
keywords ("affiliated keywords") just above the element considered.

#+begin_example
#+KEY: VALUE
#+KEY[OPTIONAL]: VALUE
#+ATTR_<BACKEND>: VALUE (multiple)
#+end_example

where =KEY= can be one of:

- =CAPTION= (multiple) (can contain objects)
- =CAPTION[OPTIONAL]=
- =HEADER= (multiple)
- =NAME=
- =PLOT=
- =RESULTS=
- =RESULTS[OPTIONAL]=


** Two Kinds of Elements

*** Greater Elements

*** Elements

* Org Parsing


ORG SYNTAX
==========

Greater element: can contain directly any other element or greater element except:
	elements of their own type,
	node properties, which can only be found in property drawers,
	items, which can only be found in plain lists.
	Greater blocks
	Drawers; Property drawers
	Dynamic blocks
	Footnote definitions
	Inline tasks
	Plain lists; items
	Property drawers
	Tables
Elements
	cannot contain any other element.
	can contain objects:
		keywords whose name belongs to org-element-document-properties
		verse blocks
		paragraphs
		table rows
	Babel call
	Blocks
	Clock, Diary Sexp and Planning
	Comments
	Fixed-width area
	Horizontal rules
	Keywords
		#+KEY: VALUE
			KEY cannot eq CALL or any Affiliated Keyword
	LaTeX environments
	Node properties
		can only exist in property drawers
		:NAME: VALUE
		:NAME+: VALUE
		:NAME:
		:NAME+:
	Paragraphs
		the default element; any unrecognized context is a paragraph
		Empty lines and other elements end paragraphs
		Paragraphs can contain every type of object.
	Table rows
Objects
	only found in certain places
	most cannot contain objects (some can)
	Entities and LaTeX fragments
	Export snippets
	Footnote references
	Inline Babel Calls and Source Blocks
	Line breaks
	Links
		4 major types of links:
	Macros
	Targets and Radio Targets
	Statistics Cookies
	Subscript and Superscript
	Table Cells
	Timestamps
	Text Markup

ORG PARSER: Org Elements
========================
org-element-parse-buffer: global
org-element-at-point
org-element-context &optional element
	returns smallest element or object around point
	return value is a list (TYPE PROPS)
	possible types are defined in 'org-element-all-elements and
				      'org-element-all-objects
	properties depend on element or object type
		always include:
			:begin :end :parent :post-blank
org-element-type
org-element-property
org-element-contents: AST
org-element-map: AST, list of elements or objects
org-element-put-property
org-element-extract-element
org-element-set-element
org-element-insert-before
org-element-adopt-element
org-element-interpret-data
org-element-lineage

org-element-all-elements
 (babel-call center-block clock comment comment-block diary-sexp drawer dynamic-block example-block export-block fixed-width footnote-definition headline horizontal-rule inlinetask item keyword latex-environment node-property paragraph plain-list planning property-drawer quote-block section special-block src-block table table-row verse-block)
org-element-all-objects
 (babel-call center-block clock comment comment-block diary-sexp drawer dynamic-block example-block export-block fixed-width footnote-definition headline horizontal-rule inlinetask item keyword latex-environment node-property paragraph plain-list planning property-drawer quote-block section special-block src-block table table-row verse-block)

greater element: :contents-begin :contents-end
element: :contents-begin :contents-end
object
properties: :begin :end :post-blank :parent :post-affiliated
types
attributes
affiliated keywords: :caption :header :name :plot :results :attr_NAME

keyword: element: :key :value

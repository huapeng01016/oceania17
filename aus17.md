# Incorporating Stata into reproducible documents

##  [Hua Peng@StataCorp][hpeng]
### 2017 Oceania Stata Users Group meeting


# Why reproducible documents?

Eliminate manual steps such as hand-editing documents

- mix formatted text and Stata output
- include inline Stata results
- embed Stata graphs
- produce tables containing the output from selected Stata commands

# Commands in Stata 15

- dyndoc - convert dynamic Markdown documents to web pages
- putdocx - create Word documents
- putpdf - create PDF files

# A dyndoc example

Produce [a blog article](./example.html) from a [dynamic markdown document](./example.md)


# Quick review of dynamic tags

## dd_do for a block of Stata code
````
<<dd_ignore>>
<<dd_do>>
sysuse auto
regress weight displacement
<</dd_do>>
<</dd_ignore>>
````

##
````
<<dd_do>>
sysuse auto
regress weight displacement
<</dd_do>>
````

##
Attributes change a tag's behavior

````
<<dd_ignore>>
<<dd_do:quietly>>
matrix define eb = e(b)
<</dd_do>>
<</dd_ignore>>
````

<<dd_do:quietly>>
matrix define eb = e(b)
<</dd_do>>


## dd_display for inline Stata results
<<dd_ignore>>
- For every unit increase in displacement, a <<dd_display:%9.4f eb[1,1]>> unit
increase in weight is predicted.
<</dd_ignore>>

> - For every unit increase in displacement, a <<dd_display:%9.4f eb[1,1]>> unit
increase in weight is predicted.

## dd_graph
````
<<dd_ignore>>
<<dd_do:quietly>>
scatter weight displacement, mcolor(%30)
<</dd_do>>
<</dd_ignore>>
````
<<dd_do:quietly>>
scatter weight displacement, mcolor(%30)
<</dd_do>>

````
<<dd_ignore>>
<<dd_graph>>
<</dd_ignore>>
````

##
#### <<dd_graph:replace>>


# putdocx

Produce a [.docx document](./exdocx.docx) from a [do-file](./exdocx.do)

- full range of control for text formatting
- flexible table output

# Output tables in markdown

Produce [markdown tables](./table.html) from [commands](./table.md), including

- all estimation commands using **\_coef_table**
- **table**
- **estimates table**

# dyntext
Process dynamic tags in any text files, for example, LaTeX and JavaScript  

# LaTeX file

Produce a [.pdf file](./extex.pdf) from a [LaTex file with dynamic tags](./extex.md) with dynamic tags  

- use **sjlog**
- use **pdflatex** on the output of **dyntext**

# JavaScript

- One [example](./gchart.html) is using Google Chart library and the [dynamic document](./gchart.txt)
- Another [example](./gchart1.txt) is dynamically generating web pages based on arguments  

# Use pandoc instead of Stata's markdown

Produce reveal.js [slildes deck](./aus17.md) with [**dynpandoc**](./dynpandoc.ado)

# putpdf

Produce a [.pdf document](./expdf.pdf) from a [do-file](./expdf.do)

# TODO

- cached code block
- better LaTeX support

# THE END


[hpeng]: hpeng@stata.com

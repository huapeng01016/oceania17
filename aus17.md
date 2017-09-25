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

# ".do files on steroids"

- macros work the same as in do-file
- accept arguments

# Use arguments in **dyndoc**
Produce a set of different HTML pages from one [dynamic document](./auto_78.txt) with different arguments  

<<dd_do:quietly>>
use auto_78_img.dta, clear
desc
cap mkdir cars
<</dd_do>>

<<dd_do:nocommand>>
forval i=1/`r(N)' {
  di "- [" make[`i'] "](./cars/" make[`i'] ".html)"
}
<</dd_do>>

<<dd_remove>>
<<dd_do>>
forval i=1/`r(N)' {
  dyndoc auto_78.txt `=make[`i']', saving("cars/`=make[`i']'.html") replace
}
<</dd_do>>
<</dd_remove>>

# Code for the previous page
~~~
<<dd_ignore>>
<<dd_do:quietly>>
use auto_78_img.dta, clear
desc
cap mkdir cars
<</dd_do>>

<<dd_do:nocommand>>
forval i=1/`r(N)' {
  di "- [" make[`i'] "](./cars/" make[`i'] ".html)"
}
<</dd_do>>

// need use dd_remove
<<dd_do>>
forval i=1/`r(N)' {
  dyndoc auto_78.txt `=make[`i']', saving("cars/`=make[`i']'.html") replace
}
<</dd_do>>
// need use dd_remove

<</dd_ignore>>
~~~

# dyntext
Process dynamic tags in any text files, for example, LaTeX and JavaScript  

# JavaScript

- An [example](./gchart.html) is using Google Chart library and the [dynamic document](./gchart.txt)

<<dd_remove>>
<<dd_do>>
dyntext gchart.txt, sav(gchart.html) replace
<</dd_do>>
<</dd_remove>>

~~~~
dyntext gchart.txt, sav(gchart.html) replace
~~~~

# Use pandoc instead of Stata's markdown

- Produce reveal.js [slildes deck](./aus17.md) with [**dynpandoc**](./maker.do)
- Produce [.docx document](./auto.docx) with [**dynpandoc**](./makeauto.do)


# putdocx

Produce a [.docx document](./exdocx.docx) from a [do-file](./exdocx.do)

- full range of control for text formatting
- flexible table output

# Output tables in markdown

Produce [markdown tables](./table.html) from [commands](./table.md), including

- all estimation commands using **\_coef_table**
- **table**
- **estimates table**

# THE END

[hpeng]: hpeng@stata.com

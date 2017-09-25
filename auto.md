A quick study of auto dataset
=============================

We will use the auto dataset. It includes variable 
price:

~~~~
<<dd_do>>
sysuse auto, clear
summarize price
<</dd_do>>
~~~~

The mean of price is <<dd_display: %9.0g r(mean)>>. We 
will also check the relationship between **mpg** 
and **weight** visually.

<<dd_do:quietly>>
scatter mpg weight, mcolor(blue%50)
<</dd_do>>

<<dd_graph: sav("auto_gr.png") replace markdown>>

and via a linear regression:

~~~~
<<dd_do>>
regress mpg weight
<</dd_do>>
~~~~

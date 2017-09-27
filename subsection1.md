<<dd_do: quietly>>
cap program drop lnsim
program define lnsim, rclass
       version 15
       syntax [, obs(integer 1) mu(real 0) sigma(real 1) ]
       drop _all
       set obs `obs'
       tempvar z
       gen `z' = exp(rnormal(`mu',`sigma'))
       summarize `z'
       return scalar mean = r(mean)
       return scalar Var  = r(Var)
end

simulate mean=r(mean) var=r(Var), reps(10000): lnsim, obs(100)
<</dd_do>>

Make a dataset containing means and variances of 100-observation samples
from a lognormal distribution.  Perform the experiment 10,000 times, then
summarize the result:

~~~~
<<dd_do:nocommand>>
summarize
<</dd_do>>
~~~~

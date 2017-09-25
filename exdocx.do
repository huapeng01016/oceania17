putdocx clear
putdocx begin

regress price mpg
putdocx table reg1 = etable
estimates store model1

regress price mpg i.foreign
putdocx table reg2 = etable
estimates store model2

estimates table model1 model2, b(%10.3f) star
putdocx table est1 = etable

estimates table model1 model2, b(%10.3f) star stats(N r2 r2_a) varlabel allbaselevels
putdocx table est2 = etable

putdocx table tbl2 = etable
putdocx table tbl2(3,.), drop
putdocx table tbl2(.,1), halign(left)
putdocx table tbl2(1,.), bold
putdocx table tbl2(8,1) = ("R-squared")
putdocx table tbl2(9,1) = ("Adj. R-squared")

putdocx save exdocx, replace

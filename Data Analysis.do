** Prepare raw experimental data **
import delimited "../Data/Experimental Data.csv", encoding(UTF-8) clear
run "../Stata/Prepare Data.do"

** Demographics (subsection 2.4) **
sum age payoff_final if task == 1 & treatment != 2 & round == 1
tab study gender if task == 1 & treatment != 2 & round == 1, row column

** Results (section 3) **
do "../Stata/Treatment Effects.do"

** Appendix **
do "../Stata/Appendix Results.do"





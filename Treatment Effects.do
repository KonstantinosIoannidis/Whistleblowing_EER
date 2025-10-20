** Figure 1 **
preserve
collapse (mean) mean_whistle=whistle mean_cheat=cheat if treatment!= 2 & task == 1 & role != "public", by(treatment location role)
egen treat_loc_whistle = group(location treatment)
gen xpos = .
* Birmingham Baseline
replace xpos = 0.5 if location==0 & treatment==0 & role=="employee"
replace xpos = 1   if location==0 & treatment==0 & role=="manager"
* Birmingham Competition
replace xpos = 1.5 if location==0 & treatment==1 & role=="employee"
replace xpos = 2   if location==0 & treatment==1 & role=="manager"
* Cambridge Baseline
replace xpos = 2.5 if location==1 & treatment==0 & role=="employee"
replace xpos = 3   if location==1 & treatment==0 & role=="manager"
* Cambridge Competition
replace xpos = 3.5 if location==1 & treatment==1 & role=="employee"
replace xpos = 4   if location==1 & treatment==1 & role=="manager"
twoway ///
    (bar mean_whistle xpos if role=="employee" & treatment==0, color(navy%40) barwidth(0.4)) ///
    (bar mean_cheat   xpos if role=="manager"  & treatment==0, color(maroon%40) barwidth(0.4)) ///
    (bar mean_whistle xpos if role=="employee" & treatment==1, color(navy%90) barwidth(0.4)) ///
    (bar mean_cheat   xpos if role=="manager"  & treatment==1, color(maroon%90) barwidth(0.4)) ///
    (scatter mean_whistle xpos if role=="employee", msymbol(none) mlabel(mean_whistle) mlabsize(small) mlabcolor(black) mlabposition(12) mlabformat(%4.3f)) ///
    (scatter mean_cheat xpos if role=="manager", msymbol(none) mlabel(mean_cheat) mlabsize(small) mlabcolor(black) mlabposition(12) mlabformat(%4.3f)) ///
	(scatteri 0.227 0.5, msymbol(Th) mcolor(black) msize(medium)) ///
	(scatteri 0.227 2.5, msymbol(Th) mcolor(black) msize(medium)) ///
	(scatteri 0.125 1.0, msymbol(Th) mcolor(black) msize(medium)) ///
	(scatteri 0.125 3.0, msymbol(Th) mcolor(black) msize(medium)) ///
	(scatteri 0.35 1.25 "University of Birmingham", msymbol(none) mlabcolor(black) mlabsize(small) mlabposition(12)) ///
	(scatteri 0.35 3.25 "University of Cambridge", msymbol(none) mlabcolor(black) mlabsize(small) mlabposition(12)), ///
    ytitle("Probability of whistleblowing and lawbreaking", size(medium)) ///
    ylabel(0 0.10 "0.10" 0.20 "0.20" 0.30 "0.30", nogrid labsize(small)) ///
    xlabel(0.75 "Baseline" 1.75 "Competition" 2.75 "Baseline" 3.75 "Competition", nogrid labsize(small)) ///
    legend(off) ///
    name(figure_1, replace)
restore

* Result 1 (signrank) *
preserve
collapse (mean) whistle (mean) cheat if task == 1 & treatment == 0 & role != "public", by(treatment location sessionlabel role)
signrank whistle = 0.227 if role == "employee"
signrank cheat = 0.125 if role == "manager"
restore

** Result 2 (ranksum) **
preserve
collapse (mean) whistle (mean) cheat if task == 1 & treatment != 2 & role != "public", by(treatment location sessionlabel role)
ranksum whistle if role == "employee", by(treatment)
ranksum cheat if role == "manager", by(treatment)
restore

** Result 3 (ranksum) **
preserve
collapse (mean) whistle (mean) cheat if task == 1 & treatment != 2 & role != "public", by(treatment location sessionlabel role)
egen treat_loc = group(location treatment), label
label define treat_loc_lbl ///
    1 "Brum_Base" ///
    2 "Brum_Comp" ///
    3 "Cam_Base" ///
    4 "Cam_Comp"
label values treat_loc treat_loc_lbl
bysort location: ranksum whistle if role == "employee", by(treatment)
bysort location: ranksum cheat if role == "manager", by(treatment)
restore





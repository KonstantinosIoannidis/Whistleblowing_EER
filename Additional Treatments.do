preserve
collapse (mean) mean_whistle=whistle mean_cheat=cheat if location == 0 & role != "public", by(treatment sessionlabel role task)
gen treat_task = 0
replace treat_task = 1 if treatment == 0 & task == 1
replace treat_task = 2 if treatment == 1 & task == 1
replace treat_task = 3 if treatment == 2 & task == 1
replace treat_task = 4 if treatment == 0 & task == 0
replace treat_task = 5 if treatment == 1 & task == 0
label define treat_tasks ///
    1 "Base_Task" ///
    2 "Comp_Task" ///
    3 "Rand_Task" ///
    4 "Base_NoTask" ///
	5 "Comp_NoTask"
label values treat_task treat_tasks
tabstat mean_whistle if role == "employee", by(treat_task)
tabstat mean_cheat if role == "manager", by(treat_task)
restore

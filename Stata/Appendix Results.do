** Result 2 (Regression) **
* Whistleblowing regressions (Table A.1) *
eststo whistle_aggregate: quietly ///
reg whistle i.treatment risk svo gender age study if treatment !=2 & role == "employee" & task == 1, vce(cluster sessionlabel)
eststo whistle_beliefs_aggregate: quietly ///
reg whistle i.treatment belief_whistle belief_cheat morality_employee morality_public firm_loyalty risk svo gender age study if treatment !=2 & role == "employee" & task == 1, vce(cluster sessionlabel)
eststo whistle_birmingham: quietly ///
reg whistle i.treatment risk svo gender age study if treatment !=2 & role == "employee" & task == 1 & location == 0, vce(cluster sessionlabel)
eststo whistle_beliefs_birmingham: quietly ///
reg whistle i.treatment belief_whistle belief_cheat morality_employee morality_public firm_loyalty risk svo gender age study if treatment !=2 & role == "employee" & task == 1 & location == 0, vce(cluster sessionlabel)
eststo whistle_cambridge: quietly ///
reg whistle i.treatment risk svo gender age study if treatment !=2 & role == "employee" & task == 1 & location == 1, vce(cluster sessionlabel)
eststo whistle_beliefs_cambridge: quietly ///
reg whistle i.treatment belief_whistle belief_cheat morality_employee morality_public firm_loyalty risk svo gender age study if treatment !=2 & role == "employee" & task == 1 & location == 1, vce(cluster sessionlabel)
esttab whistle_aggregate whistle_beliefs_aggregate whistle_birmingham whistle_beliefs_birmingham whistle_cambridge whistle_beliefs_cambridge, ///
indicate(Controls = gender age study risk svo) se r2 label nonumber nonotes noomitted nobaselevels interaction(*) b(3) obslast replace type ///
star(* 0.10 ** 0.05 *** 0.01)
* Lawbreaking regressions (Table A.2) *
eststo cheat_aggregate: quietly ///
reg cheat i.treatment risk svo gender age study if treatment !=2 & role == "manager" & task == 1, vce(cluster sessionlabel)
eststo cheat_beliefs_aggregate: quietly ///
reg cheat i.treatment belief_whistle belief_cheat morality_employee morality_public firm_loyalty risk svo gender age study if treatment !=2 & role == "manager" & task == 1, vce(cluster sessionlabel)
eststo cheat_birmingham: quietly ///
reg cheat i.treatment risk svo gender age study if treatment !=2 & role == "manager" & task == 1 & location == 0, vce(cluster sessionlabel)
eststo cheat_beliefs_birmingham: quietly ///
reg cheat i.treatment belief_whistle belief_cheat morality_employee morality_public firm_loyalty risk svo gender age study if treatment !=2 & role == "manager" & task == 1 & location == 0, vce(cluster sessionlabel)
eststo cheat_cambridge: quietly ///
reg cheat i.treatment risk svo gender age study if treatment !=2 & role == "manager" & task == 1 & location == 1, vce(cluster sessionlabel)
eststo cheat_beliefs_cambridge: quietly ///
reg cheat i.treatment belief_whistle belief_cheat morality_employee morality_public firm_loyalty risk svo gender age study if treatment !=2 & role == "manager" & task == 1 & location == 1, vce(cluster sessionlabel)
esttab cheat_aggregate cheat_beliefs_aggregate cheat_birmingham cheat_beliefs_birmingham cheat_cambridge cheat_beliefs_cambridge, ///
indicate(Controls = gender age study risk svo) se r2 label nonumber nonotes noomitted nobaselevels interaction(*) b(3) obslast replace type ///
star(* 0.10 ** 0.05 *** 0.01)

In order to visualize the data better, we combined all the datasets into one large dataset (all_data_merged.csv) using the Flight ID, which contained information on all of the airfields as well as all of the Auckland airfield information combined into one.

S1 has been calculated by substracting Wait_Time from S2 (S2 - Wait_Time) and a new column S1 is produced for the all_dat_merged.csv.

From all_data_merged.csv we produced 2 subsets: auc_data.csv and saf_data.csv by filtering Airfield == AUC and Airfield == SAF.

auc_data.csv & saf_data.csv contain S2, S1, Wait_Time, C_Start, C0 and C_avg (last 3 optional).

Rows of auc_data.csv & saf_data.csv contains only rows with complete cases; if a row from the previous 2 subsets contains an NA cell it is omitted (new subsets with alike names are created, with no NA cells).

The result of the above process produced the 2 datasets used for the queueing system: auc_data.csv & saf_data.csv

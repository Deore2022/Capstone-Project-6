/*sas project*/

ods pdf
file = "C:\Users\91955\Desktop\Output\world_bankdetail.pdf";

data world_bank;
infile datalines dlm=',';
length id $10. cust_name$17. cust_add$14. cust_acc_type$13. deposit$5. balance$6. bank_reply$25.;
input id $ cust_name $ cust_add $ cust_acc_type $ deposit $ balance $;
datalines;
1 ,Rohit Sharma ,Mumbai ,Saving ,5000 ,10000
2 ,Virat Kohali ,Delhi ,Current ,6000 ,15000
3 ,Gopal Krishanmurti ,Gujrat ,Saving ,700 ,5000
4 ,Jay Deore ,Nashik ,Saving ,800 ,5000
5 ,Hiralal Birari ,Bihar ,Current ,90000 ,1000000
6 ,Sanjay Patil ,Goa ,Saving ,60000 ,80000
7 ,Archana Khairnar ,Shirpur ,Saving ,80000 ,2000000
8 ,Gayatri Sutar ,Surat ,Current,50000 ,1000000
9 ,Pratiksha Desale ,Nashik ,Saving ,70000 ,90000
10 ,Abhijeet Sonawane ,Pune ,Current ,60000 ,2000000
11 ,Akash Murkute ,Sinnar ,Current ,90000 ,3000000
12 ,Sudarshan Cholke ,Manmad ,Saving ,78000 ,2500000
13 ,Jyoti Deore ,Thane ,Saving ,50000 ,65000
14 ,Manisha Desale ,Pimpari ,Current ,70000 ,2600000
15 ,Harshal Singh ,Palghar ,Saving ,88000 ,3000000
16 ,Seema Patil ,Nashik ,Current ,65000 ,1500000
17 ,Dipati Chavhan ,Dhule ,Saving ,51000 ,1780000
18 ,Vedika Saner ,Guhati ,Saving ,64000 ,1200000
19 ,Yogesh Sutar ,Nashik ,Current ,89000 ,1000000
20 ,Diya Shirke ,Pune ,Current ,56000 ,172590
;
data world_bank;
set world_bank;
if deposit<1000 then bank_reply='No Profit';
else if 3000<=deposit<=6000 then bank_reply='Very less profit';
else if 6500<=deposit<=10000 then bank_reply='Good profit';
else if 11000<=deposit<=40000 then bank_reply='Very Good Profit';
else if 45000<=deposit<=70000 then bank_reply='Best Profit';
else if deposit>70000 then bank_reply='Very Best Profit';
proc sort data =world_bank  out = sorted_data;
by balance;
proc print data=sorted_data;
run;
data world_bank;
set world_bank; 
if deposit <= 50000 then delete;
run;

proc sgplot data=work.world_bank;
vbar balance ;
title 'Balance of Emp';
run;


proc print data=work.world_bank;
run;
ods pdf close;



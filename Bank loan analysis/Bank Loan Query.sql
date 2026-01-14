select *from Bank_loan;
-- Total loan applications
select count(id) as Total_Applications from Bank_loan;

-- MTD loan applications
select count(id) as MTD_Total_Applications from Bank_loan 
	where month(issue_date)=12 and year(issue_date)=2021;

-- PMTD loan applications
select count(id) as PMTD_Total_Applications from Bank_loan 
	where month(issue_date)=11 and year(issue_date)=2021;

-- Total funded amount
select sum(loan_amount) as Total_Funded_Amount from Bank_loan;

-- MTD Total funded amount
select sum(loan_amount) as MTD_Total_Funded_Amount from Bank_loan 
	where month(issue_date)=12 and year(issue_date)=2021;

-- PMTD Total funded amount
select sum(loan_amount) as PMTD_Total_Funded_Amount from Bank_loan 
	where month(issue_date)=11 and year(issue_date)=2021;

-- Total amount received
select sum(total_payment) as Total_Payment from Bank_loan;

-- MTD Total amount received
select sum(total_payment) as MTD_Total_Payment from Bank_loan 
	where month(issue_date)=12 and year(issue_date)=2021;

-- PMTD Total amount received
select sum(total_payment) as PMTD_Total_Payment from Bank_loan 
	where month(issue_date)=12 and year(issue_date)=2021;

--Avg interest rate
select round(avg(int_rate),4)*100 as Average_Interest_Rate from Bank_loan;

--MTD Avg interest rate
select round(avg(int_rate),4)*100 as MTD_Average_Interest_Rate from Bank_loan
	where month(issue_date)=12 and year(issue_date)=2021;

 --PMTD Avg interest rate
select round(avg(int_rate),4)*100 as PMTD_Average_Interest_Rate from Bank_loan 
	where month(issue_date)=11 and year(issue_date)=2021;

-- Avg DTI
select round(avg(dti),4)*100 as Average_Interest_Rate from Bank_loan;

-- MTD Avg DTI
select round(avg(dti),4)*100 as MTD_Average_Interest_Rate from Bank_loan 
	where month(issue_date)=12 and year(issue_date)=2021;;

-- PMTD Avg DTI
select round(avg(dti),4)*100 as PMTD_Average_Interest_Rate from Bank_loan 
	where month(issue_date)=11 and year(issue_date)=2021;;

-- Good loan issued
-- Good Loan Percentage
select (count(case when loan_status='Fully Paid' or loan_status='Current' then id end)*100.00)
		/ count(id) as Good_Loan_Percentage from Bank_loan;

-- Good Loan Applications
select count(id) as Good_Loan_Applications from Bank_loan
	where loan_status='Fully Paid' or loan_status='Current'

-- Good Loan Funded Amount
select sum(loan_amount) as Good_Loan_Funded_Amount from Bank_loan
	where loan_status='Fully Paid' or loan_status='Current'

-- Good Loan Amount Received
select sum(total_payment) as Good_Loan_Funded_Amount from Bank_loan
	where loan_status='Fully Paid' or loan_status='Current'

-- BAD LOAN ISSUED
-- Bad Loan Percentage
select (count(case when loan_status='Charged off' then id end)* 100.00)
		/ count (id) as Bad_Loan_Percentage from Bank_loan;

-- Bad Loan Applications
select count(id) as Bad_Loan_Applications from Bank_loan where loan_status='Charged off';

-- Bad Loan Funded Amount
select sum(loan_amount) as Bad_Loan_Funded_Amount from Bank_loan where loan_status='Charged off';

-- Bad Loan Amount Received
select sum(total_payment) as Bad_Loan_Amount_Received from Bank_loan where loan_status='Charged off';

--Loan Status
select loan_status, 
		count(id) as Total_Loan_Applications, 
		sum(loan_amount) as Total_Funded_Amount, 
		sum(total_payment) as Total_amount_received, 
		avg(int_rate)*100 as Avg_Intrest_Rate,
		avg(dti)*100 as Avg_DTI_Rate
		from Bank_loan group by loan_status;

--MTD Loan Status
select loan_status, 
		count(id) as MTD_Total_Loan_Applications, 
		sum(loan_amount) as MTD_Total_Funded_Amount, 
		sum(total_payment) as MTD_Total_amount_received, 
		avg(int_rate)*100 as MTD_Avg_Intrest_Rate,
		avg(dti)*100 as MTD_Avg_DTI_Rate
		from Bank_loan 
		where month(issue_date)=12 and year(issue_date)=2021
		group by loan_status;

-- B.Bank Loan Report
-- Month
select month(issue_date) as Month_Number,
		datename(month, issue_date) as Month_Name,
		count(id) as Total_Loan_Applications,
		sum(loan_amount) as Total_Funded_Amount,
		sum(total_payment) as Total_Amount_Received
		from Bank_Loan
		group by month(issue_date),datename(month, issue_date) 
		order by month(issue_date);

-- State
select address_state as state,
		count(id) as Total_Loan_Applications,
		sum(loan_amount) as Total_Funded_Amount,
		sum(total_payment) as Total_Amount_Received
		from Bank_Loan
		group by address_state 
		order by address_state;

-- Term
select term as state,
		count(id) as Total_Loan_Applications,
		sum(loan_amount) as Total_Funded_Amount,
		sum(total_payment) as Total_Amount_Received
		from Bank_Loan
		group by term 
		order by term;

-- EMPLOYEE Length
select emp_length as Employee_Experience,
		count(id) as Total_Loan_Applications,
		sum(loan_amount) as Total_Funded_Amount,
		sum(total_payment) as Total_Amount_Received
		from Bank_Loan
		group by emp_length 
		order by emp_length;

-- PURPOSE
select purpose as Purpose,
		count(id) as Total_Loan_Applications,
		sum(loan_amount) as Total_Funded_Amount,
		sum(total_payment) as Total_Amount_Received
		from Bank_Loan
		group by purpose 
		order by purpose;

-- HOME OWNERSHIP
select home_ownership as home_ownership,
		count(id) as Total_Loan_Applications,
		sum(loan_amount) as Total_Funded_Amount,
		sum(total_payment) as Total_Amount_Received
		from Bank_Loan
		group by home_ownership 
		order by home_ownership;

--See the results when we hit the Grade A in the filters for dashboards
select purpose as Purpose,
		count(id) as Total_Loan_Applications,
		sum(loan_amount) as Total_Funded_Amount,
		sum(total_payment) as Total_Amount_Received
		from Bank_Loan
		where grade='A'
		group by purpose 
		order by purpose;
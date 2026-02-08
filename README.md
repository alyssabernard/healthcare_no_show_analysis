# **Healthcare Appointment No-Show Analysis**

## **Project Overview**

This project analyzes healthcare appointment data to better understand patterns and risk factors associated with patient no-shows. Using SQL in Google BigQuery, I explored overall no-show rates, demographic and operational breakdowns, scheduling behavior, time trends, and repeat no-show patterns. The goal of this analysis is to demonstrate practical SQL skills while answering realistic healthcare operations questions that could inform intervention strategies and scheduling improvements.

## **Business Questions**

This analysis focuses on the following key questions:

* What is the overall appointment no-show rate?

* Do no-show rates vary by department, insurance type, or time of day?

* Does how far in advance an appointment is scheduled impact no-show rates?

* Which patients repeatedly miss appointments, and when do those no-shows occur?

## **Dataset**

This project uses a **mock healthcare dataset** representing:

* Patient demographics

* Provider departments

* Appointment scheduling and outcomes

Tables include:

* Appointments  
* Patients  
* providers

**\*\*All data was generated for educational and portfolio purposes.\*\***

## **Key Analyses & SQL Techniques**

### **1\. Overall No-Show Rate**

* Calculated the total number of appointments and the proportion marked as “No-Show.”

* Established a baseline KPI for the rest of the analysis.

**SQL skills used:** COUNT, COUNTIF, SAFE_DIVIDE

[`overall_no_show_rates.sql`](SQL/01_no_show_rate.sql)

### **2\. No-Show Rate by Department**

* Joined appointment data with provider data to compare no-show rates across departments.

* Identified departments with higher missed appointment rates.

**SQL skills used:** JOIN, GROUP BY, aggregation

[`overall_no_show_rate_by_department.sql`](SQL/02_rate_of_no_shows_by_department.sql)


### **3\. No-Show Rate by Insurance Type**

* Analyzed whether no-show behavior differed across insurance categories.

* Highlighted potential access or engagement disparities.

**SQL skills used:** JOIN, GROUP BY, filtering

[`no_show_rate by_insurance_type.sql`](SQL/03_rate_of_no_shows_by_insurance.sql)


### **4\.  No-Show Rate by Appointment Time**

* Compared no-show rates across morning, afternoon, and evening appointments.

* Explored whether time-of-day scheduling impacts attendance.

**SQL skills used:** grouping, aggregation

[`no_show_rate by_appointment_time.sql`](SQL/04_rate_of_no_shows_by_time.sql)

### **5\. Lead Time Analysis (Days Scheduled in Advance)**

* Calculated the number of days between scheduling and appointment date.

* Bucketed lead time into ranges (e.g., 1–7 days, 8–14 days).

* Measured no-show rates by lead-time bucket.
* 
[`no_show_rate by_appointment_time.sql`](SQL/05_rate_of_no_shows_by_lead_time.sql)

**SQL skills used:**  
 WITH (CTEs), DATE_DIFF, CASE WHEN, SAFE_DIVIDE, custom ordering

### **6\. Monthly No-Show Trend**

* Grouped appointments by month using DATE_TRUNC.

* Calculated monthly no-show rates to identify trends over time.

**SQL skills used:**  
 DATE_TRUNC, aggregation, time-series analysis
[`no_show_rate by_no_show_month.sql`](SQL/06_rate_of_no_show_month.sql)

### **7\. Repeat No-Show Patients (Summary View)**

* Identified patients with two or more no-show appointments.

* Created a patient-level summary showing total no-shows per patient.

**SQL skills used:**  
 GROUP BY, HAVING, filtering
 [`no_show_rate by_no_show_patients.sql`](SQL/07_no_shows_count_3+_per_patient.sql)


### **8\. Repeat No-Show Patients (Drill-Down View)**

* Joined repeat no-show patients back to appointment-level data.

* Displayed the specific dates when repeat no-shows occurred.

**SQL skills used:**  
 CTEs, joins between summary and detail tables, ordering
  [`no_show_rate by_no_show_patients.sql`](SQL/08_no_shows_by_date.sql)


## **Key Takeaways**

* No-show rates vary meaningfully by scheduling behavior and patient history.

* Appointments scheduled further in advance tend to have higher no-show rates.

* A small subset of patients account for multiple missed appointments, suggesting opportunities for targeted interventions.

* Structuring SQL queries with CTEs enables clean, readable, and scalable analysis.

## **Tools & Skills Demonstrated**

* **SQL (Google BigQuery)**

* Data aggregation and filtering

* JOINs across multiple tables

* Common Table Expressions (CTEs)

* CASE statements and bucketing

* Time-based analysis

* Behavioral pattern analysis

## **SQL Queries**
[`overall_no_show_rates.sql`](SQL/01_no_show_rate.sql)
[`overall_no_show_rate_by_department.sql`](SQL/02_rate_of_no_shows_by_department.sql)
[`no_show_rate by_insurance_type.sql`](SQL/03_rate_of_no_shows_by_insurance.sql)
[`no_show_rate by_appointment_time.sql`](SQL/04_rate_of_no_shows_by_time.sql)
[`no_show_rate by_appointment_time.sql`](SQL/05_rate_of_no_shows_by_lead_time.sql)
[`no_show_rate by_no_show_month.sql`](SQL/06_rate_of_no_show_month.sql)
[`no_show_rate by_no_show_patients.sql`](SQL/07_no_shows_count_3+_per_patient.sql)
[`no_show_rate by_no_show_patients.sql`](SQL/08_no_shows_by_date.sql)

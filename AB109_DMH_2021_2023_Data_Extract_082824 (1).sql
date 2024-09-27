-- Databricks notebook source
SELECT *
FROM infohub.dmh_ibhis_service_history
LIMIT 100

-- COMMAND ----------

SELECT DISTINCT EID
	, Client_ID
	, Primary_Language
	, Education_Level
	, Facility_Name
	, Facility_Type
	/* , Provider_Name */ /* Remove 9/4/2024 per Max's request */
	, Admission_Date
	, Outpatient_Service_Date
	, Service_Type
	, Diagnoses_Code
	, Discharge_Date
	, Gross_Service_Cost
	, Race
	, Service_Type_Mode
	, Service_Function_Code
	, Funding_Source_Detail
	, Subtance_Abuse_Flag AS Substance_Abuse_Flag
	, Service_ID
FROM infohub.dmh_ibhis_service_history
WHERE (
		Admission_Date >= '2021-01-01' AND 
		Admission_Date <= '2023-12-31'
		) OR
		(
		Outpatient_Service_Date >= '2021-01-01' AND 
		Outpatient_Service_Date <= '2023-12-31'
		)
ORDER BY EID
	, COALESCE(Admission_Date, Outpatient_Service_Date)
;

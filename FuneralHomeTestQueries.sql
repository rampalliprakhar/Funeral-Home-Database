#Test Queries

#1. (total of services selected for deceased “Mr. X”. Where X is any name in your test data. Refer to category A: Charge for Services Selected.)
-- Query 1 
SELECT COUNT(*) AS total_service_A
FROM Service_price sp
JOIN Service s ON sp.CallNo = s.CallNo
JOIN AllPrices ap ON s.CallNo = sp.CallNo AND sp.CategoryID = ap.CategoryID
WHERE ap.Category_Type = 'A' AND s.Name = 'John Smith';   

#2. (total of merchandise selected for deceased “Mr. X”. Where X is any name in your test data. Refer to category B: Charge for Merchandise Selected.)
-- Query 2 
SELECT COUNT(*) AS total_service_B
FROM Service_price sp
JOIN Service s ON sp.CallNo = s.CallNo
JOIN AllPrices ap ON s.CallNo = sp.CallNo AND sp.CategoryID = ap.CategoryID
WHERE ap.Category_Type = ‘B’ AND s.Name = 'John Smith';    

#3. (total amount spent on Florist charges for all services between date X and date Y. Where dates X and Y are any two dates selected by you. )

-- Query 3 
SELECT SUM(florist_charge) AS Total_Florist_Charges 
FROM Service 
WHERE Date BETWEEN '2023-04-30' AND '2023-05-19';

#4. (List the names of all deceased who were college graduates and the schools attended, sorted by age and grouped by male and female.)

-- Query 4 
SELECT Service.Name, info_deceased.residence, info_deceased.SSN, info_deceased.sex, info_deceased.DOB, info_deceased.education, info_deceased.school 
FROM info_deceased 
INNER JOIN deceased ON info_deceased.SSN = deceased.SSN 
INNER JOIN Service ON Service.CallNo = deceased.CallNo 
WHERE info_deceased.education LIKE '%Degree%' 
ORDER BY info_deceased.sex, info_deceased.DOB ASC 

#5. (List the names of all children of deceased “Mrs. X”. Where X is some name in your test data. Select any one name.)

-- Query 5 
SELECT Family_Son.SonName, Family_Daughter.DaughterName
FROM Family
INNER JOIN deceased ON Family.CallNo = deceased.CallNo
LEFT JOIN Family_Son ON Family.CallNo = Family_Son.CallNo
LEFT JOIN Family_Daughter ON Family.CallNo = Family_Daughter.CallNo
INNER JOIN Service ON deceased.CallNo = Service.CallNo
WHERE Service.Name = 'John Smith';

#6. (Give the number of deceased males between the ages of 30 and 50 who were veterans.)

-- Query 6 
SELECT COUNT(*) as num_deceased
FROM info_deceased
INNER JOIN deceased ON info_deceased.SSN = deceased.SSN
WHERE info_deceased.sex = 'M'
AND info_deceased.isVeteran = TRUE
AND YEAR(info_deceased.DOB) - YEAR(deceased.date_death) BETWEEN 30 AND 50;

#7. (What percentage of deceased chose an open-casket service as opposed to an open-casket service?)
SELECT 
   -- Query 7 
SELECT 
(((SELECT COUNT(*) FROM Service WHERE open_close = 'open') / (SELECT COUNT(*) FROM Service)) * 100) AS open_percentage,
(((SELECT COUNT(*) FROM Service WHERE open_close = 'closed') / (SELECT COUNT(*) FROM Service)) * 100) AS close_percentage
FROM Service;

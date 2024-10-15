-- Sample SQL queries by Ali Ghaemmaghami

-- 1 
-- Select a sample of the whole table

USE funding;
SELECT *
FROM nserc_awards

LIMIT 10;

-- 2
-- Count the number of the rows

SELECT count(id)
FROM nserc_awards;

-- 3
-- SELECT institutions with the highest funding amount and see if there is any instituition with lower award amount 
-- but higher average award amount and also compare them with number of applications by each instituition
-- also we are going to choose the highest award amount of each instituition
-- we do not want to see instituitions with low award amount so we filter them

SELECT inst, SUM(CAST(SUBSTRING(REPLACE(award_amount, ',', ''), 2) AS UNSIGNED)) AS award_inst, 
-- Because of the format of the NSERC website we had to remove the first $ symbol and also the "," 
-- which seperates each 1000 amount

AVG(CAST(SUBSTRING(REPLACE(award_amount, ',', ''), 2) AS UNSIGNED)) AS avg_award_inst,
COUNT(id) AS award_num_inst,
MAX(CAST(SUBSTRING(REPLACE(award_amount, ',', ''), 2) AS UNSIGNED)) AS max_award_inst

FROM nserc_awards

GROUP BY inst
HAVING award_inst > 100000000
ORDER BY award_inst DESC;

-- 4

-- SELECT provinces with the highest funding amount and see if there is any province with lower award amount 
-- but higher average award amount and also compare them with number of applications by each research subject
-- also we are going to choose the highest award amount of each province
-- we do not want to see provinces with low award amount so we filter them


SELECT prvnc, SUM(CAST(SUBSTRING(REPLACE(award_amount, ',', ''), 2) AS UNSIGNED)) AS award_pr,
-- Because of the format of the NSERC website we had to remove the first $ symbol and also the "," 
-- which seperates each 1000 amount

AVG(CAST(SUBSTRING(REPLACE(award_amount, ',', ''), 2) AS UNSIGNED)) AS avg_award_pr,
COUNT(id) AS award_num_pr,
MAX(CAST(SUBSTRING(REPLACE(award_amount, ',', ''), 2) AS UNSIGNED)) AS max_award_pr


FROM nserc_awards
GROUP BY prvnc
HAVING award_pr > 10000000
ORDER BY award_pr DESC;

-- 5

-- SELECT research subjects with the highest funding amount and see if there is any research subject with lower award amount 
-- but higher average award amount and also compare them with number of applications by each research subject
-- also we are going to choose the highest award amount of each research subject
-- we do not want to see research subjects with low award amount so we filter them

SELECT resrch_subj, SUM(CAST(SUBSTRING(REPLACE(award_amount, ',', ''), 2) AS UNSIGNED)) AS award_rsub,
-- Because of the format of the NSERC website we had to remove the first $ symbol and also the "," 
-- which seperates each 1000 amount

AVG(CAST(SUBSTRING(REPLACE(award_amount, ',', ''), 2) AS UNSIGNED)) AS avg_award_rsub,
COUNT(id) AS award_num_rsub,
MAX(CAST(SUBSTRING(REPLACE(award_amount, ',', ''), 2) AS UNSIGNED)) AS max_award_rsub


FROM nserc_awards
GROUP BY resrch_subj
HAVING award_rsub > 10000000
ORDER BY award_rsub DESC;

-- 6

-- SELECT programs with the highest funding amount and see if there is any program with lower award amount 
-- but higher average award amount and also compare them with number of applications by each program
-- also we are going to choose the highest award amount of each program
-- we do not want to see programs with low award amount so we filter them

SELECT prgrm, SUM(CAST(SUBSTRING(REPLACE(award_amount, ',', ''), 2) AS UNSIGNED)) AS award_prgrm,
-- Because of the format of the NSERC website we had to remove the first $ symbol and also the "," 
-- which seperates each 1000 amount

AVG(CAST(SUBSTRING(REPLACE(award_amount, ',', ''), 2) AS UNSIGNED)) AS avg_award_prgrm,
count(id) AS award_num_prgrm,
MAX(CAST(SUBSTRING(REPLACE(award_amount, ',', ''), 2) AS UNSIGNED)) AS max_award_prgrm

FROM nserc_awards
GROUP BY prgrm
HAVING award_prgrm > 50000000
ORDER BY award_prgrm DESC;


-- 7 

-- SELECT areas with the highest funding amount and see if there is any area with lower award amount 
-- but higher average award amount and also compare them with number of applications by each area
-- also we are going to choose the highest award amount of each area
-- we do not want to see areas with low award amount so we filter them


SELECT area, SUM(CAST(SUBSTRING(REPLACE(award_amount, ',', ''), 2) AS UNSIGNED)) AS award_area,
-- Because of the format of the NSERC website we had to remove the first $ symbol and also the "," 
-- which seperates each 1000 amount

AVG(CAST(SUBSTRING(REPLACE(award_amount, ',', ''), 2) AS UNSIGNED)) AS avg_award_area,
count(id) AS award_num_area,
MAX(CAST(SUBSTRING(REPLACE(award_amount, ',', ''), 2) AS UNSIGNED)) AS max_award_area


FROM nserc_awards
GROUP BY area
HAVING award_area > 50000000
ORDER BY award_area DESC;
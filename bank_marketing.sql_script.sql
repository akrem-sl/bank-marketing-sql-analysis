-- ===========================================================
-- bank marketing project
-- Author: Bhavana Venkatesha Murthy
-- Dataset: bank marketing (Kaggle)
-- Purpose: SQL Analysis for 10 Business Questions
-- ===========================================================


-- 1. Which age group has the highest conversion rate (term deposit subscription %)?
SELECT 
    ROUND(100.0 * SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS conversion_rate
FROM bank_clean;


-- 2. How does education level impact the subscription rate?
SELECT ROUND(AVG(age), 1) AS avg_age
FROM bank_clean;


-- 3. Which job categories yield the highest number of successful subscriptions?
SELECT 
    education,
    ROUND(100.0 * SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS conversion_rate
FROM bank_clean
GROUP BY education
ORDER BY conversion_rate DESC;


-- 4. How many contacts on average lead to one successful subscription (overall and by campaign)?
SELECT 
    job,
    ROUND(100.0 * SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS conversion_rate
FROM bank_clean
GROUP BY job
ORDER BY conversion_rate DESC;


-- 5. Does the outcome of the previous campaign (“poutcome”) affect the current campaign’s success?
SELECT 
    campaign,
    COUNT(*) AS num_clients
FROM bank_clean
GROUP BY campaign
ORDER BY campaign;


-- 6. What’s the overall conversion rate of this marketing campaign?
SELECT 
    marital,
    ROUND(100.0 * SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS conversion_rate
FROM bank_clean
GROUP BY marital
ORDER BY conversion_rate DESC;


-- 7. How do economic indicators (e.g., employment variation rate or consumer confidence index) affect success rate?
SELECT 
    contact,
    ROUND(100.0 * SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS conversion_rate
FROM bank_clean
GROUP BY contact;


-- 8. Which contact month and day of the week had the best campaign performance?
SELECT 
    month,
    ROUND(100.0 * SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS conversion_rate
FROM bank_clean
GROUP BY month
ORDER BY FIELD(month,'jan','feb','mar','apr','may','jun','jul','aug','sep','oct','nov','dec');


-- 9. Does call duration affect subscription success rate?
SELECT 
    CASE 
        WHEN age < 30 THEN '<30'
        WHEN age BETWEEN 30 AND 39 THEN '30-39'
        WHEN age BETWEEN 40 AND 49 THEN '40-49'
        WHEN age BETWEEN 50 AND 59 THEN '50-59'
        ELSE '60+' 
    END AS age_group,
    ROUND(100.0 * SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS conversion_rate
FROM bank_clean
GROUP BY age_group
ORDER BY age_group;



-- 10. How does marital status relate to deposit subscription likelihood?
SELECT 
    duration,
    y,
    COUNT(*) AS num_clients
FROM bank_clean
GROUP BY duration, y
ORDER BY duration;










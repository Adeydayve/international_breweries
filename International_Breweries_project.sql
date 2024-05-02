-- PROFIT ANALYSIS --
# Within the space of the last three years, what was the profit worth 
# of the breweries, inclusive of the anglophone and the francophone territories?

SELECT  SUM(PROFIT) AS TOTAL_PROFIT
FROM international_breweries;

# Compare the total profit between these two territories in order
# for the territory manager, Mr. Stone made a strategic decision
# that will aid profit maximization in 2020.

SELECT DISTINCT COUNTRIES, SUM(PROFIT) AS TOTALPROFIT
FROM international_breweries
GROUP BY COUNTRIES;

# Country that generated the highest profit in 2019
SELECT COUNTRIES, YEARS, SUM(PROFIT) AS TOTAL_PROFIT_IN_2019
FROM international_breweries
WHERE YEARS = 2019
GROUP BY COUNTRIES
ORDER BY TOTAL_PROFIT_IN_2019 DESC
LIMIT 1;

# Help him find the year with the highest profit.
SELECT YEARS, SUM(PROFIT) AS TOTALPROFIT_BY_YEARS
FROM international_breweries
GROUP BY YEARS
ORDER BY TOTALPROFIT_BY_YEARS DESC
LIMIT 1;

# What was the minimum profit in the month of December 2018?
SELECT MONTHS, YEARS, min(PROFIT) AS MINIMUMPROFIT_IN_2018
FROM international_breweries
WHERE YEARS = 2018 AND MONTHS = 'December'
GROUP BY MONTHS
ORDER BY MINIMUMPROFIT_IN_2018;


-- BRAND ANALYSIS --
# Within the last two years, the brand manager wants to
# know the top three brands consumed in the francophone countries
SELECT BRANDS, COUNTRIES, YEARS, SUM(QUANTITY) AS TOTAL_CONSUMED_BRANDS
FROM international_breweries
WHERE YEARS IN (2019, 2018) AND COUNTRIES IN ('Togo', 'Benin', 'Senegal')
GROUP BY BRANDS, COUNTRIES, YEARS
ORDER BY TOTAL_CONSUMED_BRANDS DESC
LIMIT 3;

# Find out the top two choice of consumer brands in Ghana
SELECT BRANDS, SUM(QUANTITY) AS Total_Quantity
FROM international_breweries
WHERE COUNTRIES = 'Ghana'
GROUP BY BRANDS
ORDER BY Total_Quantity DESC
LIMIT 2;

# Favorites malt brand in Anglophone region between 2018 and 2019
SELECT COUNTRIES, BRANDS, SUM(QUANTITY) AS Total_Quantity
FROM international_breweries
WHERE BRANDS LIKE "%malt%" AND COUNTRIES IN ('Ghana', 'Nigeria')
  AND YEARS BETWEEN 2018 AND 2019
GROUP BY COUNTRIES, BRANDS
ORDER BY COUNTRIES, Total_Quantity DESC;

# Which brands sold the highest in 2019 in Nigeria?
SELECT BRANDS, SUM(QUANTITY) AS Total_Quantity
FROM international_breweries
WHERE COUNTRIES = 'Nigeria' AND YEARS = 2019
GROUP BY BRANDS
ORDER BY Total_Quantity DESC
LIMIT 1;


# Beer consumption in Nigeria
SELECT COUNTRIES, SUM(QUANTITY) AS Total_Beer_Consumption
FROM international_breweries
WHERE COUNTRIES = 'Nigeria'
AND BRANDS NOT LIKE '%malt%';

-- COUNTRY ANALYSIS --
# Country with the highest consumption of beer.
SELECT COUNTRIES, SUM(QUANTITY) AS HIGHEST_Total_Beer_Consumption
FROM international_breweries
WHERE BRANDS NOT LIKE '%malt%'
GROUP BY COUNTRIES
ORDER BY HIGHEST_Total_Beer_Consumption DESC
LIMIT 1;

#  Country with the highest consumption of malt.
SELECT COUNTRIES, SUM(QUANTITY) AS HIGHEST_Total_Malt_Consumption
FROM international_breweries
WHERE BRANDS LIKE '%malt%'
GROUP BY COUNTRIES
ORDER BY HIGHEST_Total_Malt_Consumption DESC
LIMIT 1;











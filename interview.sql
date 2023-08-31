/* # Question 1 */
SELECT date, SUM(impressions) AS total_impressions
FROM marketing_performance1
GROUP BY date
ORDER BY date;

/* Question 2 */
SELECT Website_revenue.state, Sum(Website_revenue.revenue) AS TotalRevenue
FROM Website_revenue
GROUP BY Website_revenue.state
ORDER BY TotalRevenue DESC;
/* Ohio has the third highest total revenue of $37577. */

/* Question 3 */
SELECT Campaign_info.id, SUM(Marketing_performance1.impressions) AS total_impressions, SUM(Marketing_performance1.clicks) AS total_clicks, SUM(Website_revenue.revenue) AS total_revenue, SUM(Marketing_performance1.cost) AS total_cost, SUM(Marketing_performance1.conversions) AS total_conversions
FROM (Campaign_info LEFT JOIN Marketing_performance1 ON Marketing_performance1.campaign_id = Campaign_info.id) LEFT JOIN Website_revenue ON Website_revenue.campaign_id = Campaign_info.id
GROUP BY Campaign_info.id;

/* Question 4 */
SELECT Marketing_performance1.geo, SUM(Marketing_performance1.conversions) AS total_conversions
FROM Marketing_performance1 INNER JOIN Campaign_info ON Marketing_performance1.campaign_id = Campaign_info.id
WHERE Campaign_info.name = 'Campaign5'
GROUP BY Marketing_performance1.geo;
/* Georgia generated the most conversions for this campaign. */

/* Question 5 
It appears Campaign4 is most efficient as total revenues were the second highest of all campaigns despite
total costs being the lowest. This campaign also has the second highest conversions of all campaigns as well as the second highest number of impressions, 
all of which was accomplished on a smaller budget than their rivalling campaigns. */

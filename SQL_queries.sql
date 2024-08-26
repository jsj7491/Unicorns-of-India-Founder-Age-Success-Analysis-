-- Joining the Two Tables
SELECT
  startup_details.Id,
  startup_details.startup_name,
  startup_details.industry,
  startup_details.industry_2,
  startup_details.founding_year,
  startup_details.unicorn_entry_year,
  founder_details.founder,
  founder_details.approx_year_of_birth
FROM
  `projects.dataset.startup_details` AS startup_details
INNER JOIN
  `projects.dataset.founder_details` AS founder_details
  ON startup_details.Id = founder_details.Id
ORDER BY
  startup_details.Id

-- Combined results
SELECT
  startup_details.Id,
  startup_details.startup_name,
  (startup_details.founding_year - founder_details.approx_year_of_birth) AS age_when_started,
  founder_details.founder,
  startup_details.industry,
  startup_details.industry_2,
  (startup_details.unicorn_entry_year - startup_details.founding_year) AS approx_time_to_become_unicorn
FROM
  `proj_name.unicorns_india.startup_details` AS startup_details
INNER JOIN
  `proj_name.unicorns_india.founder_details` AS founder_details
  ON startup_details.Id = founder_details.Id
ORDER BY
  approx_time_to_become_unicorn

-- Average ages of founders by unicorns
SELECT
  startup_name,
  AVG(age_when_started)
FROM
  `proj_name.unicorns_india.unicorns_complete`
GROUP BY
  startup_name

-- Average age when starting the company by industry
SELECT
  TRIM(industry),
  AVG(age_when_started) AS industry_avg_age_when_starting
FROM
  `proj_name.unicorns_india.unicorns_complete`
GROUP BY
  TRIM(industry)
ORDER BY
  industry_avg_age_when_starting

-- Average time to become unicorn by industry 
SELECT
  TRIM(industry),
  AVG(unicorn_time) AS avg_unicorn_time_c
FROM
  `proj_name.unicorns_india.unicorns_comp_wo_founders`
GROUP BY
  TRIM(industry)
ORDER BY
  avg_unicorn_time_c

-- Year wise number of unicorns by  industry
SELECT
  unicorn_entry_year,
  industry,
  COUNT(industry) AS ind_count
FROM
  `proj_name.unicorns_india.startup_details`
GROUP BY
  unicorn_entry_year,
  industry
ORDER BY
  unicorn_entry_year ASC,
  ind_count DESC

-- Number of unicorns by industry
SELECT
  TRIM(industry),
  COUNT(TRIM(industry)) AS industry_count
FROM
  `proj_name.unicorns_india.startup_details`
GROUP BY
  TRIM(industry)
ORDER BY
  industry_count DESC

-- Average age of unicorn founders 
SELECT
  AVG(age_when_started)
FROM
  `proj_name.unicorns_india.unicorns_complete`

-- Average time by companies to become unicorns 
SELECT
  AVG(unicorn_time)
FROM
  `proj_name.unicorns_india.unicorns_comp_wo_founders`






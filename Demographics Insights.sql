# 1) Demographics Insights
# a) Who prefers energy drinks more?
select gender, count(dr.Respondent_ID) as total_of_preference from dim_respondents as dr
join fact_survey_responses as fsr
on dr.Respondent_ID = fsr.Respondent_ID
group by gender
order by total_of_preference desc;

#b) Which age group prefers energy drink more?
select age, count(dr.Respondent_ID) as preference_by_age from dim_respondents as dr
join fact_survey_responses as fsr
on dr.Respondent_ID = fsr.Respondent_ID
group by age
order by preference_by_age desc;

#c) Which type of marketing reaches the most youth (15-30)?
select marketing_channels, count(*) as total_ from dim_respondents as dr
join fact_survey_responses as fsr
on dr.Respondent_ID = fsr.Respondent_ID
where age in('15-18','19-30')
group by marketing_channels
order by total_ desc;
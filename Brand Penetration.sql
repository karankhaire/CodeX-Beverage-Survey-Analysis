#5) Brand Penetration
#How many people have actually heard of our brand?
select heard_before, count(heard_before) as total_count
from fact_survey_responses
group by heard_before
order by total_count desc;

# a) What do people think about our brand?
select brand_perception, count(*) as total_ from fact_survey_responses
where heard_before = 'Yes'
group by brand_perception
order by total_ desc;

# Out of the people who've heard about our brand, how many have not actually tried it?
select heard_before, count(*) as total_nos
from fact_survey_responses
where heard_before= 'Yes' and tried_before = 'No'
group by heard_before;

# Out of the people who've heard about our brand, how many have actually tried it?
select heard_before, count(*) as total_nos
from fact_survey_responses
where heard_before= 'Yes' and tried_before = 'Yes'
group by heard_before;

# reason for not trying our brand by people who have hearc about it
select Reasons_preventing_trying, total_
from 
(
select heard_before, tried_before, Reasons_preventing_trying, count(Reasons_preventing_trying) as total_
from fact_survey_responses
where heard_before = 'Yes' and tried_before = 'No'
group by heard_before, tried_before, Reasons_preventing_trying
) as subq
order by total_ desc;

# reasons for people not trying our brand
select reasons_preventing_trying, count(*) as total_ from fact_survey_responses
group by reasons_preventing_trying
order by total_ desc;

#b) Which cities do we need to focus more on?

# cities where respondents have heard about codex
select city, tier, heard_before, count(*) as total_ from dim_cities as dc
join dim_respondents as dr on dc.city_id = dr.city_id
join fact_survey_responses as fsr on dr.respondent_id = fsr.respondent_id
where heard_before = 'Yes'
group by city, tier, heard_before
order by total_ desc;

# tried before
select city, tier, tried_before, count(*) as total_ from dim_cities as dc
join dim_respondents as dr on dc.city_id = dr.city_id
join fact_survey_responses as fsr on dr.respondent_id = fsr.respondent_id
where heard_before = 'Yes' and tried_before = 'Yes'
group by city, tier, heard_before
order by total_ desc;

# heard_before, Tried_before and given their taste experience (avg rating)
select city, tier, avg(taste_experience) as avg_rating from dim_cities as dc
join dim_respondents as dr on dc.city_id = dr.city_id
join fact_survey_responses as fsr on dr.respondent_id = fsr.respondent_id
where heard_before = 'Yes' and tried_before = 'Yes'
group by city, tier
order by avg_rating desc;

# age wise distribution in respective cities

select city, tier, count(*) as total_ from dim_cities as dc
join dim_respondents as dr on dc.city_id = dr.city_id
join fact_survey_responses as fsr on dr.respondent_id = fsr.respondent_id
where age in ('15-18','19-30')
group by city, tier
order by total_ desc;
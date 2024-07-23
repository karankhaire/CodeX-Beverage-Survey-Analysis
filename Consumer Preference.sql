# 2) Consumer Preference
# a)What are the preferred ingredients of energy drinks among respondents?
select Ingredients_expected, count(*) as total_ from fact_survey_responses 
group by Ingredients_expected
order by total_ desc;

# b) What package preferences do respondents have for energy drinks?
select Packaging_preference, count(*) as total_ from fact_survey_responses
group by Packaging_preference
order by total_ desc;

# does packaging preference change with age? no
select age, Packaging_preference, count(*) as total_ from dim_respondents as dr
join fact_survey_responses as fsr
on dr.Respondent_ID = fsr.Respondent_ID
group by age, Packaging_preference
order by age, total_ desc;

# Are people more likely to buy an energy drink with limited edition packaging? no.
select Limited_edition_packaging, count(*) as total_ from fact_survey_responses 
group by Limited_edition_packaging
order by total_ desc;
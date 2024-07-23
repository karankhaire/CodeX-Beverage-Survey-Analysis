# 6) Purchase Behaviour
# a) Where do respondents prefer to purchase energy drinks?
select Purchase_location, count(*) as total_ from fact_survey_responses
group by Purchase_location
order by total_ desc;

#b) What are the typical consumption situations for energy drinks among respondents?
select Typical_consumption_situations, count(*) as total_ from fact_survey_responses
group by Typical_consumption_situations
order by total_ desc;

# c) What factors influence respondents' purchase descisions , such as price range and limited edition packaging?
select price_range, count(*) as total_ from fact_survey_responses
group by price_range;
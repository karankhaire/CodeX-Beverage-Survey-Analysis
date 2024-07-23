# 3) Competition Analysis 
# a) Who are the current market leaders?
select current_brands, count(*) as total_ from fact_survey_responses
group by current_brands
order by total_ desc
limit 1;

#b) What are the primary reasons consumers prefer those brands over ours?
select Reasons_for_choosing_brands, count(*) as total_ 
from fact_survey_responses
group by Reasons_for_choosing_brands
order by total_ desc;
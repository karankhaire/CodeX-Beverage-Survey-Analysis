# 4) Marketing channels and brand awareness
# a) Which marketing channel can be used to reach more customers? Online ads and Tv commercials can be used.
select marketing_channels, count(*) as total_ from fact_survey_responses
group by marketing_channels
order by total_ desc;

# b) How effective are different marketing strategies and channels in reaching our customers?
select * from fact_survey_responses;

select marketing_channels, total_
from
(
select heard_before, marketing_channels, count(marketing_channels) as total_ from fact_survey_responses
where heard_before = 'Yes'
group by heard_before, marketing_channels
order by total_ desc
) subq;
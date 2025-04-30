--{"gen": "erase", "time": "/", "template": "generated-3c45097f-7d2d-4cd3-a0e6-1132344bb4ad", "dataset": "full_job", "rows": null}
SELECT min(mc.note) AS production_note,
min(t.title) AS movie_title,
min(t.production_year) AS movie_year
FROM movie_companies AS mc,
title AS t,
company_name AS cn,
complete_cast AS cc,
char_name AS chn,
cast_info AS ci,
kind_type AS kt
WHERE (mc.note NOT LIKE '%(as Metro-Goldwyn-Mayer Pictures)%' AND t.production_year BETWEEN 2005 AND 2010 AND cn.country_code = '[hk]' AND chn.name NOT LIKE '%Sherlock%' AND (chn.name LIKE '%Tony%Stark%' OR chn.name LIKE '%Iron%Man%') AND kt.kind = 'movie' AND t.id = mc.movie_id AND cn.id = mc.company_id AND kt.id = t.kind_id AND t.id = ci.movie_id AND t.id = cc.movie_id AND ci.movie_id = cc.movie_id AND chn.id = ci.person_role_id AND mc.movie_id = ci.movie_id AND mc.movie_id = cc.movie_id)

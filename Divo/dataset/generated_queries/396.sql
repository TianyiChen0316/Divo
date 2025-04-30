--{"gen": "erase", "time": "/", "template": "generated-37aaf9de-3fc3-4ccf-b1e9-8d3cc7344cbb", "dataset": "full_job", "rows": null}
SELECT min(mc.note) AS production_note,
min(t.title) AS movie_title,
min(t.production_year) AS movie_year
FROM movie_companies AS mc,
movie_info_idx AS mi_idx,
title AS t,
char_name AS chn,
cast_info AS ci,
company_name AS cn
WHERE (mc.note NOT LIKE '%(as Metro-Goldwyn-Mayer Pictures)%' AND t.production_year > 2000 AND ci.note NOT LIKE '%(voice)%' AND ci.note LIKE '%(uncredited)%' AND cn.country_code = '[jp]' AND t.id = mc.movie_id AND t.id = mi_idx.movie_id AND mc.movie_id = mi_idx.movie_id AND t.id = ci.movie_id AND ci.movie_id = mc.movie_id AND chn.id = ci.person_role_id AND cn.id = mc.company_id AND ci.movie_id = mi_idx.movie_id)

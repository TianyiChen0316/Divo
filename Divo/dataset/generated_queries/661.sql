--{"gen": "erase", "time": "/", "template": "generated-518aca4b-60f0-45d9-ac17-fc0f6fb11414", "dataset": "full_job", "rows": null}
SELECT min(chn.name) AS uncredited_voiced_character,
min(t.title) AS russian_movie
FROM char_name AS chn,
cast_info AS ci,
movie_companies AS mc,
title AS t,
company_name AS cn,
movie_keyword AS mk,
name AS n
WHERE (ci.note LIKE '%(voice)%' AND ci.note NOT LIKE '%(voice)%' AND t.production_year > 2003 AND cn.country_code = '[de]' AND t.id = mc.movie_id AND t.id = ci.movie_id AND ci.movie_id = mc.movie_id AND chn.id = ci.person_role_id AND n.id = ci.person_id AND t.id = mk.movie_id AND mc.company_id = cn.id AND ci.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id)

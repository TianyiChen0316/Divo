--{"gen": "combine", "time": "/", "template": "generated-ebc3ef10-6b1f-40f1-aebc-a5ea0a96d971", "dataset": "full_job", "rows": null}
SELECT min(mc.note) AS production_note,
min(t.title) AS movie_title,
min(t.production_year) AS movie_year
FROM company_type AS ct,
info_type AS it,
movie_companies AS mc,
title AS t,
movie_keyword AS mk,
keyword AS k,
movie_info AS mi,
company_name AS cn,
aka_title AS at,
cast_info AS ci,
info_type AS it1,
info_type AS it2,
name AS n
WHERE (ct.kind = 'production companies' AND it.info = 'bottom 10 rank' AND mc.note NOT LIKE '%(as Metro-Goldwyn-Mayer Pictures)%' AND t.production_year BETWEEN 2005 AND 2010 AND lower(k.keyword) LIKE '%fight%' AND lower(mi.info) LIKE '%action%' AND cn.country_code = '[ru]' AND ci.note IN ('(writer)', '(head writer)', '(written by)', '(story)', '(story editor)') AND it1.info = 'genres' AND it2.info = 'votes' AND n.gender = 'm' AND ct.id = mc.company_type_id AND t.id = mc.movie_id AND it.id = mi.info_type_id AND mi.movie_id = t.id AND mk.keyword_id = k.id AND mk.movie_id = t.id AND mk.movie_id = mi.movie_id AND cn.id = mc.company_id AND mc.movie_id = mk.movie_id AND mi.movie_id = mc.movie_id AND mk.movie_id = at.movie_id AND mi.movie_id = at.movie_id AND mc.movie_id = at.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mk.movie_id AND n.id = ci.person_id AND it1.id = mi.info_type_id AND mc.movie_id = ci.movie_id AND at.movie_id = ci.movie_id AND t.id = at.movie_id AND t.id = ci.movie_id AND mi.info_type_id = it2.id AND it1.id = it.id AND it1.id = it2.id AND it.id = it2.id)

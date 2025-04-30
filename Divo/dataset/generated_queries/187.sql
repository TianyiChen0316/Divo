--{"gen": "combine", "time": "/", "template": "generated-a1104c92-12ac-4b3b-8a05-f7f1021d4bfc", "dataset": "full_job", "rows": null}
SELECT min(t.title) AS typical_european_movie
FROM company_type AS ct,
movie_companies AS mc,
movie_info AS mi,
title AS t,
info_type AS it,
info_type AS it2,
movie_info_idx AS miidx,
cast_info AS ci,
company_name AS cn,
keyword AS k,
movie_keyword AS mk,
name AS n
WHERE (ct.kind = 'production companies' AND mc.note LIKE '%(theatrical)%' AND mc.note LIKE '%(France)%' AND mi.info IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Denish', 'Norwegian', 'German') AND t.production_year > 2005 AND it.info = 'rating' AND it2.info = 'release dates' AND cn.country_code = '[us]' AND k.keyword = 'character-name-in-title' AND n.name LIKE 'B%' AND t.id = mi.movie_id AND t.id = mc.movie_id AND mc.movie_id = mi.movie_id AND ct.id = mc.company_type_id AND it2.id = mi.info_type_id AND miidx.movie_id = t.id AND it.id = miidx.info_type_id AND mi.movie_id = miidx.movie_id AND miidx.movie_id = mc.movie_id AND n.id = ci.person_id AND ci.movie_id = t.id AND t.id = mk.movie_id AND mk.keyword_id = k.id AND mc.company_id = cn.id AND ci.movie_id = mc.movie_id AND ci.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id AND miidx.movie_id = ci.movie_id AND miidx.movie_id = mk.movie_id AND ci.movie_id = mi.movie_id AND mk.movie_id = mi.movie_id)

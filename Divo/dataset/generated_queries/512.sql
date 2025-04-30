--{"gen": "combine", "time": "/", "template": "generated-1148b95e-0a12-4717-82fe-ac36d522b71d", "dataset": "full_job", "rows": null}
SELECT min(mi_idx.info) AS rating,
min(t.title) AS movie_title
FROM movie_info_idx AS mi_idx,
movie_keyword AS mk,
title AS t,
complete_cast AS cc,
cast_info AS ci,
movie_info AS mi,
name AS n,
aka_name AS an,
company_name AS cn,
keyword AS k,
movie_companies AS mc
WHERE (mi_idx.info > '3.0' AND t.production_year > 2008 AND ci.note IN ('(writer)', '(head writer)', '(written by)', '(story)', '(story editor)') AND mi.info IN ('Horror', 'Action', 'Sci-Fi', 'Thriller', 'Crime', 'War') AND n.gender = 'm' AND cn.country_code = '[us]' AND k.keyword = 'character-name-in-title' AND t.id = mi_idx.movie_id AND t.id = mk.movie_id AND mk.movie_id = mi_idx.movie_id AND t.id = mi.movie_id AND t.id = ci.movie_id AND t.id = cc.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND ci.movie_id = mk.movie_id AND ci.movie_id = cc.movie_id AND mi.movie_id = mi_idx.movie_id AND mi.movie_id = mk.movie_id AND mi.movie_id = cc.movie_id AND mi_idx.movie_id = cc.movie_id AND mk.movie_id = cc.movie_id AND n.id = ci.person_id AND an.person_id = n.id AND mk.keyword_id = k.id AND t.id = mc.movie_id AND mc.company_id = cn.id AND an.person_id = ci.person_id AND ci.movie_id = mc.movie_id AND mc.movie_id = mk.movie_id AND mc.movie_id = cc.movie_id AND mc.movie_id = mi.movie_id AND mc.movie_id = mi_idx.movie_id)

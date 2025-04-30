--{"gen": "combine", "time": "/", "template": "generated-4c06b809-01c7-4a17-bec9-1996297feb4b", "dataset": "full_job", "rows": null}
SELECT min(an.name) AS alternative_name,
min(t.title) AS american_movie
FROM aka_name AS an,
cast_info AS ci,
company_name AS cn,
movie_companies AS mc,
role_type AS rt,
title AS t,
info_type AS it,
keyword AS k,
movie_info_idx AS mi_idx,
movie_keyword AS mk
WHERE (ci.note IN ('(voice)', '(voice: Japanese version)', '(voice) (uncredited)', '(voice: English version)') AND cn.country_code = '[de]' AND rt.role = 'actress' AND it.info = 'rating' AND k.keyword LIKE '%sequel%' AND mi_idx.info > '2.0' AND ci.movie_id = t.id AND t.id = mc.movie_id AND ci.movie_id = mc.movie_id AND mc.company_id = cn.id AND ci.role_id = rt.id AND an.person_id = ci.person_id AND t.id = mi_idx.movie_id AND t.id = mk.movie_id AND mk.movie_id = mi_idx.movie_id AND k.id = mk.keyword_id AND it.id = mi_idx.info_type_id AND mc.movie_id = mk.movie_id AND mc.movie_id = mi_idx.movie_id AND ci.movie_id = mk.movie_id AND ci.movie_id = mi_idx.movie_id)

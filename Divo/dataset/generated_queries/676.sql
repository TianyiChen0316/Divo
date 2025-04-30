--{"gen": "combine", "time": "/", "template": "generated-6bf1fc9b-371f-4e6d-951d-cd9cd6c70cec", "dataset": "full_job", "rows": null}
SELECT min(mi.info) AS movie_budget,
min(mi_idx.info) AS movie_votes
FROM cast_info AS ci,
info_type AS it1,
movie_info AS mi,
movie_info_idx AS mi_idx,
name AS n,
movie_keyword AS mk,
title AS t,
complete_cast AS cc,
char_name AS chn,
company_name AS cn,
keyword AS k,
movie_companies AS mc
WHERE (ci.note IN ('(writer)', '(head writer)', '(written by)', '(story)', '(story editor)') AND it1.info = 'countries' AND mi.info IN ('Horror', 'Thriller') AND mi.note IS NULL AND mi_idx.info > '6.0' AND n.gender IS NOT NULL AND n.gender = 'f' AND t.production_year > 2005 AND chn.name IS NOT NULL AND (chn.name LIKE '%man%' OR chn.name LIKE '%Man%') AND cn.country_code = '[us]' AND k.keyword = 'character-name-in-title' AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND n.id = ci.person_id AND it1.id = mi.info_type_id AND t.id = mi.movie_id AND t.id = mk.movie_id AND mk.movie_id = mi.movie_id AND t.id = ci.movie_id AND t.id = cc.movie_id AND mk.movie_id = ci.movie_id AND mk.movie_id = cc.movie_id AND ci.movie_id = cc.movie_id AND chn.id = ci.person_role_id AND cc.movie_id = mi.movie_id AND t.id = mi_idx.movie_id AND cc.movie_id = mi_idx.movie_id AND mk.movie_id = mi_idx.movie_id AND cn.id = mc.company_id AND mc.movie_id = t.id AND mk.keyword_id = k.id AND mc.movie_id = mk.movie_id AND mc.movie_id = ci.movie_id AND mc.movie_id = cc.movie_id AND mc.movie_id = mi.movie_id AND mc.movie_id = mi_idx.movie_id)

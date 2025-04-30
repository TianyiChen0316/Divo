--{"gen": "combine", "time": "/", "template": "generated-1a860fda-6fa5-4877-b284-e7ba77c71e31", "dataset": "full_job", "rows": null}
SELECT min(chn.name) AS character
FROM char_name AS chn,
cast_info AS ci,
company_type AS ct,
movie_companies AS mc,
role_type AS rt,
company_name AS cn,
keyword AS k,
movie_keyword AS mk,
title AS t,
movie_info_idx AS mi_idx
WHERE (ci.note LIKE '%(producer)%' AND rt.role = 'actress' AND cn.country_code = '[de]' AND k.keyword = 'character-name-in-title' AND mi_idx.info > '2.0' AND ci.movie_id = mc.movie_id AND chn.id = ci.person_role_id AND rt.id = ci.role_id AND ct.id = mc.company_type_id AND cn.id = mc.company_id AND mc.movie_id = t.id AND t.id = mk.movie_id AND mk.keyword_id = k.id AND mc.movie_id = mk.movie_id AND ci.movie_id = t.id AND ci.movie_id = mk.movie_id AND t.id = mi_idx.movie_id AND mk.movie_id = mi_idx.movie_id AND mc.movie_id = mi_idx.movie_id AND ci.movie_id = mi_idx.movie_id)

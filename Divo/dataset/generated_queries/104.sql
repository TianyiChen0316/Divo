--{"gen": "combine", "time": "/", "template": "generated-258de0aa-a5f0-4c8e-9103-15f235508a9d", "dataset": "full_job", "rows": null}
SELECT min(mi.info) AS release_date
FROM aka_title AS at,
company_name AS cn,
company_type AS ct,
keyword AS k,
movie_companies AS mc,
movie_info AS mi,
movie_keyword AS mk,
movie_info_idx AS mi_idx,
cast_info AS ci,
title AS t,
aka_name AS an
WHERE (cn.country_code = '[us]' AND mc.note LIKE '%(200%)%' AND mc.note LIKE '%(worldwide)%' AND mi.note LIKE '%internet%' AND mi.info LIKE 'USA:%200%' AND mi_idx.info < '7.0' AND ci.note IN ('(producer)', '(executive producer)') AND mk.movie_id = mi.movie_id AND mk.movie_id = mc.movie_id AND mk.movie_id = at.movie_id AND mi.movie_id = mc.movie_id AND mi.movie_id = at.movie_id AND mc.movie_id = at.movie_id AND k.id = mk.keyword_id AND cn.id = mc.company_id AND ct.id = mc.company_type_id AND mk.movie_id = mi_idx.movie_id AND mc.movie_id = mi_idx.movie_id AND at.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND t.id = mi.movie_id AND t.id = mi_idx.movie_id AND t.id = ci.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND t.id = mc.movie_id AND an.person_id = ci.person_id AND ci.movie_id = mc.movie_id AND t.id = at.movie_id AND t.id = mk.movie_id AND at.movie_id = ci.movie_id AND ci.movie_id = mk.movie_id)

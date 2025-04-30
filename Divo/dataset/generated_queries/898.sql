--{"gen": "combine", "time": "/", "template": "generated-2bbedcbc-4c0b-4d73-b6b4-a21ba184d731", "dataset": "full_job", "rows": null}
SELECT min(mi.info) AS release_date
FROM aka_title AS at,
company_type AS ct,
info_type AS it1,
movie_companies AS mc,
movie_info AS mi,
movie_keyword AS mk,
cast_info AS ci,
movie_info_idx AS mi_idx,
title AS t,
aka_name AS an
WHERE (it1.info = 'release dates' AND mi.note LIKE '%internet%' AND mi.info IS NOT NULL AND (mi.info LIKE 'USA:% 199%' OR mi.info LIKE 'USA:% 200%') AND mi_idx.info > '8.0' AND t.production_year > 1950 AND mk.movie_id = mi.movie_id AND mk.movie_id = mc.movie_id AND mk.movie_id = at.movie_id AND mi.movie_id = mc.movie_id AND mi.movie_id = at.movie_id AND mc.movie_id = at.movie_id AND it1.id = mi.info_type_id AND ct.id = mc.company_type_id AND t.id = mk.movie_id AND t.id = ci.movie_id AND t.id = mi_idx.movie_id AND mk.movie_id = ci.movie_id AND mk.movie_id = mi_idx.movie_id AND ci.movie_id = mi_idx.movie_id AND t.id = mc.movie_id AND an.person_id = ci.person_id AND ci.movie_id = mc.movie_id AND t.id = mi.movie_id AND mi.movie_id = mi_idx.movie_id AND mc.movie_id = mi_idx.movie_id AND ci.movie_id = mi.movie_id AND t.id = at.movie_id AND at.movie_id = ci.movie_id AND at.movie_id = mi_idx.movie_id)

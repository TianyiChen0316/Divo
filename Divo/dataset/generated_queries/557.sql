--{"gen": "combine", "time": "/", "template": "generated-33ddf2ad-46de-42d5-8789-de3a51d43005", "dataset": "full_job", "rows": null}
SELECT min(mi.info) AS release_date,
min(t.title) AS internet_movie
FROM aka_title AS at,
movie_companies AS mc,
movie_info AS mi,
movie_keyword AS mk,
title AS t,
keyword AS k,
movie_info_idx AS mi_idx,
cast_info AS ci,
name AS n,
person_info AS pi
WHERE (mc.note LIKE '%(200%)%' AND mc.note NOT LIKE '%(TV)%' AND mi.note LIKE '%internet%' AND mi.info LIKE 'USA:% 200%' AND t.production_year BETWEEN 1950 AND 2000 AND k.keyword IN ('murder', 'murder-in-title') AND mi_idx.info < '7.0' AND (pi.info ILIKE '%uk%' OR pi.info ILIKE '%spain%' OR pi.info ILIKE '%germany%' OR pi.info ILIKE '%italy%' OR pi.info ILIKE '%croatia%' OR pi.info ILIKE '%algeria%' OR pi.info ILIKE '%south%' OR pi.info ILIKE '%austria%' OR pi.info ILIKE '%hungary%') AND t.id = at.movie_id AND t.id = mi.movie_id AND t.id = mk.movie_id AND t.id = mc.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = mc.movie_id AND mk.movie_id = at.movie_id AND mi.movie_id = mc.movie_id AND mi.movie_id = at.movie_id AND mc.movie_id = at.movie_id AND t.id = mi_idx.movie_id AND mk.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND k.id = mk.keyword_id AND t.id = ci.movie_id AND ci.person_id = n.id AND n.id = pi.person_id AND ci.person_id = pi.person_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mk.movie_id AND ci.movie_id = mi_idx.movie_id AND mi_idx.info_type_id = pi.info_type_id AND mc.movie_id = ci.movie_id AND mc.movie_id = mi_idx.movie_id AND at.movie_id = ci.movie_id AND at.movie_id = mi_idx.movie_id)

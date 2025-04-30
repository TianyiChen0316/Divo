--{"gen": "erase", "time": "/", "template": "generated-8dadc587-4b5b-4e08-ba32-6f97efce909f", "dataset": "full_job", "rows": null}
SELECT min(an1.name) AS actress_pseudonym,
min(t.title) AS japanese_movie_dubbed
FROM aka_name AS an1,
cast_info AS ci,
movie_companies AS mc,
name AS n1,
title AS t,
movie_info AS mi,
movie_info_idx AS mi_idx,
movie_keyword AS mk,
name AS n,
keyword AS k,
movie_link AS ml
WHERE (ci.note = '(voice)' AND mc.note LIKE '%(worldwide)%' AND mc.note NOT LIKE '%(USA)%' AND n1.name LIKE '%Yo%' AND n1.name NOT LIKE '%Yu%' AND mi.info IN ('Horror', 'Action', 'Sci-Fi', 'Thriller', 'Crime', 'War') AND k.keyword IN ('murder', 'violence', 'blood', 'gore', 'death', 'female-nudity', 'hospital') AND an1.person_id = n1.id AND n1.id = ci.person_id AND ci.movie_id = t.id AND t.id = mc.movie_id AND an1.person_id = ci.person_id AND ci.movie_id = mc.movie_id AND t.id = mi.movie_id AND t.id = mi_idx.movie_id AND t.id = mk.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND ci.movie_id = mk.movie_id AND mi.movie_id = mi_idx.movie_id AND mi.movie_id = mk.movie_id AND mi.movie_id = mc.movie_id AND mi_idx.movie_id = mk.movie_id AND mi_idx.movie_id = mc.movie_id AND mk.movie_id = mc.movie_id AND n.id = ci.person_id AND an1.person_id = n.id AND n.id = n1.id AND k.id = mk.keyword_id AND ml.movie_id = mk.movie_id AND ml.movie_id = mc.movie_id AND ml.movie_id = mi.movie_id AND ml.movie_id = ci.movie_id AND ml.movie_id = mi_idx.movie_id AND t.id = ml.movie_id)

--{"gen": "erase", "time": "/", "template": "generated-1ec80e64-fef0-4f3b-acf6-af7b2a957768", "dataset": "full_job", "rows": null}
SELECT min(an1.name) AS actress_pseudonym
FROM aka_name AS an1,
cast_info AS ci,
movie_companies AS mc,
name AS n1,
movie_info_idx AS mi_idx,
movie_keyword AS mk,
movie_link AS ml
WHERE (ci.note = '(voice: English version)' AND mc.note LIKE '%(Japan)%' AND mc.note NOT LIKE '%(USA)%' AND n1.name LIKE '%Tim%' AND n1.name LIKE '%Yo%' AND an1.person_id = n1.id AND n1.id = ci.person_id AND an1.person_id = ci.person_id AND ci.movie_id = mc.movie_id AND ci.movie_id = mi_idx.movie_id AND ci.movie_id = mk.movie_id AND mi_idx.movie_id = mk.movie_id AND mi_idx.movie_id = mc.movie_id AND mk.movie_id = mc.movie_id AND ml.movie_id = mk.movie_id AND ml.movie_id = mc.movie_id AND ml.movie_id = ci.movie_id AND ml.movie_id = mi_idx.movie_id)

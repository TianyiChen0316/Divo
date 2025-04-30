--{"gen": "erase", "time": "/", "template": "generated-0ada0aec-13b7-41b1-b5f2-1f46043591e6", "dataset": "full_job", "rows": null}
SELECT count(*)
FROM title AS t,
movie_info AS mi,
aka_name AS an,
cast_info AS ci,
movie_link AS ml
WHERE (lower(mi.info) LIKE '%action%' AND an.name LIKE '%a%' AND mi.movie_id = t.id AND t.id = ci.movie_id AND ml.linked_movie_id = t.id AND an.person_id = ci.person_id AND ci.movie_id = ml.linked_movie_id AND ci.movie_id = mi.movie_id AND mi.movie_id = ml.linked_movie_id)

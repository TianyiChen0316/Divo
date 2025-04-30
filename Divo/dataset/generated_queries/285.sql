--{"gen": "erase", "time": "/", "template": "generated-db40eada-8fd1-4a9e-b95f-bcb6156c6206", "dataset": "full_job", "rows": null}
SELECT count(*)
FROM title AS t,
movie_keyword AS mk,
movie_info AS mi,
aka_name AS an,
cast_info AS ci,
link_type AS lt,
movie_link AS ml,
person_info AS pi
WHERE (lower(mi.info) LIKE '%action%' AND an.name LIKE '%a%' AND lt.link = 'features' AND pi.note = 'Volker Boehm' AND mi.movie_id = t.id AND mk.movie_id = t.id AND mk.movie_id = mi.movie_id AND t.id = ci.movie_id AND ml.linked_movie_id = t.id AND lt.id = ml.link_type_id AND pi.person_id = an.person_id AND pi.person_id = ci.person_id AND an.person_id = ci.person_id AND ci.movie_id = ml.linked_movie_id AND ci.movie_id = mk.movie_id AND ci.movie_id = mi.movie_id AND mk.movie_id = ml.linked_movie_id AND mi.movie_id = ml.linked_movie_id AND mi.info_type_id = pi.info_type_id)

--{"gen": "combine", "time": "/", "template": "e5b", "dataset": "full_job", "rows": null}
SELECT *
FROM keyword AS k,
movie_info AS mi,
movie_keyword AS mk,
aka_name AS an,
cast_info AS ci,
link_type AS lt,
movie_link AS ml,
person_info AS pi
WHERE (k.keyword LIKE '%sequel%' AND mi.info IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Denish', 'Norwegian', 'German') AND an.name LIKE '%a%' AND lt.link = 'features' AND pi.note = 'Volker Boehm' AND mk.movie_id = mi.movie_id AND k.id = mk.keyword_id AND lt.id = ml.link_type_id AND pi.person_id = an.person_id AND pi.person_id = ci.person_id AND an.person_id = ci.person_id AND ci.movie_id = ml.linked_movie_id AND ci.movie_id = mk.movie_id AND ci.movie_id = mi.movie_id AND mk.movie_id = ml.linked_movie_id AND mi.movie_id = ml.linked_movie_id)

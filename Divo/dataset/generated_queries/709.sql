--{"gen": "combine", "time": "/", "template": "generated-cf119bdc-821f-4e65-815e-9e15fd1cc16f", "dataset": "full_job", "rows": null}
SELECT min(t.title) AS movie_title
FROM keyword AS k,
movie_companies AS mc,
movie_keyword AS mk,
title AS t,
aka_name AS an,
cast_info AS ci,
movie_link AS ml,
person_info AS pi
WHERE (k.keyword = 'character-name-in-title' AND an.name IS NOT NULL AND (an.name LIKE '%a%' OR an.name LIKE 'A%') AND pi.note IS NOT NULL AND mc.movie_id = t.id AND t.id = mk.movie_id AND mk.keyword_id = k.id AND mc.movie_id = mk.movie_id AND t.id = ci.movie_id AND ml.linked_movie_id = t.id AND pi.person_id = an.person_id AND pi.person_id = ci.person_id AND an.person_id = ci.person_id AND ci.movie_id = ml.linked_movie_id AND mc.movie_id = ci.movie_id AND mc.movie_id = ml.linked_movie_id AND ci.movie_id = mk.movie_id AND mk.movie_id = ml.linked_movie_id)

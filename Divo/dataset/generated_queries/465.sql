--{"gen": "combine", "time": "/", "template": "18b", "dataset": "full_job", "rows": null}
SELECT min(mi.info) AS movie_budget,
min(mi_idx.info) AS movie_votes
FROM cast_info AS ci,
info_type AS it1,
info_type AS it2,
movie_info AS mi,
movie_info_idx AS mi_idx,
name AS n,
aka_name AS an,
info_type AS it,
link_type AS lt,
movie_link AS ml,
person_info AS pi
WHERE (ci.note IN ('(writer)', '(head writer)', '(written by)', '(story)', '(story editor)') AND it1.info = 'genres' AND it2.info = 'rating' AND mi.info IN ('Horror', 'Thriller') AND mi.note IS NULL AND mi_idx.info > '8.0' AND n.gender IS NOT NULL AND n.gender = 'f' AND an.name IS NOT NULL AND (an.name LIKE '%a%' OR an.name LIKE 'A%') AND it.info = 'mini biography' AND lt.link IN ('references', 'referenced in', 'features', 'featured in') AND pi.note IS NOT NULL AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND n.id = ci.person_id AND it1.id = mi.info_type_id AND it2.id = mi_idx.info_type_id AND n.id = an.person_id AND n.id = pi.person_id AND lt.id = ml.link_type_id AND it.id = pi.info_type_id AND pi.person_id = an.person_id AND pi.person_id = ci.person_id AND an.person_id = ci.person_id AND ci.movie_id = ml.linked_movie_id AND mi.movie_id = ml.linked_movie_id AND ml.linked_movie_id = mi_idx.movie_id)

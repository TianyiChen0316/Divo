--{"gen": "combine", "time": "/", "template": "generated-d47a56b5-16c4-4952-ae0c-dfcf7f33ceb4", "dataset": "full_job", "rows": null}
SELECT min(mi.info) AS movie_budget,
min(t.title) AS movie_title
FROM cast_info AS ci,
info_type AS it1,
movie_info AS mi,
title AS t,
char_name AS cn
WHERE (ci.note IN ('(writer)', '(head writer)', '(written by)', '(story)', '(story editor)') AND it1.info = 'countries' AND mi.info IN ('Horror', 'Action', 'Sci-Fi', 'Thriller', 'Crime', 'War') AND t.id = mi.movie_id AND t.id = ci.movie_id AND ci.movie_id = mi.movie_id AND it1.id = mi.info_type_id AND cn.id = ci.person_role_id)

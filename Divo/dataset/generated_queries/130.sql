--{"gen": "erase", "time": "/", "template": "generated-8d6bd59a-3639-4683-98fb-711164d02162", "dataset": "full_job", "rows": null}
SELECT min(mi.info) AS movie_budget,
min(mi_idx.info) AS movie_votes
FROM cast_info AS ci,
movie_info AS mi,
movie_info_idx AS mi_idx,
aka_name AS an1,
movie_companies AS mc,
name AS n1,
movie_keyword AS mk
WHERE (ci.note IN ('(writer)', '(head writer)', '(written by)', '(story)', '(story editor)') AND mi.info IN ('Horror', 'Action', 'Sci-Fi', 'Thriller', 'Crime', 'War') AND mc.note LIKE '%(1994)%' AND mc.note LIKE '%(Blu-ray)%' AND n1.name LIKE '%Yo%' AND n1.name LIKE '%Tim%' AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND an1.person_id = n1.id AND n1.id = ci.person_id AND an1.person_id = ci.person_id AND ci.movie_id = mc.movie_id AND ci.movie_id = mk.movie_id AND mi.movie_id = mk.movie_id AND mi.movie_id = mc.movie_id AND mi_idx.movie_id = mk.movie_id AND mi_idx.movie_id = mc.movie_id AND mk.movie_id = mc.movie_id)

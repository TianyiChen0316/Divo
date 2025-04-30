--{"gen": "combine", "time": "/", "template": "18c", "dataset": "full_job", "rows": null}
SELECT min(mi.info) AS movie_budget,
min(mi_idx.info) AS movie_votes
FROM cast_info AS ci,
info_type AS it1,
info_type AS it2,
movie_info AS mi,
movie_info_idx AS mi_idx,
name AS n,
movie_companies AS mc,
movie_keyword AS mk,
char_name AS chn,
aka_name AS an1,
name AS n1
WHERE (ci.note IN ('(writer)', '(head writer)', '(written by)', '(story)', '(story editor)') AND it1.info = 'genres' AND it2.info = 'votes' AND mi.info IN ('Horror', 'Action', 'Sci-Fi', 'Thriller', 'Crime', 'War') AND n.gender = 'm' AND mc.note NOT LIKE '%(as Metro-Goldwyn-Mayer Pictures)%' AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND n.id = ci.person_id AND it1.id = mi.info_type_id AND it2.id = mi_idx.info_type_id AND ci.movie_id = mk.movie_id AND ci.movie_id = mc.movie_id AND chn.id = ci.person_role_id AND mc.movie_id = mk.movie_id AND an1.person_id = n1.id AND n1.id = ci.person_id AND an1.person_id = ci.person_id AND mk.movie_id = mi.movie_id AND mc.movie_id = mi.movie_id AND an1.person_id = n.id AND n.id = n1.id AND mc.movie_id = mi_idx.movie_id AND mk.movie_id = mi_idx.movie_id)

--{"gen": "erase", "time": "/", "template": "generated-055f18ff-1f2e-44d8-a078-ef1e718dc81b", "dataset": "full_job", "rows": null}
SELECT min(mi_idx.info) AS rating
FROM movie_info_idx AS mi_idx,
movie_keyword AS mk,
cast_info AS ci,
info_type AS it1,
info_type AS it2,
movie_info AS mi,
aka_title AS at,
movie_companies AS mc
WHERE (mi_idx.info > '3.0' AND ci.note IN ('(writer)', '(head writer)', '(written by)', '(story)', '(story editor)') AND it1.info = 'release dates' AND it2.info = 'top 250 rank' AND mi.info IN ('Horror', 'Action', 'Sci-Fi', 'Thriller', 'Crime', 'War') AND mk.movie_id = mi_idx.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND ci.movie_id = mk.movie_id AND mi.movie_id = mi_idx.movie_id AND mi.movie_id = mk.movie_id AND it1.id = mi.info_type_id AND it2.id = mi_idx.info_type_id AND mc.movie_id = at.movie_id AND mc.movie_id = ci.movie_id AND mc.movie_id = mk.movie_id AND mc.movie_id = mi.movie_id AND mc.movie_id = mi_idx.movie_id AND at.movie_id = ci.movie_id AND at.movie_id = mk.movie_id AND at.movie_id = mi.movie_id AND at.movie_id = mi_idx.movie_id)

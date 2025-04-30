--{"gen": "erase", "time": "/", "template": "generated-97a5f379-3d09-410b-8df6-89cadc3183ad", "dataset": "full_job", "rows": null}
SELECT min(n.name) AS actor_name
FROM cast_info AS ci,
name AS n,
info_type AS it1,
info_type AS it2,
movie_info AS mi,
movie_info_idx AS mi_idx
WHERE (n.name LIKE '%Yo%' AND it1.info = 'genres' AND it2.info = 'mini biography' AND mi.info IN ('Horror', 'Action', 'Sci-Fi', 'Thriller', 'Crime', 'War') AND n.id = ci.person_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND it1.id = mi.info_type_id AND it2.id = mi_idx.info_type_id)

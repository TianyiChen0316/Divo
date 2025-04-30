--{"gen": "combine", "time": "/", "template": "generated-97a5f379-3d09-410b-8df6-89cadc3183ad", "dataset": "full_job", "rows": null}
SELECT min(k.keyword) AS movie_keyword,
min(n.name) AS actor_name
FROM cast_info AS ci,
keyword AS k,
movie_keyword AS mk,
name AS n,
info_type AS it1,
info_type AS it2,
movie_info AS mi,
movie_info_idx AS mi_idx
WHERE (k.keyword IN ('superhero', 'sequel', 'second-part', 'marvel-comics', 'based-on-comic', 'tv-special', 'fight', 'violence') AND n.name LIKE '%Yo%' AND it1.info = 'genres' AND it2.info = 'votes' AND mi.info IN ('Horror', 'Action', 'Sci-Fi', 'Thriller', 'Crime', 'War') AND k.id = mk.keyword_id AND ci.movie_id = mk.movie_id AND n.id = ci.person_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND mi.movie_id = mk.movie_id AND mi_idx.movie_id = mk.movie_id AND it1.id = mi.info_type_id AND it2.id = mi_idx.info_type_id)

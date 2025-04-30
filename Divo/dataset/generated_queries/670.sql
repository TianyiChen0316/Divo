--{"gen": "erase", "time": "/", "template": "generated-217be283-b8e5-4d56-8a66-daadeecc531f", "dataset": "full_job", "rows": null}
SELECT min(k.keyword) AS movie_keyword
FROM cast_info AS ci,
keyword AS k,
movie_keyword AS mk,
info_type AS it1,
movie_info AS mi,
movie_info_idx AS mi_idx,
person_info AS pi
WHERE (k.keyword IN ('superhero', 'sequel', 'second-part', 'marvel-comics', 'based-on-comic', 'tv-special', 'fight', 'violence') AND it1.info = 'genres' AND mi.info = 'Horror' AND lower(pi.info) LIKE '%japan%' AND k.id = mk.keyword_id AND ci.movie_id = mk.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND mi.movie_id = mk.movie_id AND mi_idx.movie_id = mk.movie_id AND it1.id = mi.info_type_id AND ci.person_id = pi.person_id)

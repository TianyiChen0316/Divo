--{"gen": "erase", "time": "/", "template": "generated-217be283-b8e5-4d56-8a66-daadeecc531f", "dataset": "full_job", "rows": null}
SELECT min(n.name) AS actor_name
FROM cast_info AS ci,
movie_keyword AS mk,
name AS n,
info_type AS it1,
info_type AS it2,
movie_info AS mi,
movie_info_idx AS mi_idx,
person_info AS pi
WHERE (it1.info = 'votes' AND it2.info = 'countries' AND mi.info = 'Horror' AND lower(pi.info) LIKE '%japan%' AND ci.movie_id = mk.movie_id AND n.id = ci.person_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND mi.movie_id = mk.movie_id AND mi_idx.movie_id = mk.movie_id AND it1.id = mi.info_type_id AND it2.id = mi_idx.info_type_id AND pi.person_id = n.id AND ci.person_id = pi.person_id)

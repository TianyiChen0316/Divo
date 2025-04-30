--{"gen": "erase", "time": "/", "template": "generated-6b7dc3d4-3ee4-4dbe-b42b-18f8e242eb51", "dataset": "full_job", "rows": null}
SELECT *
FROM cast_info AS ci,
movie_companies AS mc,
person_info AS pi,
info_type AS it,
movie_keyword AS mk,
movie_info AS mi
WHERE (ci.note LIKE '%(voice)%' AND ci.note LIKE '%(uncredited)%' AND lower(pi.info) LIKE '%usa%' AND it.info = 'top 250 rank' AND lower(mi.info) LIKE '%usa%' AND ci.movie_id = mc.movie_id AND ci.movie_id = mk.movie_id AND ci.movie_id = mi.movie_id AND mk.movie_id = mi.movie_id AND mc.movie_id = mk.movie_id AND mc.movie_id = mi.movie_id AND mi.info_type_id = it.id AND ci.person_id = pi.person_id)

--{"gen": "erase", "time": "/", "template": "e9a", "dataset": "full_job", "rows": null}
SELECT min(pi.info)
FROM person_info AS pi,
info_type AS it1,
name AS n,
cast_info AS ci,
movie_info AS mi
WHERE (mi.info ILIKE '%sci%' AND it1.info ILIKE 'birth date' AND pi.info ILIKE '%199%' AND mi.movie_id = ci.movie_id AND ci.person_id = n.id AND n.id = pi.person_id AND pi.info_type_id = it1.id AND pi.person_id = ci.person_id)

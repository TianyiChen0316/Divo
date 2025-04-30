--{"gen": "erase", "time": "/", "template": "e10a", "dataset": "full_job", "rows": null}
SELECT min(n.name)
FROM info_type AS it2,
movie_info_idx AS mii,
cast_info AS ci,
name AS n,
person_info AS pi
WHERE (it2.info ILIKE '%birth%' AND pi.info ILIKE '%india%' AND (mii.info ILIKE '8%' OR mii.info ILIKE '9%' OR mii.info ILIKE '10%') AND mii.movie_id = ci.movie_id AND ci.person_id = n.id AND n.id = pi.person_id AND ci.person_id = pi.person_id AND pi.info_type_id = it2.id)

--{"gen": "erase", "time": "/", "template": "e12a", "dataset": "full_job", "rows": null}
SELECT n.name
FROM name AS n,
cast_info AS ci,
movie_info AS mi,
info_type AS it2,
person_info AS pi
WHERE ((mi.info ILIKE '%romance%' OR mi.info ILIKE '%action%') AND it2.info ILIKE 'birth date' AND pi.info ILIKE '%usa%' AND ci.movie_id = mi.movie_id AND ci.person_id = n.id AND pi.person_id = n.id AND pi.person_id = ci.person_id AND pi.info_type_id = it2.id)
 group by n.name order by count(*) desc
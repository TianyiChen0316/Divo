--{"gen": "erase", "time": "/", "template": "generated-219a6538-d625-4d05-aa62-6a84a4fb3070", "dataset": "full_job", "rows": null}
SELECT n.name
FROM name AS n,
cast_info AS ci,
movie_info AS mi,
info_type AS it1,
person_info AS pi,
aka_name AS an,
info_type AS it,
movie_companies AS mc,
role_type AS rt
WHERE (it1.id = 3 AND (mi.info ILIKE '%romance%' OR mi.info ILIKE '%action%') AND pi.info ILIKE '%usa%' AND it.info = 'release dates' AND rt.role = 'actress' AND ci.movie_id = mi.movie_id AND ci.person_id = n.id AND it1.id = mi.info_type_id AND pi.person_id = n.id AND pi.person_id = ci.person_id AND mc.movie_id = ci.movie_id AND mc.movie_id = mi.movie_id AND it.id = mi.info_type_id AND rt.id = ci.role_id AND n.id = an.person_id AND ci.person_id = an.person_id AND it1.id = it.id AND pi.person_id = an.person_id)
 group by n.name order by count(*) desc
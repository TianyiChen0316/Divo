--{"gen": "erase", "time": "/", "template": "generated-219a6538-d625-4d05-aa62-6a84a4fb3070", "dataset": "full_job", "rows": null}
SELECT n.name
FROM title AS t,
name AS n,
cast_info AS ci,
movie_info AS mi,
info_type AS it1,
info_type AS it2,
person_info AS pi,
aka_name AS an,
movie_companies AS mc,
role_type AS rt
WHERE (it1.id = 3 AND (mi.info ILIKE '%romance%' OR mi.info ILIKE '%action%') AND it2.info ILIKE '%count%' AND pi.info ILIKE '%usa%' AND rt.role = 'actress' AND t.id = ci.movie_id AND t.id = mi.movie_id AND ci.movie_id = mi.movie_id AND ci.person_id = n.id AND it1.id = mi.info_type_id AND pi.person_id = n.id AND pi.person_id = ci.person_id AND pi.info_type_id = it2.id AND t.id = mc.movie_id AND mc.movie_id = ci.movie_id AND mc.movie_id = mi.movie_id AND rt.id = ci.role_id AND n.id = an.person_id AND ci.person_id = an.person_id AND pi.person_id = an.person_id)
 group by n.name order by count(*) desc
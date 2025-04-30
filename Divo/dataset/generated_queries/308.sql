--{"gen": "combine", "time": "/", "template": "e12a", "dataset": "full_job", "rows": null}
SELECT n.name
FROM name AS n,
cast_info AS ci,
movie_info AS mi,
info_type AS it2,
person_info AS pi,
char_name AS cn,
aka_name AS an,
char_name AS chn,
movie_companies AS mc,
info_type AS it,
movie_link AS ml
WHERE ((mi.info ILIKE '%romance%' OR mi.info ILIKE '%action%') AND it2.info ILIKE '%birth%' AND pi.info ILIKE '%usa%' AND mc.note IS NOT NULL AND (mc.note LIKE '%(USA)%' OR mc.note LIKE '%(worldwide)%') AND it.info = 'mini biography' AND ci.movie_id = mi.movie_id AND ci.person_id = n.id AND pi.person_id = n.id AND pi.person_id = ci.person_id AND pi.info_type_id = it2.id AND cn.id = ci.person_role_id AND ci.movie_id = mc.movie_id AND mc.company_id = cn.id AND chn.id = ci.person_role_id AND an.person_id = ci.person_id AND cn.id = chn.id AND mc.company_id = chn.id AND mc.company_id = ci.person_role_id AND n.id = an.person_id AND it.id = pi.info_type_id AND pi.person_id = an.person_id AND ci.movie_id = ml.linked_movie_id AND mc.movie_id = ml.linked_movie_id AND mc.movie_id = mi.movie_id AND mi.movie_id = ml.linked_movie_id AND it.id = it2.id)
 group by n.name order by count(*) desc
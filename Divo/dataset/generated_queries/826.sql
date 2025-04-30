--{"gen": "combine", "time": "/", "template": "generated-d39a464e-f7b8-4ad1-8cb8-79d833f02106", "dataset": "full_job", "rows": null}
SELECT min(t.title),
min(t.production_year),
min(cn.name)
FROM cast_info AS ci,
title AS t,
char_name AS cn,
info_type AS it,
keyword AS k,
movie_keyword AS mk,
movie_companies AS mc,
aka_name AS an,
movie_info AS mi,
name AS n,
person_info AS pi
WHERE (t.kind_id = 1 AND ci.role_id = 2 AND it.info = 'rating' AND k.keyword LIKE '%sequel%' AND mc.note NOT LIKE '%(as Metro-Goldwyn-Mayer Pictures)%' AND (mc.note LIKE '%(co-production)%' OR mc.note LIKE '%(presents)%') AND mi.info IS NOT NULL AND (mi.info LIKE 'Japan:%201%' OR mi.info LIKE 'USA:%201%') AND n.gender = 'm' AND n.name LIKE '%Bert%' AND pi.info ILIKE '%usa%' AND ci.movie_id = t.id AND cn.id = ci.person_role_id AND t.id = mk.movie_id AND k.id = mk.keyword_id AND ci.movie_id = mk.movie_id AND t.id = mc.movie_id AND ci.movie_id = mc.movie_id AND mc.movie_id = mi.movie_id AND mi.movie_id = ci.movie_id AND it.id = mi.info_type_id AND n.id = ci.person_id AND n.id = an.person_id AND ci.person_id = an.person_id AND pi.person_id = n.id AND pi.person_id = ci.person_id AND pi.person_id = an.person_id AND t.id = mi.movie_id AND mc.movie_id = mk.movie_id AND mk.movie_id = mi.movie_id)

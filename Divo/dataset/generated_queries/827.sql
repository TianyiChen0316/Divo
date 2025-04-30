--{"gen": "combine", "time": "/", "template": "e1a", "dataset": "full_job", "rows": null}
SELECT min(t.title),
min(t.production_year),
min(cn.name)
FROM cast_info AS ci,
title AS t,
char_name AS cn,
aka_name AS an,
movie_companies AS mc,
movie_info AS mi,
name AS n
WHERE (t.kind_id = 1 AND ci.role_id = 2 AND mi.info IS NOT NULL AND (mi.info LIKE 'Japan:%201%' OR mi.info LIKE 'USA:%201%') AND n.gender = 'f' AND n.name LIKE '%An%' AND ci.movie_id = t.id AND cn.id = ci.person_role_id AND t.id = mi.movie_id AND t.id = mc.movie_id AND mc.movie_id = ci.movie_id AND mc.movie_id = mi.movie_id AND mi.movie_id = ci.movie_id AND cn.id = mc.company_id AND n.id = ci.person_id AND n.id = an.person_id AND ci.person_id = an.person_id AND mc.company_id = ci.person_role_id)

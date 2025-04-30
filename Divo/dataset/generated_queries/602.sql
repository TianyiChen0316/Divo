--{"gen": "erase", "time": "/", "template": "generated-585e2f25-5c79-448f-b46f-5dc73d25955d", "dataset": "full_job", "rows": null}
SELECT min(t.title),
min(t.production_year),
min(cn.name)
FROM cast_info AS ci,
title AS t,
char_name AS cn,
aka_name AS an,
movie_companies AS mc,
movie_keyword AS mk
WHERE (t.kind_id = 1 AND ci.role_id = 2 AND mc.note IS NOT NULL AND (mc.note LIKE '%(USA)%' OR mc.note LIKE '%(worldwide)%') AND ci.movie_id = t.id AND cn.id = ci.person_role_id AND t.id = mc.movie_id AND ci.movie_id = mc.movie_id AND mc.company_id = cn.id AND an.person_id = ci.person_id AND mc.company_id = ci.person_role_id AND t.id = mk.movie_id AND mc.movie_id = mk.movie_id AND ci.movie_id = mk.movie_id)

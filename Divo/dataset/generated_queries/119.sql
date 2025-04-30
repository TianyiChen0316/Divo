--{"gen": "combine", "time": "/", "template": "generated-585e2f25-5c79-448f-b46f-5dc73d25955d", "dataset": "full_job", "rows": null}
SELECT min(t.title),
min(t.production_year),
min(cn.name)
FROM cast_info AS ci,
title AS t,
char_name AS cn,
aka_name AS an,
movie_companies AS mc,
name AS n,
keyword AS k,
movie_keyword AS mk,
complete_cast AS cc,
link_type AS lt,
movie_info AS mi,
movie_link AS ml,
title AS t1
WHERE (t.kind_id = 1 AND ci.role_id = 2 AND mc.note IS NOT NULL AND (mc.note LIKE '%(USA)%' OR mc.note LIKE '%(worldwide)%') AND n.gender = 'f' AND n.name LIKE '%Ang%' AND k.keyword = 'character-name-in-title' AND lt.link LIKE '%follow%' AND mi.info IN ('Sweden', 'Germany', 'Swedish', 'German') AND ci.movie_id = t.id AND cn.id = ci.person_role_id AND t.id = mc.movie_id AND ci.movie_id = mc.movie_id AND mc.company_id = cn.id AND n.id = ci.person_id AND an.person_id = n.id AND an.person_id = ci.person_id AND mc.company_id = ci.person_role_id AND t.id = mk.movie_id AND mk.keyword_id = k.id AND mc.movie_id = mk.movie_id AND ci.movie_id = mk.movie_id AND lt.id = ml.link_type_id AND ml.movie_id = t.id AND mi.movie_id = t.id AND t.id = cc.movie_id AND ml.movie_id = mk.movie_id AND ml.movie_id = mc.movie_id AND ml.movie_id = mi.movie_id AND mk.movie_id = mi.movie_id AND mc.movie_id = mi.movie_id AND ml.movie_id = cc.movie_id AND mk.movie_id = cc.movie_id AND mc.movie_id = cc.movie_id AND mi.movie_id = cc.movie_id AND t1.id = mk.movie_id AND ml.movie_id = t1.id AND t.id = t1.id AND mc.movie_id = t1.id AND t1.id = cc.movie_id AND t1.id = mi.movie_id AND ml.movie_id = ci.movie_id AND t1.id = ci.movie_id AND ci.movie_id = cc.movie_id AND ci.movie_id = mi.movie_id)

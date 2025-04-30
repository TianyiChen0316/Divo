--{"gen": "combine", "time": "/", "template": "generated-82383e3a-b267-409d-8d10-689c7a293736", "dataset": "full_job", "rows": null}
SELECT count(*)
FROM title AS t,
movie_keyword AS mk,
keyword AS k,
info_type AS it,
movie_info AS mi,
cast_info AS ci,
char_name AS cn,
aka_name AS an,
movie_companies AS mc
WHERE (it.id = 3 AND lower(k.keyword) LIKE '%fight%' AND lower(mi.info) LIKE '%action%' AND ci.role_id = 1 AND mc.note IS NOT NULL AND (mc.note LIKE '%(USA)%' OR mc.note LIKE '%(worldwide)%') AND it.id = mi.info_type_id AND mi.movie_id = t.id AND mk.keyword_id = k.id AND mk.movie_id = t.id AND mk.movie_id = mi.movie_id AND ci.movie_id = t.id AND cn.id = ci.person_role_id AND t.id = mc.movie_id AND ci.movie_id = mc.movie_id AND mc.company_id = cn.id AND an.person_id = ci.person_id AND mc.company_id = ci.person_role_id AND mc.movie_id = mk.movie_id AND ci.movie_id = mk.movie_id AND mc.movie_id = mi.movie_id AND ci.movie_id = mi.movie_id)

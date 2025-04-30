--{"gen": "combine", "time": "/", "template": "generated-d26a7fe4-57bc-4b3f-b97b-311932381eac", "dataset": "full_job", "rows": null}
SELECT min(cn.name) AS producing_company,
min(miidx.info) AS rating,
min(t.title) AS movie
FROM company_name AS cn,
company_type AS ct,
info_type AS it,
info_type AS it2,
movie_companies AS mc,
movie_info AS mi,
movie_info_idx AS miidx,
title AS t,
movie_keyword AS mk,
cast_info AS ci,
person_info AS pi,
name AS n1,
role_type AS rt
WHERE (cn.country_code = '[us]' AND ct.kind = 'production companies' AND it.info = 'rating' AND it2.info = 'release dates' AND ci.note IN ('(writer)', '(head writer)', '(written by)', '(story)', '(story editor)') AND (pi.info ILIKE '%uk%' OR pi.info ILIKE '%spain%' OR pi.info ILIKE '%germany%' OR pi.info ILIKE '%italy%' OR pi.info ILIKE '%croatia%' OR pi.info ILIKE '%algeria%' OR pi.info ILIKE '%south%' OR pi.info ILIKE '%austria%' OR pi.info ILIKE '%hungary%') AND rt.role = 'costume designer' AND mi.movie_id = t.id AND it2.id = mi.info_type_id AND mc.movie_id = t.id AND cn.id = mc.company_id AND ct.id = mc.company_type_id AND miidx.movie_id = t.id AND it.id = miidx.info_type_id AND mi.movie_id = miidx.movie_id AND mi.movie_id = mc.movie_id AND miidx.movie_id = mc.movie_id AND mk.movie_id = mi.movie_id AND mc.movie_id = mk.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mk.movie_id AND ci.movie_id = mc.movie_id AND miidx.movie_id = mk.movie_id AND miidx.movie_id = ci.movie_id AND ci.person_id = pi.person_id AND n1.id = ci.person_id AND ci.movie_id = t.id AND ci.role_id = rt.id AND t.id = mk.movie_id AND n1.id = pi.person_id AND miidx.info_type_id = mi.info_type_id AND miidx.info_type_id = it2.id AND mi.info_type_id = it.id AND it.id = it2.id)

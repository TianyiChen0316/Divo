--{"gen": "combine", "time": "/", "template": "generated-7960c55d-9736-4396-b652-e208afc7a83e", "dataset": "full_job", "rows": null}
SELECT min(cn.name) AS from_company,
min(mc.note) AS production_note,
min(t.title) AS movie_based_on_book
FROM company_name AS cn,
company_type AS ct,
link_type AS lt,
movie_companies AS mc,
movie_keyword AS mk,
movie_link AS ml,
title AS t,
info_type AS it1,
info_type AS it2,
movie_info AS mi,
cast_info AS ci,
person_info AS pi,
name AS n
WHERE (cn.country_code <> '[pl]' AND (cn.name LIKE '20th Century Fox%' OR cn.name LIKE 'Twentieth Century Fox%') AND ct.kind <> 'production companies' AND ct.kind IS NOT NULL AND mc.note IS NOT NULL AND t.production_year > 1950 AND it2.info ILIKE '%birth%' AND (pi.info ILIKE '%uk%' OR pi.info ILIKE '%spain%' OR pi.info ILIKE '%germany%' OR pi.info ILIKE '%italy%' OR pi.info ILIKE '%croatia%' OR pi.info ILIKE '%algeria%' OR pi.info ILIKE '%south%' OR pi.info ILIKE '%austria%' OR pi.info ILIKE '%hungary%') AND mi.info ILIKE '%france%' AND it1.info ILIKE '%count%' AND lt.id = ml.link_type_id AND ml.movie_id = t.id AND t.id = mk.movie_id AND t.id = mc.movie_id AND mc.company_type_id = ct.id AND mc.company_id = cn.id AND ml.movie_id = mk.movie_id AND ml.movie_id = mc.movie_id AND mk.movie_id = mc.movie_id AND pi.info_type_id = it2.id AND t.id = ci.movie_id AND ci.person_id = pi.person_id AND mi.info_type_id = it1.id AND t.id = mi.movie_id AND ci.movie_id = mi.movie_id AND ml.movie_id = ci.movie_id AND ml.movie_id = mi.movie_id AND mc.movie_id = ci.movie_id AND mc.movie_id = mi.movie_id AND ci.movie_id = mk.movie_id AND mk.movie_id = mi.movie_id AND ci.person_id = n.id AND pi.person_id = n.id)

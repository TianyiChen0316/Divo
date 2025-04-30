--{"gen": "combine", "time": "/", "template": "generated-77bf5138-12e9-4614-b3d2-9106decb451c", "dataset": "full_job", "rows": null}
SELECT *
FROM company_name AS cn,
movie_companies AS mc,
movie_keyword AS mk,
company_type AS ct,
info_type AS it,
movie_info AS mi,
cast_info AS ci,
name AS n,
char_name AS chn,
role_type AS rt,
keyword AS k,
info_type AS it2,
person_info AS pi
WHERE (cn.country_code = '[sm]' AND ct.kind = 'production companies' AND mi.info IN ('USA', 'America') AND n.name LIKE '%Bert%' AND k.keyword = 'character-name-in-title' AND it2.info ILIKE 'rating' AND (pi.info ILIKE '%uk%' OR pi.info ILIKE '%spain%' OR pi.info ILIKE '%germany%' OR pi.info ILIKE '%italy%' OR pi.info ILIKE '%croatia%' OR pi.info ILIKE '%algeria%' OR pi.info ILIKE '%south%' OR pi.info ILIKE '%austria%' OR pi.info ILIKE '%hungary%') AND cn.id = mc.company_id AND mc.movie_id = mk.movie_id AND mc.movie_id = mi.movie_id AND ct.id = mc.company_type_id AND it.id = mi.info_type_id AND mk.movie_id = mi.movie_id AND ci.movie_id = mk.movie_id AND n.id = ci.person_id AND mc.movie_id = ci.movie_id AND ci.movie_id = mi.movie_id AND chn.id = ci.person_role_id AND rt.id = ci.role_id AND mk.keyword_id = k.id AND pi.info_type_id = it2.id AND ci.person_id = pi.person_id AND n.id = pi.person_id)

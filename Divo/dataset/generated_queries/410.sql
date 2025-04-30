--{"gen": "combine", "time": "/", "template": "generated-991dee9d-d1de-4024-bdf5-70cb50641087", "dataset": "full_job", "rows": null}
SELECT count(*)
FROM info_type AS it2,
title AS t,
movie_info AS mi,
cast_info AS ci,
person_info AS pi,
movie_keyword AS mk,
complete_cast AS cc,
company_name AS cn,
keyword AS k,
movie_companies AS mc
WHERE (it2.info ILIKE '%birth%' AND (pi.info ILIKE '%uk%' OR pi.info ILIKE '%spain%' OR pi.info ILIKE '%germany%' OR pi.info ILIKE '%italy%' OR pi.info ILIKE '%croatia%' OR pi.info ILIKE '%algeria%' OR pi.info ILIKE '%south%' OR pi.info ILIKE '%austria%' OR pi.info ILIKE '%hungary%') AND mi.info ILIKE '%france%' AND cn.country_code = '[sm]' AND k.keyword = 'character-name-in-title' AND pi.info_type_id = it2.id AND t.id = ci.movie_id AND ci.person_id = pi.person_id AND t.id = mi.movie_id AND ci.movie_id = mi.movie_id AND t.id = mk.movie_id AND t.id = cc.movie_id AND ci.movie_id = mk.movie_id AND ci.movie_id = cc.movie_id AND mi.movie_id = mk.movie_id AND mi.movie_id = cc.movie_id AND mk.movie_id = cc.movie_id AND cn.id = mc.company_id AND mc.movie_id = t.id AND mk.keyword_id = k.id AND mc.movie_id = mk.movie_id AND mc.movie_id = ci.movie_id AND mc.movie_id = cc.movie_id AND mc.movie_id = mi.movie_id)

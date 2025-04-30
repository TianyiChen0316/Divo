--{"gen": "erase", "time": "/", "template": "generated-156b1a17-afe9-4d15-9079-8a3d1846f4d9", "dataset": "full_job", "rows": null}
SELECT *
FROM cast_info AS ci,
company_type AS ct,
movie_companies AS mc,
info_type AS it,
movie_info AS mi,
info_type AS it1,
person_info AS pi,
keyword AS k,
movie_keyword AS mk,
movie_link AS ml,
title AS t1,
title AS t,
aka_title AS at
WHERE (ci.note LIKE '%(producer)%' AND it.info = 'release dates' AND mi.info IS NOT NULL AND (mi.info LIKE 'Japan:%201%' OR mi.info LIKE 'USA:%201%') AND it1.id = 3 AND pi.info ILIKE '%usa%' AND k.keyword = 'character-name-in-title' AND t.production_year BETWEEN 2005 AND 2010 AND ci.movie_id = mc.movie_id AND ct.id = mc.company_type_id AND mc.movie_id = mi.movie_id AND mi.movie_id = ci.movie_id AND it.id = mi.info_type_id AND it1.id = mi.info_type_id AND pi.person_id = ci.person_id AND it1.id = it.id AND mk.keyword_id = k.id AND t1.id = mk.movie_id AND ml.movie_id = t1.id AND mk.movie_id = t1.id AND t.id = mi.movie_id AND t.id = mk.movie_id AND mk.movie_id = mi.movie_id AND t.id = ml.movie_id AND t.id = t1.id AND ml.movie_id = mk.movie_id AND ml.movie_id = mi.movie_id AND t1.id = mi.movie_id AND mk.movie_id = mc.movie_id AND mk.movie_id = at.movie_id AND mi.movie_id = at.movie_id AND mc.movie_id = at.movie_id AND t.id = mc.movie_id AND t.id = at.movie_id AND ml.movie_id = mc.movie_id AND ml.movie_id = at.movie_id AND mc.movie_id = t1.id AND t1.id = at.movie_id AND t.id = ci.movie_id AND ml.movie_id = ci.movie_id AND t1.id = ci.movie_id AND at.movie_id = ci.movie_id AND ci.movie_id = mk.movie_id)

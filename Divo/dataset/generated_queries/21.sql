--{"gen": "combine", "time": "/", "template": "generated-38fd9c84-6573-4f1d-8e4f-65c4405054c7", "dataset": "full_job", "rows": null}
SELECT min(chn.name) AS character
FROM char_name AS chn,
cast_info AS ci,
company_name AS cn,
company_type AS ct,
movie_companies AS mc,
role_type AS rt,
aka_name AS an,
info_type AS it,
movie_info AS mi,
movie_keyword AS mk,
title AS t,
keyword AS k,
link_type AS lt,
movie_link AS ml,
title AS t1
WHERE (ci.note LIKE '%(producer)%' AND cn.country_code = '[us]' AND it.info = 'release dates' AND mi.info IS NOT NULL AND (mi.info LIKE 'Japan:%201%' OR mi.info LIKE 'USA:%201%') AND t.production_year BETWEEN 2005 AND 2010 AND k.keyword = 'character-name-in-title' AND ci.movie_id = mc.movie_id AND chn.id = ci.person_role_id AND rt.id = ci.role_id AND cn.id = mc.company_id AND ct.id = mc.company_type_id AND mc.movie_id = mi.movie_id AND mc.movie_id = mk.movie_id AND mi.movie_id = ci.movie_id AND mi.movie_id = mk.movie_id AND ci.movie_id = mk.movie_id AND it.id = mi.info_type_id AND ci.person_id = an.person_id AND t.id = mi.movie_id AND t.id = mc.movie_id AND t.id = mk.movie_id AND mk.keyword_id = k.id AND t1.id = mk.movie_id AND ml.movie_id = t1.id AND lt.id = ml.link_type_id AND mk.movie_id = t1.id AND t.id = ml.movie_id AND t.id = t1.id AND ml.movie_id = mk.movie_id AND mc.movie_id = ml.movie_id AND mc.movie_id = t1.id AND ml.movie_id = mi.movie_id AND t1.id = mi.movie_id AND t.id = ci.movie_id AND ml.movie_id = ci.movie_id AND t1.id = ci.movie_id)

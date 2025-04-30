--{"gen": "combine", "time": "/", "template": "generated-3af324dc-ee55-4ee2-a9e7-3f89d11e0f78", "dataset": "full_job", "rows": null}
SELECT *
FROM cast_info AS ci,
keyword AS k,
movie_companies AS mc,
movie_keyword AS mk,
complete_cast AS cc,
info_type AS it,
movie_info AS mi,
person_info AS pi,
title AS t
WHERE (k.keyword = 'character-name-in-title' AND it.info = 'release dates' AND mi.info IS NOT NULL AND (mi.info LIKE 'Japan:%200%' OR mi.info LIKE 'USA:%200%') AND t.title = 'Shrek 2' AND t.production_year BETWEEN 2005 AND 2015 AND mk.keyword_id = k.id AND ci.movie_id = mc.movie_id AND ci.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id AND t.id = mi.movie_id AND t.id = mc.movie_id AND t.id = ci.movie_id AND t.id = mk.movie_id AND t.id = cc.movie_id AND mc.movie_id = mi.movie_id AND mc.movie_id = cc.movie_id AND mi.movie_id = ci.movie_id AND mi.movie_id = mk.movie_id AND mi.movie_id = cc.movie_id AND ci.movie_id = cc.movie_id AND mk.movie_id = cc.movie_id AND it.id = mi.info_type_id AND ci.person_id = pi.person_id)

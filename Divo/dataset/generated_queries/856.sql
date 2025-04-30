--{"gen": "combine", "time": "/", "template": "generated-6f824f4d-3925-4b60-af88-cb7a1c668baf", "dataset": "full_job", "rows": null}
SELECT *
FROM cast_info AS ci,
company_name AS cn,
keyword AS k,
movie_companies AS mc,
movie_keyword AS mk,
movie_info AS mi,
company_type AS ct,
link_type AS lt,
movie_link AS ml,
title AS t1,
title AS t2
WHERE (cn.country_code = '[us]' AND k.keyword = 'character-name-in-title' AND mi.info IN ('Drama', 'Horror', 'Western', 'Family') AND ct.kind <> 'production companies' AND ct.kind IS NOT NULL AND mk.keyword_id = k.id AND mc.company_id = cn.id AND ci.movie_id = mc.movie_id AND ci.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id AND mc.movie_id = mi.movie_id AND ci.movie_id = mi.movie_id AND mk.movie_id = mi.movie_id AND lt.id = ml.link_type_id AND mc.company_type_id = ct.id AND ml.movie_id = mk.movie_id AND ml.movie_id = mc.movie_id AND ml.movie_id = ci.movie_id AND ml.movie_id = mi.movie_id AND t1.id = mk.movie_id AND ml.movie_id = t1.id AND ml.linked_movie_id = t2.id AND mk.movie_id = t1.id AND mc.movie_id = t1.id AND t1.id = ci.movie_id AND t1.id = mi.movie_id)

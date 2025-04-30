--{"gen": "combine", "time": "/", "template": "generated-5e258203-6b2f-4034-8fe5-651be05d9a04", "dataset": "full_job", "rows": null}
SELECT min(lt.link) AS link_type,
min(t1.title) AS first_movie,
min(t2.title) AS second_movie
FROM keyword AS k,
link_type AS lt,
movie_keyword AS mk,
movie_link AS ml,
title AS t1,
title AS t2,
movie_info AS mi,
title AS t,
aka_title AS at,
company_type AS ct,
info_type AS it1,
movie_companies AS mc,
cast_info AS ci,
company_name AS cn,
name AS n,
info_type AS it2,
movie_info_idx AS mi_idx
WHERE (k.keyword = 'character-name-in-title' AND mi.info IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Denish', 'Norwegian', 'German') AND t.production_year > 2005 AND it1.info = 'top 250 rank' AND n.name LIKE 'Z%' AND it2.info = 'votes' AND mk.keyword_id = k.id AND t1.id = mk.movie_id AND ml.movie_id = t1.id AND ml.linked_movie_id = t2.id AND lt.id = ml.link_type_id AND mk.movie_id = t1.id AND t.id = mi.movie_id AND t.id = mk.movie_id AND mk.movie_id = mi.movie_id AND t.id = ml.movie_id AND t.id = t1.id AND ml.movie_id = mk.movie_id AND ml.movie_id = mi.movie_id AND t1.id = mi.movie_id AND mk.movie_id = mc.movie_id AND mk.movie_id = at.movie_id AND mi.movie_id = mc.movie_id AND mi.movie_id = at.movie_id AND mc.movie_id = at.movie_id AND it1.id = mi.info_type_id AND ct.id = mc.company_type_id AND t.id = mc.movie_id AND t.id = at.movie_id AND ml.movie_id = mc.movie_id AND ml.movie_id = at.movie_id AND mc.movie_id = t1.id AND t1.id = at.movie_id AND n.id = ci.person_id AND ci.movie_id = t.id AND mc.company_id = cn.id AND ci.movie_id = mc.movie_id AND ci.movie_id = mk.movie_id AND ml.movie_id = ci.movie_id AND t1.id = ci.movie_id AND at.movie_id = ci.movie_id AND ci.movie_id = mi.movie_id AND t.id = mi_idx.movie_id AND ci.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND it2.id = mi_idx.info_type_id AND ml.movie_id = mi_idx.movie_id AND mc.movie_id = mi_idx.movie_id AND t1.id = mi_idx.movie_id AND at.movie_id = mi_idx.movie_id AND mk.movie_id = mi_idx.movie_id)

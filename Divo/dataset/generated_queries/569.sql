--{"gen": "combine", "time": "/", "template": "generated-f7df55dc-bacd-4692-9db1-5214841c55c0", "dataset": "full_job", "rows": null}
SELECT min(mi.info) AS movie_budget,
min(kt.kind) AS movie_type,
min(t.title) AS violent_movie
FROM cast_info AS ci,
company_name AS cn,
keyword AS k,
movie_companies AS mc,
movie_info AS mi,
movie_keyword AS mk,
title AS t,
kind_type AS kt,
company_type AS ct,
movie_info_idx AS miidx,
company_name AS cn1,
movie_companies AS mc1,
movie_companies AS mc2,
movie_info_idx AS mi_idx1,
movie_link AS ml,
title AS t2,
company_name AS cn2
WHERE (ci.note IN ('(writer)', '(head writer)', '(written by)', '(story)', '(story editor)') AND cn.country_code = '[hk]' AND k.keyword IN ('murder', 'violence', 'blood', 'gore', 'death', 'female-nudity', 'hospital') AND mc.note LIKE '%(Blu-ray)%' AND mi.info IN ('Horror', 'Thriller') AND t.production_year > 2000 AND ct.kind = 'production companies' AND cn1.country_code <> '[pl]' AND t2.production_year BETWEEN 2000 AND 2010 AND t.id = mi.movie_id AND t.id = ci.movie_id AND t.id = mk.movie_id AND t.id = mc.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mk.movie_id AND ci.movie_id = mc.movie_id AND mi.movie_id = mk.movie_id AND mi.movie_id = mc.movie_id AND mk.movie_id = mc.movie_id AND k.id = mk.keyword_id AND cn.id = mc.company_id AND t.kind_id = kt.id AND ct.id = mc.company_type_id AND miidx.movie_id = t.id AND mi.movie_id = miidx.movie_id AND miidx.movie_id = mc.movie_id AND miidx.movie_id = mk.movie_id AND miidx.movie_id = ci.movie_id AND t2.id = ml.linked_movie_id AND cn1.id = mc1.company_id AND ml.movie_id = mi_idx1.movie_id AND ml.movie_id = mc1.movie_id AND mi_idx1.movie_id = mc1.movie_id AND t2.id = mc2.movie_id AND ml.linked_movie_id = mc2.movie_id AND cn2.id = mc2.company_id AND mi.info_type_id = mi_idx1.info_type_id)

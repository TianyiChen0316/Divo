--{"gen": "combine", "time": "/", "template": "generated-e5836bc9-d6fb-47ca-8811-5096333471be", "dataset": "full_job", "rows": null}
SELECT min(t.title) AS complete_western_sequel
FROM complete_cast AS cc,
company_type AS ct,
keyword AS k,
movie_companies AS mc,
movie_info AS mi,
movie_keyword AS mk,
movie_link AS ml,
title AS t,
info_type AS it,
movie_info_idx AS mi_idx
WHERE (ct.kind = 'production companies' AND k.keyword = 'sequel' AND mc.note IS NULL AND mi.info IN ('Sweden', 'Germany', 'Swedish', 'German') AND t.production_year BETWEEN 1950 AND 2000 AND it.info = 'top 250 rank' AND ml.movie_id = t.id AND t.id = mk.movie_id AND mk.keyword_id = k.id AND t.id = mc.movie_id AND mc.company_type_id = ct.id AND mi.movie_id = t.id AND t.id = cc.movie_id AND ml.movie_id = mk.movie_id AND ml.movie_id = mc.movie_id AND mk.movie_id = mc.movie_id AND ml.movie_id = mi.movie_id AND mk.movie_id = mi.movie_id AND mc.movie_id = mi.movie_id AND ml.movie_id = cc.movie_id AND mk.movie_id = cc.movie_id AND mc.movie_id = cc.movie_id AND mi.movie_id = cc.movie_id AND t.id = mi_idx.movie_id AND mc.movie_id = mi_idx.movie_id AND it.id = mi_idx.info_type_id AND ml.movie_id = mi_idx.movie_id AND cc.movie_id = mi_idx.movie_id AND mk.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id)

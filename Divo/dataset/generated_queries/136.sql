--{"gen": "erase", "time": "/", "template": "generated-4440d877-9230-4987-8d14-dabb6b1d6e35", "dataset": "full_job", "rows": null}
SELECT min(mi_idx.info) AS rating,
min(t.title) AS mainstream_movie
FROM movie_companies AS mc,
movie_info AS mi,
movie_info_idx AS mi_idx,
title AS t,
keyword AS k,
movie_keyword AS mk,
cast_info AS ci,
company_name AS cn,
info_type AS it1,
info_type AS it2,
movie_info_idx AS mii,
person_info AS pi,
complete_cast AS cc,
comp_cast_type AS cct1,
info_type AS it
WHERE (mi.info IN ('Drama', 'Horror', 'Western', 'Family') AND mi_idx.info > '2.0' AND t.production_year BETWEEN 2000 AND 2010 AND k.keyword LIKE '%sequel%' AND ci.note IN ('(writer)', '(head writer)', '(written by)', '(story)', '(story editor)') AND cn.country_code = '[hk]' AND it1.info = 'genres' AND it2.info ILIKE '%birth%' AND pi.info ILIKE '%india%' AND (mii.info ILIKE '8%' OR mii.info ILIKE '9%' OR mii.info ILIKE '10%') AND cct1.kind = 'complete+verified' AND it.info = 'release dates' AND t.id = mi.movie_id AND t.id = mi_idx.movie_id AND t.id = mc.movie_id AND mi.movie_id = mi_idx.movie_id AND mi.movie_id = mc.movie_id AND mi_idx.movie_id = mc.movie_id AND t.id = mk.movie_id AND mk.movie_id = mi.movie_id AND k.id = mk.keyword_id AND mc.movie_id = mk.movie_id AND mk.movie_id = mi_idx.movie_id AND t.id = ci.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND ci.movie_id = mk.movie_id AND ci.movie_id = mc.movie_id AND it1.id = mi.info_type_id AND cn.id = mc.company_id AND mii.movie_id = ci.movie_id AND ci.person_id = pi.person_id AND pi.info_type_id = it2.id AND t.id = mii.movie_id AND mc.movie_id = mii.movie_id AND mk.movie_id = mii.movie_id AND mi.movie_id = mii.movie_id AND mi_idx.movie_id = mii.movie_id AND t.id = cc.movie_id AND mc.movie_id = cc.movie_id AND mi.movie_id = cc.movie_id AND ci.movie_id = cc.movie_id AND it.id = mi.info_type_id AND cct1.id = cc.subject_id AND it1.id = it.id AND cc.movie_id = mk.movie_id AND cc.movie_id = mi_idx.movie_id AND cc.movie_id = mii.movie_id)

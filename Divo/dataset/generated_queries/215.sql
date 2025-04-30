--{"gen": "combine", "time": "/", "template": "generated-072fd7bb-c344-4a1d-a4d5-881f0b458585", "dataset": "full_job", "rows": null}
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
name AS n,
info_type AS it2,
movie_info_idx AS mii,
person_info AS pi,
complete_cast AS cc,
comp_cast_type AS cct1,
info_type AS it,
role_type AS rt
WHERE (mi.info IN ('Drama', 'Horror', 'Western', 'Family') AND mi_idx.info > '7.0' AND t.production_year BETWEEN 2000 AND 2010 AND k.keyword LIKE '%sequel%' AND ci.note IN ('(writer)', '(head writer)', '(written by)', '(story)', '(story editor)') AND cn.country_code = '[hk]' AND it1.info = 'genres' AND n.name LIKE '%Bert%' AND it2.info ILIKE '%birth%' AND pi.info ILIKE '%india%' AND (mii.info ILIKE '8%' OR mii.info ILIKE '9%' OR mii.info ILIKE '10%') AND cct1.kind = 'complete+verified' AND it.info = 'release dates' AND rt.role = 'actress' AND t.id = mi.movie_id AND t.id = mi_idx.movie_id AND t.id = mc.movie_id AND mi.movie_id = mi_idx.movie_id AND mi.movie_id = mc.movie_id AND mi_idx.movie_id = mc.movie_id AND t.id = mk.movie_id AND mk.movie_id = mi.movie_id AND k.id = mk.keyword_id AND mc.movie_id = mk.movie_id AND mk.movie_id = mi_idx.movie_id AND t.id = ci.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND ci.movie_id = mk.movie_id AND ci.movie_id = mc.movie_id AND it1.id = mi.info_type_id AND cn.id = mc.company_id AND n.id = ci.person_id AND mii.movie_id = ci.movie_id AND n.id = pi.person_id AND ci.person_id = pi.person_id AND pi.info_type_id = it2.id AND t.id = mii.movie_id AND mc.movie_id = mii.movie_id AND mk.movie_id = mii.movie_id AND mi.movie_id = mii.movie_id AND mi_idx.movie_id = mii.movie_id AND t.id = cc.movie_id AND mc.movie_id = cc.movie_id AND mi.movie_id = cc.movie_id AND ci.movie_id = cc.movie_id AND it.id = mi.info_type_id AND rt.id = ci.role_id AND cct1.id = cc.subject_id AND it1.id = it.id AND cc.movie_id = mk.movie_id AND cc.movie_id = mi_idx.movie_id AND cc.movie_id = mii.movie_id)

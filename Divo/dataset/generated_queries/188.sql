--{"gen": "combine", "time": "/", "template": "generated-ef097668-20c0-4b26-8d84-d83716b99cf0", "dataset": "full_job", "rows": null}
SELECT min(mi.info) AS release_date,
min(t.title) AS internet_movie
FROM aka_title AS at,
company_name AS cn,
company_type AS ct,
movie_companies AS mc,
movie_info AS mi,
movie_keyword AS mk,
title AS t,
cast_info AS ci,
info_type AS it2,
keyword AS k,
movie_info_idx AS mi_idx,
name AS n
WHERE (cn.country_code = '[us]' AND mc.note LIKE '%(200%)%' AND mc.note LIKE '%(worldwide)%' AND mi.note LIKE '%internet%' AND mi.info LIKE 'USA:% 200%' AND t.production_year BETWEEN 2005 AND 2009 AND ci.note IN ('(writer)', '(head writer)', '(written by)', '(story)', '(story editor)') AND it2.info = 'votes' AND k.keyword IN ('murder', 'violence', 'blood', 'gore', 'death', 'female-nudity', 'hospital') AND n.gender = 'm' AND t.id = at.movie_id AND t.id = mi.movie_id AND t.id = mk.movie_id AND t.id = mc.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = mc.movie_id AND mk.movie_id = at.movie_id AND mi.movie_id = mc.movie_id AND mi.movie_id = at.movie_id AND mc.movie_id = at.movie_id AND cn.id = mc.company_id AND ct.id = mc.company_type_id AND t.id = mi_idx.movie_id AND t.id = ci.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND ci.movie_id = mk.movie_id AND ci.movie_id = mc.movie_id AND mi.movie_id = mi_idx.movie_id AND mi_idx.movie_id = mk.movie_id AND mi_idx.movie_id = mc.movie_id AND n.id = ci.person_id AND it2.id = mi_idx.info_type_id AND k.id = mk.keyword_id AND at.movie_id = ci.movie_id AND at.movie_id = mi_idx.movie_id)

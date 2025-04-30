--{"gen": "combine", "time": "/", "template": "generated-d207d6f6-6966-47cc-8896-3b822ab368da", "dataset": "full_job", "rows": null}
SELECT min(cn.name) AS movie_company,
min(mi_idx.info) AS rating,
min(t.title) AS western_violent_movie
FROM company_name AS cn,
info_type AS it2,
kind_type AS kt,
movie_companies AS mc,
movie_info AS mi,
movie_info_idx AS mi_idx,
movie_keyword AS mk,
title AS t,
info_type AS it,
keyword AS k,
cast_info AS ci,
name AS n,
char_name AS chn
WHERE (cn.country_code <> '[us]' AND it2.info = 'rating' AND kt.kind IN ('movie', 'episode') AND mc.note NOT LIKE '%(TV)%' AND mc.note LIKE '%(worldwide)%' AND mi.info IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Danish', 'Norwegian', 'German', 'USA', 'American') AND mi_idx.info < '8.5' AND t.production_year > 2005 AND it.info = 'rating' AND k.keyword ILIKE '%love%' AND ci.note IN ('(writer)', '(head writer)', '(written by)', '(story)', '(story editor)') AND n.gender = 'm' AND chn.name NOT LIKE '%Sherlock%' AND (chn.name LIKE '%Tony%Stark%' OR chn.name LIKE '%Iron%Man%') AND kt.id = t.kind_id AND t.id = mi.movie_id AND t.id = mk.movie_id AND t.id = mi_idx.movie_id AND t.id = mc.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = mi_idx.movie_id AND mk.movie_id = mc.movie_id AND mi.movie_id = mi_idx.movie_id AND mi.movie_id = mc.movie_id AND mc.movie_id = mi_idx.movie_id AND it2.id = mi_idx.info_type_id AND cn.id = mc.company_id AND k.id = mk.keyword_id AND it.id = mi_idx.info_type_id AND it2.id = it.id AND t.id = ci.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND ci.movie_id = mk.movie_id AND ci.movie_id = mc.movie_id AND n.id = ci.person_id AND chn.id = ci.person_role_id)

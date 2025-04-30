--{"gen": "combine", "time": "/", "template": "generated-1ec69198-0d52-4758-8451-f345c76fcb99", "dataset": "full_job", "rows": null}
SELECT min(mi.info) AS movie_budget,
min(mi_idx.info) AS movie_votes,
min(t.title) AS violent_movie
FROM cast_info AS ci,
company_name AS cn,
info_type AS it1,
info_type AS it2,
keyword AS k,
movie_companies AS mc,
movie_info AS mi,
movie_info_idx AS mi_idx,
movie_keyword AS mk,
title AS t,
name AS n,
complete_cast AS cc,
comp_cast_type AS cct1,
comp_cast_type AS cct2,
char_name AS chn
WHERE (ci.note IN ('(writer)', '(head writer)', '(written by)', '(story)', '(story editor)') AND cn.country_code = '[us]' AND it1.info = 'genres' AND it2.info = 'mini biography' AND k.keyword IN ('murder', 'violence', 'blood', 'gore', 'death', 'female-nudity', 'hospital') AND mc.note NOT LIKE '%(as Metro-Goldwyn-Mayer Pictures)%' AND mi.info IN ('Horror', 'Thriller') AND t.production_year > 2000 AND n.name LIKE '%B%' AND cct1.kind = 'cast' AND cct2.kind LIKE '%complete%' AND chn.name NOT LIKE '%Sherlock%' AND (chn.name LIKE '%Tony%Stark%' OR chn.name LIKE '%Iron%Man%') AND t.id = mi.movie_id AND t.id = mi_idx.movie_id AND t.id = ci.movie_id AND t.id = mk.movie_id AND t.id = mc.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND ci.movie_id = mk.movie_id AND ci.movie_id = mc.movie_id AND mi.movie_id = mi_idx.movie_id AND mi.movie_id = mk.movie_id AND mi.movie_id = mc.movie_id AND mi_idx.movie_id = mk.movie_id AND mi_idx.movie_id = mc.movie_id AND mk.movie_id = mc.movie_id AND it1.id = mi.info_type_id AND it2.id = mi_idx.info_type_id AND k.id = mk.keyword_id AND cn.id = mc.company_id AND n.id = ci.person_id AND t.id = cc.movie_id AND mk.movie_id = cc.movie_id AND ci.movie_id = cc.movie_id AND chn.id = ci.person_role_id AND cct1.id = cc.subject_id AND cct2.id = cc.status_id AND mc.movie_id = cc.movie_id AND cc.movie_id = mi.movie_id AND cc.movie_id = mi_idx.movie_id)

--{"gen": "combine", "time": "/", "template": "generated-14d29d45-e8d8-4de5-8e40-06f8aadda93b", "dataset": "full_job", "rows": null}
SELECT min(mi.info) AS movie_budget,
min(mi_idx.info) AS movie_votes,
min(n.name) AS male_writer,
min(t.title) AS violent_movie_title
FROM cast_info AS ci,
info_type AS it2,
movie_info AS mi,
movie_info_idx AS mi_idx,
movie_keyword AS mk,
name AS n,
title AS t,
kind_type AS kt,
movie_companies AS mc,
char_name AS cn,
keyword AS k
WHERE (ci.note IN ('(writer)', '(head writer)', '(written by)', '(story)', '(story editor)') AND it2.info = 'votes' AND mi.info = 'Horror' AND n.gender = 'm' AND kt.kind IN ('movie', 'episode') AND mc.note LIKE '%(200%)%' AND mc.note LIKE '%(200%)%' AND k.keyword = 'character-name-in-title' AND t.id = mi.movie_id AND t.id = mi_idx.movie_id AND t.id = ci.movie_id AND t.id = mk.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND ci.movie_id = mk.movie_id AND mi.movie_id = mi_idx.movie_id AND mi.movie_id = mk.movie_id AND mi_idx.movie_id = mk.movie_id AND n.id = ci.person_id AND it2.id = mi_idx.info_type_id AND kt.id = t.kind_id AND t.id = mc.movie_id AND mk.movie_id = mc.movie_id AND mi.movie_id = mc.movie_id AND mc.movie_id = mi_idx.movie_id AND mc.movie_id = ci.movie_id AND cn.id = ci.person_role_id AND cn.id = mc.company_id AND mk.keyword_id = k.id AND mc.company_id = ci.person_role_id)

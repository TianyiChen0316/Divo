--{"gen": "combine", "time": "/", "template": "generated-5ba2f083-ae3a-46d8-b512-bdfea1df73cd", "dataset": "full_job", "rows": null}
SELECT min(mi.info) AS movie_budget,
min(mi_idx.info) AS movie_votes,
min(n.name) AS male_writer,
min(t.title) AS violent_movie_title
FROM cast_info AS ci,
info_type AS it1,
info_type AS it2,
keyword AS k,
movie_info AS mi,
movie_info_idx AS mi_idx,
movie_keyword AS mk,
name AS n,
title AS t,
company_name AS cn,
kind_type AS kt,
movie_companies AS mc,
link_type AS lt,
movie_link AS ml,
aka_name AS an1,
name AS n1,
char_name AS chn
WHERE (ci.note IN ('(writer)', '(head writer)', '(written by)', '(story)', '(story editor)') AND it1.info = 'genres' AND it2.info = 'votes' AND k.keyword IN ('murder', 'blood', 'gore', 'death', 'female-nudity') AND mi.info = 'Horror' AND n.gender = 'm' AND cn.country_code <> '[us]' AND kt.kind IN ('movie', 'episode') AND mc.note NOT LIKE '%(USA)%' AND mc.note LIKE '%(200%)%' AND t.id = mi.movie_id AND t.id = mi_idx.movie_id AND t.id = ci.movie_id AND t.id = mk.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND ci.movie_id = mk.movie_id AND mi.movie_id = mi_idx.movie_id AND mi.movie_id = mk.movie_id AND mi_idx.movie_id = mk.movie_id AND n.id = ci.person_id AND it1.id = mi.info_type_id AND it2.id = mi_idx.info_type_id AND k.id = mk.keyword_id AND kt.id = t.kind_id AND t.id = mc.movie_id AND mk.movie_id = mc.movie_id AND mi.movie_id = mc.movie_id AND mc.movie_id = mi_idx.movie_id AND cn.id = mc.company_id AND mc.movie_id = ci.movie_id AND lt.id = ml.link_type_id AND mk.movie_id = ml.movie_id AND an1.person_id = n1.id AND n1.id = ci.person_id AND an1.person_id = ci.person_id AND ml.movie_id = mc.movie_id AND ml.movie_id = ci.movie_id AND chn.id = ci.person_role_id AND t.id = ml.movie_id AND ml.movie_id = mi.movie_id AND ml.movie_id = mi_idx.movie_id AND an1.person_id = n.id AND n.id = n1.id)

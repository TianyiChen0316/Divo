--{"gen": "erase", "time": "/", "template": "generated-09f623e7-a3e1-4538-8bcd-b826f182f0a9", "dataset": "full_job", "rows": null}
SELECT min(chn.name) AS character,
min(t.title) AS russian_mov_with_actor_producer
FROM char_name AS chn,
cast_info AS ci,
company_type AS ct,
movie_companies AS mc,
title AS t,
movie_info AS mi,
movie_info_idx AS mi_idx,
movie_keyword AS mk,
info_type AS it,
complete_cast AS cc,
comp_cast_type AS cct2,
movie_link AS ml,
info_type AS it1,
info_type AS it2,
keyword AS k,
name AS n
WHERE (ci.note LIKE '%(producer)%' AND t.production_year > 2003 AND mi.info IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Denish', 'Norwegian', 'German', 'USA', 'American') AND mi_idx.info > '9.0' AND it.info = 'height' AND cct2.kind LIKE '%complete%' AND it1.info = 'votes' AND it2.info = 'votes' AND k.keyword IN ('murder', 'blood', 'gore', 'death', 'female-nudity') AND n.gender = 'm' AND t.id = mc.movie_id AND t.id = ci.movie_id AND ci.movie_id = mc.movie_id AND chn.id = ci.person_role_id AND ct.id = mc.company_type_id AND t.id = mi.movie_id AND t.id = mk.movie_id AND t.id = mi_idx.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND mc.movie_id = mk.movie_id AND mc.movie_id = mi.movie_id AND mc.movie_id = mi_idx.movie_id AND ci.movie_id = mk.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND it.id = mi_idx.info_type_id AND t.id = cc.movie_id AND ci.movie_id = cc.movie_id AND cct2.id = cc.status_id AND cc.movie_id = mk.movie_id AND cc.movie_id = mi_idx.movie_id AND ml.movie_id = t.id AND ml.movie_id = mk.movie_id AND ml.movie_id = mc.movie_id AND ml.movie_id = ci.movie_id AND ml.movie_id = cc.movie_id AND ml.movie_id = mi_idx.movie_id AND mc.movie_id = cc.movie_id AND ml.movie_id = mi.movie_id AND cc.movie_id = mi.movie_id AND n.id = ci.person_id AND it1.id = mi.info_type_id AND it2.id = mi_idx.info_type_id AND k.id = mk.keyword_id AND it2.id = it.id)

--{"gen": "combine", "time": "/", "template": "generated-972c8475-d534-452c-a739-0b8eefdc0df3", "dataset": "full_job", "rows": null}
SELECT min(t.title) AS movie_title
FROM movie_info AS mi,
movie_keyword AS mk,
title AS t,
complete_cast AS cc,
cast_info AS ci,
info_type AS it2,
movie_info_idx AS mi_idx,
name AS n,
company_type AS ct,
movie_companies AS mc,
movie_info_idx AS mii,
person_info AS pi
WHERE (mi.info IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Denish', 'Norwegian', 'German') AND t.production_year > 2005 AND ci.note IN ('(writer)', '(head writer)', '(written by)', '(story)', '(story editor)') AND it2.info = 'votes' AND n.gender = 'f' AND ct.kind = 'production companies' AND mc.note LIKE '%(USA)%' AND mc.note LIKE '%(France)%' AND pi.info ILIKE '%199%' AND (mii.info ILIKE '8%' OR mii.info ILIKE '9%' OR mii.info ILIKE '10%') AND t.id = mi.movie_id AND t.id = mk.movie_id AND mk.movie_id = mi.movie_id AND t.id = mi_idx.movie_id AND t.id = ci.movie_id AND t.id = cc.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND ci.movie_id = mk.movie_id AND ci.movie_id = cc.movie_id AND mi.movie_id = mi_idx.movie_id AND mi.movie_id = cc.movie_id AND mi_idx.movie_id = mk.movie_id AND mi_idx.movie_id = cc.movie_id AND mk.movie_id = cc.movie_id AND n.id = ci.person_id AND it2.id = mi_idx.info_type_id AND t.id = mc.movie_id AND mc.movie_id = mi.movie_id AND ct.id = mc.company_type_id AND t.id = mii.movie_id AND mii.movie_id = ci.movie_id AND n.id = pi.person_id AND ci.person_id = pi.person_id AND mc.movie_id = ci.movie_id AND mc.movie_id = mii.movie_id AND mi.movie_id = mii.movie_id AND mc.movie_id = cc.movie_id AND mc.movie_id = mk.movie_id AND mc.movie_id = mi_idx.movie_id AND cc.movie_id = mii.movie_id AND mk.movie_id = mii.movie_id AND mi_idx.movie_id = mii.movie_id)

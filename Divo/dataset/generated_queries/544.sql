--{"gen": "combine", "time": "/", "template": "generated-2c7239f9-7c9f-4db9-826c-ecf5e3813c63", "dataset": "full_job", "rows": null}
SELECT min(mi.info) AS movie_budget,
min(mi_idx.info) AS movie_votes,
min(n.name) AS male_writer
FROM cast_info AS ci,
info_type AS it1,
info_type AS it2,
keyword AS k,
movie_info AS mi,
movie_info_idx AS mi_idx,
movie_keyword AS mk,
name AS n,
person_info AS pi,
aka_name AS an,
info_type AS it,
movie_companies AS mc,
role_type AS rt,
company_name AS cn,
company_type AS ct,
title AS t
WHERE (ci.note IN ('(writer)', '(head writer)', '(written by)', '(story)', '(story editor)') AND it1.info = 'genres' AND it2.info = 'votes' AND k.keyword IN ('murder', 'blood', 'gore', 'death', 'female-nudity') AND mi.info = 'Horror' AND n.gender = 'm' AND pi.info ILIKE '%usa%' AND it.info = 'countries' AND rt.role = 'actress' AND cn.country_code = '[us]' AND ct.kind = 'production companies' AND t.production_year BETWEEN 2000 AND 2010 AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND ci.movie_id = mk.movie_id AND mi.movie_id = mi_idx.movie_id AND mi.movie_id = mk.movie_id AND mi_idx.movie_id = mk.movie_id AND n.id = ci.person_id AND it1.id = mi.info_type_id AND it2.id = mi_idx.info_type_id AND k.id = mk.keyword_id AND pi.person_id = n.id AND pi.person_id = ci.person_id AND pi.info_type_id = it2.id AND mc.movie_id = ci.movie_id AND mc.movie_id = mi.movie_id AND it.id = mi.info_type_id AND rt.id = ci.role_id AND n.id = an.person_id AND ci.person_id = an.person_id AND it1.id = it.id AND pi.person_id = an.person_id AND mc.movie_id = mk.movie_id AND mc.movie_id = mi_idx.movie_id AND mi_idx.info_type_id = pi.info_type_id AND t.id = mi.movie_id AND t.id = mi_idx.movie_id AND t.id = mc.movie_id AND ct.id = mc.company_type_id AND cn.id = mc.company_id AND t.id = ci.movie_id AND t.id = mk.movie_id)

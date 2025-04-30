--{"gen": "combine", "time": "/", "template": "generated-396672eb-ce37-4353-b63c-456690601b35", "dataset": "full_job", "rows": null}
SELECT min(cn.name) AS movie_company,
min(mi_idx.info) AS rating,
min(t.title) AS western_violent_movie
FROM company_name AS cn,
company_type AS ct,
keyword AS k,
kind_type AS kt,
movie_companies AS mc,
movie_info AS mi,
movie_info_idx AS mi_idx,
movie_keyword AS mk,
title AS t,
cast_info AS ci,
role_type AS rt,
aka_name AS an,
link_type AS lt,
movie_link AS ml,
person_info AS pi
WHERE (cn.country_code <> '[us]' AND k.keyword IN ('murder', 'murder-in-title', 'blood', 'violence') AND kt.kind IN ('movie', 'episode') AND mc.note NOT LIKE '%(USA)%' AND mc.note NOT LIKE '%(as Metro-Goldwyn-Mayer Pictures)%' AND mi.info IN ('Germany', 'German', 'USA', 'American') AND mi_idx.info < '7.0' AND t.production_year > 2008 AND ci.note = '(voice: English version)' AND rt.role = 'actor' AND lt.link = 'features' AND pi.note = 'Volker Boehm' AND kt.id = t.kind_id AND t.id = mi.movie_id AND t.id = mk.movie_id AND t.id = mi_idx.movie_id AND t.id = mc.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = mi_idx.movie_id AND mk.movie_id = mc.movie_id AND mi.movie_id = mi_idx.movie_id AND mi.movie_id = mc.movie_id AND mc.movie_id = mi_idx.movie_id AND k.id = mk.keyword_id AND ct.id = mc.company_type_id AND cn.id = mc.company_id AND ci.role_id = rt.id AND ci.movie_id = mc.movie_id AND ci.movie_id = mk.movie_id AND t.id = ci.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND an.person_id = ci.person_id AND ml.linked_movie_id = t.id AND lt.id = ml.link_type_id AND pi.person_id = an.person_id AND pi.person_id = ci.person_id AND ci.movie_id = ml.linked_movie_id AND mk.movie_id = ml.linked_movie_id AND mi.movie_id = ml.linked_movie_id AND mi.info_type_id = pi.info_type_id AND mc.movie_id = ml.linked_movie_id AND ml.linked_movie_id = mi_idx.movie_id)

--{"gen": "combine", "time": "/", "template": "generated-756fafbb-c97e-41df-bea4-6ef4e8ef7f5b", "dataset": "full_job", "rows": null}
SELECT min(mi_idx.info) AS rating,
min(t.title) AS northern_dark_movie
FROM info_type AS it1,
info_type AS it2,
keyword AS k,
kind_type AS kt,
movie_info AS mi,
movie_info_idx AS mi_idx,
movie_keyword AS mk,
title AS t,
company_name AS cn,
movie_companies AS mc,
movie_info_idx AS miidx,
aka_name AS an,
char_name AS chn,
cast_info AS ci,
name AS n,
role_type AS rt
WHERE (it1.info = 'countries' AND it2.info = 'rating' AND k.keyword IN ('murder', 'murder-in-title', 'blood', 'violence') AND kt.kind = 'movie' AND mi.info IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Denish', 'Norwegian', 'German', 'USA', 'American') AND mi_idx.info < '8.5' AND t.production_year > 2010 AND cn.country_code = '[us]' AND ci.note IN ('(voice)', '(voice: Japanese version)', '(voice) (uncredited)', '(voice: English version)') AND n.gender = 'f' AND n.name LIKE '%An%' AND rt.role = 'actress' AND kt.id = t.kind_id AND t.id = mi.movie_id AND t.id = mk.movie_id AND t.id = mi_idx.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND k.id = mk.keyword_id AND it1.id = mi.info_type_id AND it2.id = mi_idx.info_type_id AND mc.movie_id = t.id AND cn.id = mc.company_id AND miidx.movie_id = t.id AND mi.movie_id = miidx.movie_id AND mi.movie_id = mc.movie_id AND miidx.movie_id = mc.movie_id AND miidx.movie_id = mk.movie_id AND miidx.movie_id = mi_idx.movie_id AND mc.movie_id = mk.movie_id AND mc.movie_id = mi_idx.movie_id AND t.id = ci.movie_id AND mc.movie_id = ci.movie_id AND mi.movie_id = ci.movie_id AND n.id = ci.person_id AND rt.id = ci.role_id AND n.id = an.person_id AND ci.person_id = an.person_id AND chn.id = ci.person_role_id AND miidx.movie_id = ci.movie_id AND ci.movie_id = mk.movie_id AND ci.movie_id = mi_idx.movie_id)

--{"gen": "combine", "time": "/", "template": "generated-47fe4f1a-dd48-4aa5-ade4-11273acfb5e9", "dataset": "full_job", "rows": null}
SELECT min(mc.note) AS production_note,
min(t.title) AS movie_title,
min(t.production_year) AS movie_year
FROM movie_companies AS mc,
title AS t,
company_name AS cn,
movie_keyword AS mk,
complete_cast AS cc,
comp_cast_type AS cct2,
cast_info AS ci,
keyword AS k,
kind_type AS kt,
name AS n,
aka_title AS at,
company_type AS ct,
info_type AS it1,
movie_info AS mi,
aka_name AS an,
char_name AS chn,
role_type AS rt
WHERE (mc.note LIKE '%(Japan)%' AND t.production_year BETWEEN 2005 AND 2010 AND cn.country_code = '[ru]' AND cct2.kind LIKE '%complete%' AND k.keyword IN ('superhero', 'sequel', 'second-part', 'marvel-comics', 'based-on-comic', 'tv-special', 'fight', 'violence') AND kt.kind = 'movie' AND it1.info = 'release dates' AND mi.note LIKE '%internet%' AND rt.role = 'actress' AND t.id = mc.movie_id AND cn.id = mc.company_id AND t.id = mk.movie_id AND mc.movie_id = mk.movie_id AND kt.id = t.kind_id AND t.id = ci.movie_id AND t.id = cc.movie_id AND mk.movie_id = ci.movie_id AND mk.movie_id = cc.movie_id AND ci.movie_id = cc.movie_id AND n.id = ci.person_id AND k.id = mk.keyword_id AND cct2.id = cc.status_id AND mc.movie_id = ci.movie_id AND mc.movie_id = cc.movie_id AND t.id = at.movie_id AND t.id = mi.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = at.movie_id AND mi.movie_id = mc.movie_id AND mi.movie_id = at.movie_id AND mc.movie_id = at.movie_id AND it1.id = mi.info_type_id AND ct.id = mc.company_type_id AND at.movie_id = ci.movie_id AND at.movie_id = cc.movie_id AND ci.movie_id = mi.movie_id AND cc.movie_id = mi.movie_id AND ci.role_id = rt.id AND chn.id = ci.person_role_id AND an.person_id = n.id AND an.person_id = ci.person_id)

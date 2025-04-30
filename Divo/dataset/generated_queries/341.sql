--{"gen": "combine", "time": "/", "template": "generated-bb98c846-0544-4acc-96f5-a7049983fe72", "dataset": "full_job", "rows": null}
SELECT min(kt.kind) AS movie_kind,
min(t.title) AS complete_us_internet_movie
FROM complete_cast AS cc,
comp_cast_type AS cct1,
company_name AS cn,
company_type AS ct,
keyword AS k,
kind_type AS kt,
movie_companies AS mc,
movie_info AS mi,
movie_keyword AS mk,
title AS t,
aka_name AS an,
char_name AS chn,
cast_info AS ci,
name AS n,
movie_info_idx AS mi_idx,
info_type AS it,
role_type AS rt
WHERE (cct1.kind = 'complete+verified' AND cn.country_code = '[us]' AND kt.kind IN ('movie') AND mi.note LIKE '%internet%' AND mi.info IS NOT NULL AND (mi.info LIKE 'USA:% 199%' OR mi.info LIKE 'USA:% 200%') AND t.production_year BETWEEN 2006 AND 2007 AND ci.note IN ('(voice)', '(voice: Japanese version)', '(voice) (uncredited)', '(voice: English version)') AND n.name LIKE 'Z%' AND mi_idx.info > '2.0' AND it.info = 'release dates' AND rt.role = 'actress' AND kt.id = t.kind_id AND t.id = mi.movie_id AND t.id = mk.movie_id AND t.id = mc.movie_id AND t.id = cc.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = mc.movie_id AND mk.movie_id = cc.movie_id AND mi.movie_id = mc.movie_id AND mi.movie_id = cc.movie_id AND mc.movie_id = cc.movie_id AND k.id = mk.keyword_id AND cn.id = mc.company_id AND ct.id = mc.company_type_id AND cct1.id = cc.status_id AND t.id = ci.movie_id AND mc.movie_id = ci.movie_id AND mi.movie_id = ci.movie_id AND ci.person_id = an.person_id AND chn.id = ci.person_role_id AND n.id = ci.person_id AND ci.movie_id = mk.movie_id AND n.id = an.person_id AND ci.movie_id = cc.movie_id AND t.id = mi_idx.movie_id AND mk.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND mc.movie_id = mi_idx.movie_id AND ci.movie_id = mi_idx.movie_id AND cc.movie_id = mi_idx.movie_id AND it.id = mi.info_type_id AND rt.id = ci.role_id)

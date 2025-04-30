--{"gen": "combine", "time": "/", "template": "generated-73ac98f1-3f43-43ed-a1eb-ae9b403ef1eb", "dataset": "full_job", "rows": null}
SELECT min(mc.note) AS production_note,
min(t.title) AS movie_title,
min(t.production_year) AS movie_year
FROM company_type AS ct,
movie_companies AS mc,
title AS t,
cast_info AS ci,
keyword AS k,
movie_keyword AS mk,
company_name AS cn,
complete_cast AS cc,
comp_cast_type AS cct2,
char_name AS chn,
movie_info_idx AS mi_idx,
comp_cast_type AS cct1,
kind_type AS kt,
name AS n
WHERE (ct.kind = 'production companies' AND mc.note NOT LIKE '%(as Metro-Goldwyn-Mayer Pictures)%' AND t.production_year > 2008 AND ci.note LIKE '%(voice)%' AND ci.note LIKE '%(uncredited)%' AND k.keyword = 'character-name-in-title' AND cct2.kind LIKE '%complete%' AND chn.name IS NOT NULL AND (chn.name LIKE '%man%' OR chn.name LIKE '%Man%') AND mi_idx.info > '8.0' AND cct1.kind = 'cast' AND kt.kind = 'movie' AND ct.id = mc.company_type_id AND t.id = mc.movie_id AND t.id = ci.movie_id AND ci.movie_id = mc.movie_id AND t.id = mk.movie_id AND mk.keyword_id = k.id AND ci.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id AND mc.company_id = cn.id AND t.id = cc.movie_id AND t.id = mi_idx.movie_id AND mk.movie_id = cc.movie_id AND mk.movie_id = mi_idx.movie_id AND ci.movie_id = cc.movie_id AND ci.movie_id = mi_idx.movie_id AND cc.movie_id = mi_idx.movie_id AND chn.id = ci.person_role_id AND cct2.id = cc.status_id AND mc.movie_id = cc.movie_id AND mc.movie_id = mi_idx.movie_id AND kt.id = t.kind_id AND n.id = ci.person_id AND cct1.id = cc.subject_id)

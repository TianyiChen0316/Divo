--{"gen": "combine", "time": "/", "template": "generated-1d783fdb-c8d4-4b5c-9958-60e6dcdfdaf3", "dataset": "full_job", "rows": null}
SELECT min(n.name) AS member_in_charnamed_movie,
min(n.name) AS a1
FROM cast_info AS ci,
company_name AS cn,
keyword AS k,
movie_companies AS mc,
movie_keyword AS mk,
name AS n,
title AS t,
complete_cast AS cc,
comp_cast_type AS cct2,
char_name AS chn,
movie_info_idx AS mi_idx
WHERE (k.keyword = 'character-name-in-title' AND n.name LIKE 'Z%' AND cct2.kind LIKE '%complete%' AND chn.name IS NOT NULL AND (chn.name LIKE '%man%' OR chn.name LIKE '%Man%') AND mi_idx.info > '8.0' AND n.id = ci.person_id AND ci.movie_id = t.id AND t.id = mk.movie_id AND mk.keyword_id = k.id AND t.id = mc.movie_id AND mc.company_id = cn.id AND ci.movie_id = mc.movie_id AND ci.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id AND t.id = cc.movie_id AND t.id = mi_idx.movie_id AND mk.movie_id = cc.movie_id AND mk.movie_id = mi_idx.movie_id AND ci.movie_id = cc.movie_id AND ci.movie_id = mi_idx.movie_id AND cc.movie_id = mi_idx.movie_id AND chn.id = ci.person_role_id AND cct2.id = cc.status_id AND mc.movie_id = cc.movie_id AND mc.movie_id = mi_idx.movie_id)

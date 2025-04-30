--{"gen": "combine", "time": "/", "template": "generated-9f227832-3139-453a-9ece-ca9aad7d007e", "dataset": "full_job", "rows": null}
SELECT min(t.title) AS movie_title
FROM cast_info AS ci,
movie_companies AS mc,
title AS t,
movie_info AS mi,
movie_info_idx AS mi_idx,
movie_keyword AS mk,
company_type AS ct,
movie_info_idx AS miidx,
complete_cast AS cc,
comp_cast_type AS cct2,
char_name AS chn,
keyword AS k
WHERE (mi.info IN ('Drama', 'Horror', 'Western', 'Family') AND mi_idx.info > '7.0' AND ct.kind = 'production companies' AND cct2.kind LIKE '%complete%' AND chn.name IS NOT NULL AND (chn.name LIKE '%man%' OR chn.name LIKE '%Man%') AND k.keyword LIKE '%sequel%' AND ci.movie_id = t.id AND t.id = mc.movie_id AND ci.movie_id = mc.movie_id AND t.id = mi.movie_id AND t.id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND mi.movie_id = mc.movie_id AND mi_idx.movie_id = mc.movie_id AND t.id = mk.movie_id AND mk.movie_id = mi.movie_id AND mc.movie_id = mk.movie_id AND mk.movie_id = mi_idx.movie_id AND ct.id = mc.company_type_id AND miidx.movie_id = t.id AND mi.movie_id = miidx.movie_id AND miidx.movie_id = mc.movie_id AND miidx.movie_id = mk.movie_id AND miidx.movie_id = mi_idx.movie_id AND t.id = cc.movie_id AND mk.movie_id = ci.movie_id AND mk.movie_id = cc.movie_id AND ci.movie_id = cc.movie_id AND ci.movie_id = mi_idx.movie_id AND cc.movie_id = mi_idx.movie_id AND chn.id = ci.person_role_id AND cct2.id = cc.status_id AND miidx.movie_id = ci.movie_id AND miidx.movie_id = cc.movie_id AND mc.movie_id = cc.movie_id AND ci.movie_id = mi.movie_id AND cc.movie_id = mi.movie_id AND k.id = mk.keyword_id)

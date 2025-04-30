--{"gen": "combine", "time": "/", "template": "generated-34918eb2-a7de-47fd-a146-b5ff93dad86e", "dataset": "full_job", "rows": null}
SELECT min(n.name) AS member_in_charnamed_movie,
min(n.name) AS a1
FROM cast_info AS ci,
company_name AS cn,
movie_companies AS mc,
movie_keyword AS mk,
name AS n,
title AS t,
company_type AS ct,
info_type AS it1,
kind_type AS kt,
movie_info AS mi,
movie_info_idx AS mi_idx
WHERE (n.name LIKE 'X%' AND it1.info = 'height' AND kt.kind IN ('movie', 'episode') AND mi.info IN ('Germany', 'German', 'USA', 'American') AND mi_idx.info < '7.0' AND n.id = ci.person_id AND ci.movie_id = t.id AND t.id = mk.movie_id AND t.id = mc.movie_id AND mc.company_id = cn.id AND ci.movie_id = mc.movie_id AND ci.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id AND kt.id = t.kind_id AND t.id = mi.movie_id AND t.id = mi_idx.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND mi.movie_id = mc.movie_id AND mc.movie_id = mi_idx.movie_id AND it1.id = mi.info_type_id AND ct.id = mc.company_type_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id)

--{"gen": "combine", "time": "/", "template": "generated-19959b58-aaaf-4326-8b5d-0a26198d8b27", "dataset": "full_job", "rows": null}
SELECT min(cn.name)
FROM cast_info AS ci,
char_name AS cn,
aka_name AS an,
movie_companies AS mc,
movie_keyword AS mk,
keyword AS k,
movie_info AS mi,
movie_info_idx AS mi_idx,
name AS n,
company_type AS ct,
title AS t
WHERE (ci.role_id = 2 AND mc.note IS NOT NULL AND (mc.note LIKE '%(USA)%' OR mc.note LIKE '%(worldwide)%') AND k.keyword IN ('murder', 'violence', 'blood', 'gore', 'death', 'female-nudity', 'hospital') AND mi.info IN ('Horror', 'Thriller') AND n.gender = 'f' AND t.production_year > 2010 AND cn.id = ci.person_role_id AND ci.movie_id = mc.movie_id AND mc.company_id = cn.id AND an.person_id = ci.person_id AND mc.company_id = ci.person_role_id AND mc.movie_id = mk.movie_id AND ci.movie_id = mk.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND mi.movie_id = mk.movie_id AND mi.movie_id = mc.movie_id AND mi_idx.movie_id = mk.movie_id AND mi_idx.movie_id = mc.movie_id AND n.id = ci.person_id AND k.id = mk.keyword_id AND ct.id = mc.company_type_id AND n.id = an.person_id AND t.id = mi.movie_id AND t.id = mk.movie_id AND t.id = mc.movie_id AND t.id = ci.movie_id AND t.id = mi_idx.movie_id)

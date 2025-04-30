--{"gen": "combine", "time": "/", "template": "generated-ad4de19b-5832-4402-a2dc-04a2bc5e5202", "dataset": "full_job", "rows": null}
SELECT *
FROM cast_info AS ci,
company_name AS cn,
keyword AS k,
movie_companies AS mc,
movie_keyword AS mk,
info_type AS it2,
movie_info AS mi,
movie_info_idx AS mi_idx,
aka_name AS an,
role_type AS rt
WHERE (cn.country_code = '[sm]' AND k.keyword = 'character-name-in-title' AND it2.info = 'votes' AND rt.role = 'actress' AND mk.keyword_id = k.id AND mc.company_id = cn.id AND ci.movie_id = mc.movie_id AND ci.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND it2.id = mi_idx.info_type_id AND an.person_id = ci.person_id AND mc.movie_id = mi.movie_id AND mc.movie_id = mi_idx.movie_id AND ci.role_id = rt.id AND mk.movie_id = mi.movie_id AND mk.movie_id = mi_idx.movie_id)

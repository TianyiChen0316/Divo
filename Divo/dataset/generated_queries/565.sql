--{"gen": "erase", "time": "/", "template": "generated-d39a464e-f7b8-4ad1-8cb8-79d833f02106", "dataset": "full_job", "rows": null}
SELECT min(cn.name)
FROM cast_info AS ci,
char_name AS cn,
info_type AS it,
keyword AS k,
movie_info_idx AS mi_idx,
movie_keyword AS mk
WHERE (ci.role_id = 2 AND it.info = 'rating' AND k.keyword LIKE '%sequel%' AND mi_idx.info > '7.0' AND cn.id = ci.person_role_id AND mk.movie_id = mi_idx.movie_id AND k.id = mk.keyword_id AND it.id = mi_idx.info_type_id AND mi_idx.movie_id = ci.movie_id AND ci.movie_id = mk.movie_id)

--{"gen": "combine", "time": "/", "template": "generated-5ca4a485-885f-4121-8864-2b9b421e1cb3", "dataset": "full_job", "rows": null}
SELECT *
FROM cast_info AS ci,
movie_info AS mi,
movie_info_idx AS mi_idx,
movie_keyword AS mk,
aka_name AS an,
char_name AS chn,
company_name AS cn,
info_type AS it,
movie_companies AS mc,
role_type AS rt,
title AS t
WHERE (mi.info IN ('Horror', 'Action', 'Sci-Fi', 'Thriller', 'Crime', 'War') AND cn.country_code = '[ru]' AND it.info = 'bottom 10 rank' AND rt.role = 'actress' AND t.production_year > 2000 AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND ci.movie_id = mk.movie_id AND mi.movie_id = mi_idx.movie_id AND mi.movie_id = mk.movie_id AND mi_idx.movie_id = mk.movie_id AND t.id = mi.movie_id AND t.id = mc.movie_id AND t.id = ci.movie_id AND mc.movie_id = ci.movie_id AND mc.movie_id = mi.movie_id AND cn.id = mc.company_id AND it.id = mi.info_type_id AND rt.id = ci.role_id AND ci.person_id = an.person_id AND chn.id = ci.person_role_id AND t.id = mk.movie_id AND t.id = mi_idx.movie_id AND mc.movie_id = mk.movie_id AND mc.movie_id = mi_idx.movie_id)

--{"gen": "combine", "time": "/", "template": "1b", "dataset": "full_job", "rows": null}
SELECT min(mc.note) AS production_note,
min(t.title) AS movie_title,
min(t.production_year) AS movie_year
FROM company_type AS ct,
info_type AS it,
movie_companies AS mc,
movie_info_idx AS mi_idx,
title AS t,
char_name AS chn,
cast_info AS ci,
company_name AS cn,
role_type AS rt
WHERE (ct.kind = 'production companies' AND it.info = 'bottom 10 rank' AND mc.note NOT LIKE '%(as Metro-Goldwyn-Mayer Pictures)%' AND t.production_year BETWEEN 2005 AND 2010 AND ci.note LIKE '%(uncredited)%' AND cn.country_code = '[ru]' AND rt.role = 'writer' AND ct.id = mc.company_type_id AND t.id = mc.movie_id AND t.id = mi_idx.movie_id AND mc.movie_id = mi_idx.movie_id AND it.id = mi_idx.info_type_id AND t.id = ci.movie_id AND ci.movie_id = mc.movie_id AND chn.id = ci.person_role_id AND rt.id = ci.role_id AND cn.id = mc.company_id AND ci.movie_id = mi_idx.movie_id)

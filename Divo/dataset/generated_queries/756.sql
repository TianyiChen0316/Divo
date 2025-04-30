--{"gen": "combine", "time": "/", "template": "generated-19e401ab-6688-46a3-8f56-7e75cfe29e8c", "dataset": "full_job", "rows": null}
SELECT min(mc.note) AS production_note,
min(t.title) AS movie_title,
min(t.production_year) AS movie_year
FROM movie_companies AS mc,
movie_info_idx AS mi_idx,
title AS t,
company_name AS cn,
keyword AS k,
movie_keyword AS mk,
cast_info AS ci,
role_type AS rt
WHERE (mc.note NOT LIKE '%(as Metro-Goldwyn-Mayer Pictures)%' AND mc.note LIKE '%(France)%' AND t.production_year > 2010 AND cn.country_code = '[sm]' AND k.keyword = 'character-name-in-title' AND ci.note = '(voice: English version)' AND rt.role = 'actress' AND t.id = mc.movie_id AND t.id = mi_idx.movie_id AND mc.movie_id = mi_idx.movie_id AND cn.id = mc.company_id AND t.id = mk.movie_id AND mk.keyword_id = k.id AND mc.movie_id = mk.movie_id AND ci.movie_id = t.id AND ci.role_id = rt.id AND ci.movie_id = mc.movie_id AND ci.movie_id = mk.movie_id AND ci.movie_id = mi_idx.movie_id AND mk.movie_id = mi_idx.movie_id)

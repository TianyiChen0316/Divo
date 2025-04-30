--{"gen": "erase", "time": "/", "template": "generated-96d4832d-5d01-4872-aae0-93dd2ccdc889", "dataset": "full_job", "rows": null}
SELECT min(mc.note) AS production_note
FROM movie_companies AS mc,
movie_info_idx AS mi_idx,
aka_title AS at,
movie_info AS mi,
movie_keyword AS mk,
cast_info AS ci,
company_name AS cn,
role_type AS rt
WHERE (mc.note NOT LIKE '%(as Metro-Goldwyn-Mayer Pictures)%' AND mi.note LIKE '%internet%' AND mi.info IS NOT NULL AND (mi.info LIKE 'USA:% 199%' OR mi.info LIKE 'USA:% 200%') AND ci.note = '(voice: English version)' AND cn.country_code = '[us]' AND rt.role = 'actress' AND mc.movie_id = mi_idx.movie_id AND mc.movie_id = at.movie_id AND mc.movie_id = mk.movie_id AND mc.movie_id = mi.movie_id AND at.movie_id = mk.movie_id AND at.movie_id = mi.movie_id AND at.movie_id = mi_idx.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND mc.movie_id = ci.movie_id AND mi.movie_id = ci.movie_id AND cn.id = mc.company_id AND rt.id = ci.role_id AND at.movie_id = ci.movie_id AND ci.movie_id = mk.movie_id AND ci.movie_id = mi_idx.movie_id)

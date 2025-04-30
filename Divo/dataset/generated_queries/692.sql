--{"gen": "combine", "time": "/", "template": "generated-96d4832d-5d01-4872-aae0-93dd2ccdc889", "dataset": "full_job", "rows": null}
SELECT min(mc.note) AS production_note
FROM info_type AS it,
movie_companies AS mc,
movie_info_idx AS mi_idx,
aka_title AS at,
movie_info AS mi,
movie_keyword AS mk,
aka_name AS an,
char_name AS chn,
cast_info AS ci,
company_name AS cn,
name AS n,
role_type AS rt,
company_type AS ct,
title AS t
WHERE (it.info = 'bottom 10 rank' AND mc.note NOT LIKE '%(as Metro-Goldwyn-Mayer Pictures)%' AND mi.note LIKE '%internet%' AND mi.info IS NOT NULL AND (mi.info LIKE 'USA:% 199%' OR mi.info LIKE 'USA:% 200%') AND ci.note = '(voice)' AND cn.country_code = '[hk]' AND n.gender = 'f' AND n.name LIKE '%Angel%' AND rt.role = 'actress' AND t.production_year > 2010 AND mc.movie_id = mi_idx.movie_id AND it.id = mi_idx.info_type_id AND mc.movie_id = at.movie_id AND mc.movie_id = mk.movie_id AND mc.movie_id = mi.movie_id AND at.movie_id = mk.movie_id AND at.movie_id = mi.movie_id AND at.movie_id = mi_idx.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND mc.movie_id = ci.movie_id AND mi.movie_id = ci.movie_id AND cn.id = mc.company_id AND n.id = ci.person_id AND rt.id = ci.role_id AND n.id = an.person_id AND ci.person_id = an.person_id AND chn.id = ci.person_role_id AND at.movie_id = ci.movie_id AND ci.movie_id = mk.movie_id AND ci.movie_id = mi_idx.movie_id AND t.id = mc.movie_id AND t.id = ci.movie_id AND ct.id = mc.company_type_id AND t.id = at.movie_id AND t.id = mk.movie_id AND t.id = mi.movie_id AND t.id = mi_idx.movie_id)

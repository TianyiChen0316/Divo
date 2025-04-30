--{"gen": "combine", "time": "/", "template": "generated-abc44c9d-1d7e-4b9e-91b4-148438bcc621", "dataset": "full_job", "rows": null}
SELECT min(chn.name) AS uncredited_voiced_character,
min(t.title) AS russian_movie
FROM char_name AS chn,
cast_info AS ci,
movie_companies AS mc,
title AS t,
company_name AS cn,
movie_keyword AS mk,
name AS n,
movie_info AS mi,
movie_info_idx AS mi_idx,
company_type AS ct,
movie_info_idx AS miidx
WHERE (ci.note LIKE '%(voice)%' AND ci.note NOT LIKE '%(voice)%' AND t.production_year > 2003 AND cn.country_code = '[de]' AND mi.info IN ('Drama', 'Horror', 'Western', 'Family') AND mi_idx.info < '3.5' AND ct.kind = 'production companies' AND t.id = mc.movie_id AND t.id = ci.movie_id AND ci.movie_id = mc.movie_id AND chn.id = ci.person_role_id AND n.id = ci.person_id AND t.id = mk.movie_id AND mc.company_id = cn.id AND ci.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id AND t.id = mi.movie_id AND t.id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND mi.movie_id = mc.movie_id AND mi_idx.movie_id = mc.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = mi_idx.movie_id AND ct.id = mc.company_type_id AND miidx.movie_id = t.id AND mi.movie_id = miidx.movie_id AND miidx.movie_id = mc.movie_id AND miidx.movie_id = mk.movie_id AND miidx.movie_id = mi_idx.movie_id AND miidx.movie_id = ci.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id)

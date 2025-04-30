--{"gen": "combine", "time": "/", "template": "generated-11e68ab7-ec88-4811-aff9-bd32824ecc04", "dataset": "full_job", "rows": null}
SELECT min(mi_idx.info) AS rating
FROM movie_companies AS mc,
movie_info AS mi,
movie_info_idx AS mi_idx,
movie_keyword AS mk,
aka_name AS an,
char_name AS chn,
cast_info AS ci,
company_name AS cn,
name AS n,
role_type AS rt,
title AS t
WHERE (mi.info IN ('Drama', 'Horror', 'Western', 'Family') AND mi_idx.info > '7.0' AND ci.note IN ('(voice)', '(voice: Japanese version)', '(voice) (uncredited)', '(voice: English version)') AND cn.country_code = '[us]' AND n.gender = 'f' AND n.name LIKE '%An%' AND rt.role = 'costume designer' AND t.production_year BETWEEN 2007 AND 2010 AND mi.movie_id = mi_idx.movie_id AND mi.movie_id = mc.movie_id AND mi_idx.movie_id = mc.movie_id AND mk.movie_id = mi.movie_id AND mc.movie_id = mk.movie_id AND mk.movie_id = mi_idx.movie_id AND ci.movie_id = mc.movie_id AND mc.company_id = cn.id AND ci.role_id = rt.id AND n.id = ci.person_id AND chn.id = ci.person_role_id AND an.person_id = n.id AND an.person_id = ci.person_id AND ci.movie_id = mk.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND ci.movie_id = t.id AND t.id = mc.movie_id AND t.id = mk.movie_id AND t.id = mi.movie_id AND t.id = mi_idx.movie_id)

--{"gen": "combine", "time": "/", "template": "generated-1b27d0ea-9c6c-4d53-8809-f880772010b8", "dataset": "full_job", "rows": null}
SELECT min(mi_idx.info) AS rating,
min(t.title) AS movie_title
FROM keyword AS k,
movie_info_idx AS mi_idx,
movie_keyword AS mk,
title AS t,
movie_companies AS mc,
movie_info AS mi,
aka_name AS an,
cast_info AS ci,
company_name AS cn,
name AS n,
role_type AS rt
WHERE (k.keyword LIKE '%sequel%' AND mi_idx.info > '5.0' AND t.production_year > 2005 AND mi.info IN ('Drama', 'Horror', 'Western', 'Family') AND ci.note IN ('(voice)', '(voice: Japanese version)', '(voice) (uncredited)', '(voice: English version)') AND cn.country_code = '[us]' AND n.gender = 'm' AND n.name LIKE '%An%' AND rt.role = 'actress' AND t.id = mi_idx.movie_id AND t.id = mk.movie_id AND mk.movie_id = mi_idx.movie_id AND k.id = mk.keyword_id AND t.id = mi.movie_id AND t.id = mc.movie_id AND mc.movie_id = mk.movie_id AND mc.movie_id = mi.movie_id AND mc.movie_id = mi_idx.movie_id AND mk.movie_id = mi.movie_id AND mi.movie_id = mi_idx.movie_id AND t.id = ci.movie_id AND mc.movie_id = ci.movie_id AND mi.movie_id = ci.movie_id AND cn.id = mc.company_id AND n.id = ci.person_id AND rt.id = ci.role_id AND n.id = an.person_id AND ci.person_id = an.person_id AND ci.movie_id = mk.movie_id AND ci.movie_id = mi_idx.movie_id)

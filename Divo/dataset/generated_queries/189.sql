--{"gen": "combine", "time": "/", "template": "generated-e822072c-fedc-4d47-9036-682e88451987", "dataset": "full_job", "rows": null}
SELECT min(at.title) AS aka_title,
min(t.title) AS internet_movie_title
FROM aka_title AS at,
company_type AS ct,
info_type AS it1,
keyword AS k,
movie_companies AS mc,
movie_info AS mi,
movie_keyword AS mk,
title AS t,
info_type AS it,
movie_info_idx AS mi_idx,
aka_name AS an,
cast_info AS ci,
name AS n,
char_name AS chn,
role_type AS rt
WHERE (it1.info = 'release dates' AND mi.note LIKE '%internet%' AND t.production_year > 1990 AND it.info = 'rating' AND mi_idx.info > '5.0' AND ci.note IN ('(voice)', '(voice: Japanese version)', '(voice) (uncredited)', '(voice: English version)') AND n.gender = 'f' AND n.name LIKE '%An%' AND rt.role = 'writer' AND t.id = at.movie_id AND t.id = mi.movie_id AND t.id = mk.movie_id AND t.id = mc.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = mc.movie_id AND mk.movie_id = at.movie_id AND mi.movie_id = mc.movie_id AND mi.movie_id = at.movie_id AND mc.movie_id = at.movie_id AND k.id = mk.keyword_id AND it1.id = mi.info_type_id AND ct.id = mc.company_type_id AND t.id = mi_idx.movie_id AND mk.movie_id = mi_idx.movie_id AND it.id = mi_idx.info_type_id AND mc.movie_id = mi_idx.movie_id AND at.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND mc.movie_id = ci.movie_id AND mi.movie_id = ci.movie_id AND n.id = ci.person_id AND n.id = an.person_id AND ci.person_id = an.person_id AND ci.movie_id = mk.movie_id AND t.id = ci.movie_id AND rt.id = ci.role_id AND chn.id = ci.person_role_id AND at.movie_id = ci.movie_id AND ci.movie_id = mi_idx.movie_id)

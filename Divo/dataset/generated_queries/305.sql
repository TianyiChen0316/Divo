--{"gen": "combine", "time": "/", "template": "generated-4e55553e-53ac-44f4-890d-d9971d850e65", "dataset": "full_job", "rows": null}
SELECT min(an.name) AS alternative_name,
min(n.name) AS voicing_actress,
min(t.title) AS american_movie
FROM aka_name AS an,
cast_info AS ci,
company_name AS cn,
movie_companies AS mc,
name AS n,
title AS t,
company_type AS ct,
info_type AS it,
movie_info_idx AS mi_idx
WHERE (ci.note IN ('(voice)', '(voice: Japanese version)', '(voice) (uncredited)', '(voice: English version)') AND cn.country_code = '[nl]' AND n.gender = 'f' AND n.name LIKE '%An%' AND ct.kind = 'production companies' AND it.info = 'countries' AND ci.movie_id = t.id AND t.id = mc.movie_id AND ci.movie_id = mc.movie_id AND mc.company_id = cn.id AND n.id = ci.person_id AND an.person_id = n.id AND an.person_id = ci.person_id AND ct.id = mc.company_type_id AND t.id = mi_idx.movie_id AND mc.movie_id = mi_idx.movie_id AND it.id = mi_idx.info_type_id AND mi_idx.movie_id = ci.movie_id)

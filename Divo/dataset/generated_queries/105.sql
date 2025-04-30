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
keyword AS k,
movie_info AS mi,
movie_keyword AS mk
WHERE (ci.note IN ('(voice)', '(voice: Japanese version)', '(voice) (uncredited)', '(voice: English version)') AND cn.country_code = '[nl]' AND n.gender = 'f' AND n.name LIKE '%An%' AND k.keyword LIKE '%sequel%' AND mi.info IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Denish', 'Norwegian', 'German') AND ci.movie_id = t.id AND t.id = mc.movie_id AND ci.movie_id = mc.movie_id AND mc.company_id = cn.id AND n.id = ci.person_id AND an.person_id = n.id AND an.person_id = ci.person_id AND t.id = mi.movie_id AND t.id = mk.movie_id AND mk.movie_id = mi.movie_id AND k.id = mk.keyword_id AND ci.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id AND mc.movie_id = mi.movie_id AND ci.movie_id = mi.movie_id)

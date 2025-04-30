--{"gen": "combine", "time": "/", "template": "generated-5580b7fa-c9b2-4ddd-893c-8ba6a6b2110e", "dataset": "full_job", "rows": null}
SELECT min(n.name) AS voicing_actress
FROM aka_name AS an,
cast_info AS ci,
company_name AS cn,
movie_companies AS mc,
movie_info AS mi,
name AS n,
link_type AS lt,
movie_keyword AS mk,
movie_link AS ml,
title AS t,
company_type AS ct,
info_type AS it
WHERE (ci.note IN ('(voice)', '(voice: Japanese version)', '(voice) (uncredited)', '(voice: English version)') AND cn.country_code = '[us]' AND mi.info IS NOT NULL AND (mi.info LIKE 'Japan:%200%' OR mi.info LIKE 'USA:%200%') AND n.gender = 'm' AND n.name LIKE '%An%' AND t.production_year BETWEEN 2005 AND 2010 AND ct.kind = 'production companies' AND mc.movie_id = ci.movie_id AND mc.movie_id = mi.movie_id AND mi.movie_id = ci.movie_id AND cn.id = mc.company_id AND n.id = ci.person_id AND n.id = an.person_id AND ci.person_id = an.person_id AND lt.id = ml.link_type_id AND ml.movie_id = t.id AND t.id = mk.movie_id AND t.id = mc.movie_id AND ml.movie_id = mk.movie_id AND ml.movie_id = mc.movie_id AND mk.movie_id = mc.movie_id AND t.id = ci.movie_id AND t.id = mi.movie_id AND ml.movie_id = ci.movie_id AND ml.movie_id = mi.movie_id AND ci.movie_id = mk.movie_id AND mk.movie_id = mi.movie_id AND ct.id = mc.company_type_id AND it.id = mi.info_type_id)

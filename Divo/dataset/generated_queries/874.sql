--{"gen": "erase", "time": "/", "template": "generated-4194a9dc-c76d-48f0-8f78-910408c6d9f2", "dataset": "full_job", "rows": null}
SELECT min(t.title) AS movie_title
FROM keyword AS k,
movie_keyword AS mk,
title AS t,
movie_companies AS mc,
movie_info AS mi,
cast_info AS ci,
name AS n,
person_info AS pi,
company_type AS ct,
link_type AS lt,
movie_link AS ml
WHERE (k.keyword ILIKE '%love%' AND t.production_year > 2005 AND mi.info IN ('Drama', 'Horror', 'Western', 'Family') AND (pi.info ILIKE '%uk%' OR pi.info ILIKE '%spain%' OR pi.info ILIKE '%germany%' OR pi.info ILIKE '%italy%' OR pi.info ILIKE '%croatia%' OR pi.info ILIKE '%algeria%' OR pi.info ILIKE '%south%' OR pi.info ILIKE '%austria%' OR pi.info ILIKE '%hungary%') AND ct.kind = 'production companies' AND lt.link LIKE '%follow%' AND t.id = mk.movie_id AND k.id = mk.keyword_id AND t.id = mi.movie_id AND t.id = mc.movie_id AND mi.movie_id = mc.movie_id AND mk.movie_id = mi.movie_id AND mc.movie_id = mk.movie_id AND t.id = ci.movie_id AND ci.person_id = n.id AND n.id = pi.person_id AND ci.person_id = pi.person_id AND ci.movie_id = mi.movie_id AND mc.movie_id = ci.movie_id AND ci.movie_id = mk.movie_id AND lt.id = ml.link_type_id AND ml.movie_id = t.id AND mc.company_type_id = ct.id AND ml.movie_id = mk.movie_id AND ml.movie_id = mc.movie_id AND ml.movie_id = ci.movie_id AND ml.movie_id = mi.movie_id)

--{"gen": "erase", "time": "/", "template": "generated-f8b4c451-01fe-4bd2-875e-fc7a1abae534", "dataset": "full_job", "rows": null}
SELECT min(mc.note) AS production_note
FROM movie_companies AS mc,
movie_link AS ml,
aka_name AS an,
cast_info AS ci,
info_type AS it,
movie_info AS mi,
info_type AS it1,
name AS n,
person_info AS pi
WHERE (mc.note IS NOT NULL AND it.id = 3 AND lower(mi.info) LIKE '%action%' AND it1.info = 'votes' AND (pi.info ILIKE '%uk%' OR pi.info ILIKE '%spain%' OR pi.info ILIKE '%germany%' OR pi.info ILIKE '%italy%' OR pi.info ILIKE '%croatia%' OR pi.info ILIKE '%algeria%' OR pi.info ILIKE '%south%' OR pi.info ILIKE '%austria%' OR pi.info ILIKE '%hungary%') AND ml.movie_id = mc.movie_id AND an.person_id = ci.person_id AND ci.movie_id = mc.movie_id AND ml.movie_id = ci.movie_id AND it.id = mi.info_type_id AND mi.movie_id = mc.movie_id AND ci.movie_id = mi.movie_id AND it1.id = mi.info_type_id AND ci.person_id = n.id AND n.id = pi.person_id AND ci.person_id = pi.person_id AND it1.id = it.id AND ml.movie_id = mi.movie_id AND n.id = an.person_id AND pi.person_id = an.person_id)

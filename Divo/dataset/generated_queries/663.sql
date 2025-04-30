--{"gen": "erase", "time": "/", "template": "generated-bedd19ff-e77f-467a-84da-2f1d8b7ca1bd", "dataset": "full_job", "rows": null}
SELECT min(n.name) AS actor_name
FROM cast_info AS ci,
movie_keyword AS mk,
name AS n,
aka_name AS an,
movie_companies AS mc,
movie_info AS mi,
movie_link AS ml,
person_info AS pi,
info_type AS it2,
aka_title AS at
WHERE (n.name LIKE '%Downey%Robert%' AND mc.note LIKE '%(Japan)%' AND mc.note LIKE '%(USA)%' AND (mc.note LIKE '%(2006)%' OR mc.note LIKE '%(2007)%') AND mi.info IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Denish', 'Norwegian', 'German') AND it2.id = 3 AND pi.info ILIKE '%199%' AND ci.movie_id = mk.movie_id AND n.id = ci.person_id AND an.person_id = ci.person_id AND ci.movie_id = mc.movie_id AND mk.movie_id = mc.movie_id AND n.id = an.person_id AND mk.movie_id = mi.movie_id AND ml.movie_id = mk.movie_id AND ml.movie_id = mc.movie_id AND ml.movie_id = mi.movie_id AND mc.movie_id = mi.movie_id AND mi.movie_id = ci.movie_id AND mi.info_type_id = it2.id AND n.id = pi.person_id AND mc.movie_id = at.movie_id AND at.movie_id = ci.movie_id AND at.movie_id = mk.movie_id AND at.movie_id = mi.movie_id AND ci.person_id = pi.person_id AND ml.movie_id = at.movie_id AND ml.movie_id = ci.movie_id AND pi.person_id = an.person_id)

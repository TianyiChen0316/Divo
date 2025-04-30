--{"gen": "combine", "time": "/", "template": "generated-8b207cf9-f2ac-43f7-892b-6a42d80ed7c3", "dataset": "full_job", "rows": null}
SELECT *
FROM info_type AS it2,
movie_companies AS mc,
movie_info AS mi,
movie_keyword AS mk,
aka_title AS at,
info_type AS it1,
keyword AS k,
person_info AS pi,
cast_info AS ci,
movie_link AS ml,
movie_info_idx AS miidx
WHERE (it2.info = 'release dates' AND mc.note NOT LIKE '%(TV)%' AND mc.note LIKE '%(worldwide)%' AND mi.info IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Danish', 'Norwegian', 'German', 'USA', 'American') AND it1.info = 'trivia' AND (lower(pi.info) LIKE '%189%' OR lower(pi.info) LIKE '188%' OR lower(pi.info) LIKE '187%' OR lower(pi.info) LIKE '186%' OR lower(pi.info) LIKE '185%' OR lower(pi.info) LIKE '184%') AND mk.movie_id = mi.movie_id AND mk.movie_id = mc.movie_id AND mi.movie_id = mc.movie_id AND mk.movie_id = at.movie_id AND mi.movie_id = at.movie_id AND mc.movie_id = at.movie_id AND k.id = mk.keyword_id AND it1.id = mi.info_type_id AND ml.movie_id = mk.movie_id AND ml.movie_id = mc.movie_id AND ml.movie_id = ci.movie_id AND ml.movie_id = mi.movie_id AND mc.movie_id = ci.movie_id AND ci.movie_id = mk.movie_id AND ci.movie_id = mi.movie_id AND ci.person_id = pi.person_id AND mi.movie_id = miidx.movie_id AND miidx.movie_id = mc.movie_id AND mi.info_type_id = miidx.info_type_id AND miidx.movie_id = ci.movie_id AND miidx.movie_id = mk.movie_id AND miidx.info_type_id = it2.id AND miidx.movie_id = ml.movie_id AND it1.id = miidx.info_type_id AND it1.id = it2.id AND miidx.movie_id = at.movie_id AND ml.movie_id = at.movie_id AND at.movie_id = ci.movie_id AND mi.info_type_id = it2.id)

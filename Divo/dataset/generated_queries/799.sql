--{"gen": "combine", "time": "/", "template": "e8a", "dataset": "full_job", "rows": null}
SELECT count(*)
FROM title AS t,
movie_keyword AS mk,
keyword AS k,
info_type AS it,
movie_info AS mi,
info_type AS it1,
movie_info_idx AS mii,
cast_info AS ci,
person_info AS pi
WHERE (it.id = 3 AND k.keyword ILIKE '%love%' AND mi.info ILIKE '%romance%' AND it1.info ILIKE '%count%' AND pi.info ILIKE '%india%' AND (mii.info ILIKE '8%' OR mii.info ILIKE '9%' OR mii.info ILIKE '10%') AND it.id = mi.info_type_id AND mi.movie_id = t.id AND mk.keyword_id = k.id AND mk.movie_id = t.id AND mi.movie_id = mk.movie_id AND it1.id = mii.info_type_id AND t.id = mii.movie_id AND t.id = ci.movie_id AND mii.movie_id = ci.movie_id AND ci.person_id = pi.person_id AND ci.movie_id = mk.movie_id AND ci.movie_id = mi.movie_id AND mk.movie_id = mii.movie_id AND mi.movie_id = mii.movie_id)

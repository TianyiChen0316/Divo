--{"gen": "combine", "time": "/", "template": "generated-8f33f037-ddfa-41dd-b2f1-32210c883bdf", "dataset": "full_job", "rows": null}
SELECT min(n.name) AS member_in_charnamed_american_movie,
min(n.name) AS a1
FROM cast_info AS ci,
keyword AS k,
movie_companies AS mc,
movie_keyword AS mk,
name AS n,
title AS t,
company_type AS ct,
movie_info AS mi,
info_type AS it2,
kind_type AS kt,
movie_info_idx AS miidx
WHERE (k.keyword = 'character-name-in-title' AND n.name LIKE 'B%' AND ct.kind = 'production companies' AND mi.info IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Denish', 'Norwegian', 'German') AND it2.info = 'release dates' AND kt.kind = 'movie' AND n.id = ci.person_id AND ci.movie_id = t.id AND t.id = mk.movie_id AND mk.keyword_id = k.id AND t.id = mc.movie_id AND ci.movie_id = mc.movie_id AND ci.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id AND t.id = mi.movie_id AND mc.movie_id = mi.movie_id AND ct.id = mc.company_type_id AND it2.id = mi.info_type_id AND kt.id = t.kind_id AND miidx.movie_id = t.id AND mi.movie_id = miidx.movie_id AND miidx.movie_id = mc.movie_id AND miidx.movie_id = ci.movie_id AND miidx.movie_id = mk.movie_id AND ci.movie_id = mi.movie_id AND mk.movie_id = mi.movie_id)

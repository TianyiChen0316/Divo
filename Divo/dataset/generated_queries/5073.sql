--{"gen": "combine", "time": "/", "template": "generated-8f33f037-ddfa-41dd-b2f1-32210c883bdf", "dataset": "full_job", "rows": null}
SELECT min(n.name) AS member_in_charnamed_american_movie,
min(n.name) AS a1
FROM cast_info AS ci,
company_name AS cn,
keyword AS k,
movie_companies AS mc,
movie_keyword AS mk,
name AS n,
title AS t,
movie_info AS mi
WHERE (cn.country_code = '[us]' AND k.keyword = 'character-name-in-title' AND n.name LIKE 'B%' AND mi.info IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Denish', 'Norwegian', 'German') AND n.id = ci.person_id AND ci.movie_id = t.id AND t.id = mk.movie_id AND mk.keyword_id = k.id AND t.id = mc.movie_id AND mc.company_id = cn.id AND ci.movie_id = mc.movie_id AND ci.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id AND t.id = mi.movie_id AND mk.movie_id = mi.movie_id AND mc.movie_id = mi.movie_id AND ci.movie_id = mi.movie_id)

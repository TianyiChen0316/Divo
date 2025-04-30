--{"gen": "combine", "time": "/", "template": "generated-9ea15f9e-412a-46b9-9065-a09c0f971fa8", "dataset": "full_job", "rows": null}
SELECT n.name
FROM title AS t,
name AS n,
cast_info AS ci,
movie_info AS mi,
info_type AS it1,
info_type AS it2,
person_info AS pi,
keyword AS k,
movie_keyword AS mk,
company_type AS ct,
link_type AS lt,
movie_companies AS mc,
movie_link AS ml
WHERE (it1.id = 3 AND lower(mi.info) LIKE '%adult%' AND lower(it2.info) LIKE '%birth%' AND lower(pi.info) LIKE '%japan%' AND k.keyword IN ('superhero', 'sequel', 'second-part', 'marvel-comics', 'based-on-comic', 'tv-special', 'fight', 'violence') AND ct.kind = 'production companies' AND lt.link LIKE '%follows%' AND mc.note IS NULL AND t.id = ci.movie_id AND t.id = mi.movie_id AND ci.person_id = n.id AND it1.id = mi.info_type_id AND pi.person_id = n.id AND pi.info_type_id = it2.id AND k.id = mk.keyword_id AND t.id = mk.movie_id AND ci.movie_id = mk.movie_id AND ci.person_id = pi.person_id AND ci.movie_id = mi.movie_id AND mk.movie_id = mi.movie_id AND lt.id = ml.link_type_id AND ml.movie_id = t.id AND t.id = mc.movie_id AND mc.company_type_id = ct.id AND ml.movie_id = mk.movie_id AND ml.movie_id = mc.movie_id AND mk.movie_id = mc.movie_id AND ml.movie_id = ci.movie_id AND ml.movie_id = mi.movie_id AND mc.movie_id = ci.movie_id AND mc.movie_id = mi.movie_id)
 group by n.name order by count(*) desc
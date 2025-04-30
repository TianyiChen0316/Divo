--{"gen": "erase", "time": "/", "template": "generated-9ea15f9e-412a-46b9-9065-a09c0f971fa8", "dataset": "full_job", "rows": null}
SELECT n.name
FROM name AS n,
cast_info AS ci,
movie_info AS mi,
info_type AS it1,
info_type AS it2,
person_info AS pi,
movie_keyword AS mk
WHERE (it1.id = 3 AND lower(mi.info) LIKE '%adult%' AND lower(it2.info) LIKE '%birth%' AND lower(pi.info) LIKE '%japan%' AND ci.person_id = n.id AND it1.id = mi.info_type_id AND pi.person_id = n.id AND pi.info_type_id = it2.id AND ci.movie_id = mk.movie_id AND ci.person_id = pi.person_id AND ci.movie_id = mi.movie_id AND mk.movie_id = mi.movie_id)
 group by n.name order by count(*) desc
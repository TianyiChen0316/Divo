--{"gen": "erase", "time": "/", "template": "generated-3b99605a-5cb9-419a-b1ee-b9ed72ac9986", "dataset": "full_job", "rows": null}
SELECT n.name
FROM name AS n,
cast_info AS ci,
movie_info AS mi,
info_type AS it1,
person_info AS pi,
keyword AS k,
movie_companies AS mc,
movie_keyword AS mk
WHERE (it1.id = 3 AND lower(mi.info) LIKE '%adult%' AND lower(pi.info) LIKE '%japan%' AND k.keyword = 'character-name-in-title' AND ci.person_id = n.id AND it1.id = mi.info_type_id AND pi.person_id = n.id AND mk.keyword_id = k.id AND ci.movie_id = mc.movie_id AND ci.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id AND ci.person_id = pi.person_id AND mc.movie_id = mi.movie_id AND ci.movie_id = mi.movie_id AND mk.movie_id = mi.movie_id)
 group by n.name order by count(*) desc
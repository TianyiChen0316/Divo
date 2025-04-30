--{"gen": "combine", "time": "/", "template": "e12a", "dataset": "full_job", "rows": null}
SELECT n.name
FROM title AS t,
name AS n,
cast_info AS ci,
movie_info AS mi,
info_type AS it1,
info_type AS it2,
person_info AS pi,
movie_companies AS mc,
keyword AS k,
movie_keyword AS mk
WHERE (it1.id = 3 AND (mi.info ILIKE '%romance%' OR mi.info ILIKE '%action%') AND it2.info ILIKE '%birth%' AND pi.info ILIKE '%usa%' AND k.keyword LIKE '%sequel%' AND t.id = ci.movie_id AND t.id = mi.movie_id AND ci.movie_id = mi.movie_id AND ci.person_id = n.id AND it1.id = mi.info_type_id AND pi.person_id = n.id AND pi.person_id = ci.person_id AND pi.info_type_id = it2.id AND mi.movie_id = mc.movie_id AND mk.movie_id = mi.movie_id AND k.id = mk.keyword_id AND mc.movie_id = mk.movie_id AND t.id = mc.movie_id AND t.id = mk.movie_id AND mc.movie_id = ci.movie_id AND ci.movie_id = mk.movie_id)
 group by n.name order by count(*) desc
--{"gen": "combine", "time": "/", "template": "generated-fda044f7-70d2-481e-802e-bfd05845bb9d", "dataset": "full_job", "rows": null}
SELECT min(t.title) AS russian_mov_with_actor_producer
FROM cast_info AS ci,
movie_companies AS mc,
title AS t,
aka_name AS a1,
name AS n1,
movie_info AS mi,
movie_info_idx AS mi_idx,
name AS n,
company_type AS ct
WHERE (ci.note LIKE '%(uncredited)%' AND t.production_year BETWEEN 2005 AND 2008 AND mi.info IN ('Horror', 'Action', 'Sci-Fi', 'Thriller', 'Crime', 'War') AND n.gender = 'm' AND ct.kind = 'production companies' AND t.id = mc.movie_id AND t.id = ci.movie_id AND ci.movie_id = mc.movie_id AND a1.person_id = n1.id AND n1.id = ci.person_id AND a1.person_id = ci.person_id AND t.id = mi.movie_id AND t.id = mi_idx.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND n.id = ci.person_id AND n.id = n1.id AND n.id = a1.person_id AND mc.movie_id = mi.movie_id AND mc.movie_id = mi_idx.movie_id AND ct.id = mc.company_type_id)

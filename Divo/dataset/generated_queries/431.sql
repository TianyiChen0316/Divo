--{"gen": "erase", "time": "/", "template": "generated-a4433d02-a9b0-493b-83f4-e349cc86278b", "dataset": "full_job", "rows": null}
SELECT min(mi.info) AS budget
FROM company_name AS cn,
info_type AS it1,
info_type AS it2,
movie_companies AS mc,
movie_info AS mi,
movie_info_idx AS mi_idx,
cast_info AS ci,
movie_keyword AS mk,
name AS n
WHERE (cn.country_code = '[us]' AND it1.info = 'budget' AND it2.info = 'bottom 10 rank' AND n.name LIKE '%Downey%Robert%' AND mi.info_type_id = it1.id AND mi_idx.info_type_id = it2.id AND cn.id = mc.company_id AND mc.movie_id = mi.movie_id AND mc.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND ci.movie_id = mc.movie_id AND ci.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = mi_idx.movie_id AND n.id = ci.person_id)

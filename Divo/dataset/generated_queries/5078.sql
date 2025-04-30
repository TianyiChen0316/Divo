--{"gen": "erase", "time": "/", "template": "generated-c2d79c8e-95b9-4821-99fe-6862cb9f605a", "dataset": "full_job", "rows": null}
SELECT min(mi_idx.info) AS rating
FROM movie_info_idx AS mi_idx,
movie_keyword AS mk,
cast_info AS ci,
company_name AS cn,
movie_companies AS mc,
person_info AS pi,
info_type AS it1,
movie_info AS mi,
keyword AS k
WHERE (mi_idx.info < '3.0' AND cn.country_code = '[us]' AND mi.info ILIKE '%sci%' AND it1.info ILIKE 'birth date' AND pi.info ILIKE '%india%' AND k.keyword = 'character-name-in-title' AND mk.movie_id = mi_idx.movie_id AND mc.company_id = cn.id AND ci.movie_id = mc.movie_id AND mc.movie_id = mk.movie_id AND mc.movie_id = mi_idx.movie_id AND ci.movie_id = mk.movie_id AND ci.movie_id = mi_idx.movie_id AND mi.movie_id = ci.movie_id AND pi.info_type_id = it1.id AND mk.keyword_id = k.id AND mc.movie_id = mi.movie_id AND mk.movie_id = mi.movie_id AND ci.person_id = pi.person_id AND mi.movie_id = mi_idx.movie_id)

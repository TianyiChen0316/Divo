--{"gen": "combine", "time": "/", "template": "3a", "dataset": "full_job", "rows": null}
SELECT *
FROM keyword AS k,
movie_info AS mi,
movie_keyword AS mk,
person_info AS pi,
info_type AS it2,
cast_info AS ci,
company_name AS cn,
movie_companies AS mc
WHERE (k.keyword LIKE '%sequel%' AND mi.info IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Denish', 'Norwegian', 'German') AND it2.id = 3 AND pi.info ILIKE '%usa%' AND cn.country_code = '[de]' AND mk.movie_id = mi.movie_id AND k.id = mk.keyword_id AND mi.movie_id = ci.movie_id AND mi.info_type_id = it2.id AND mc.company_id = cn.id AND ci.movie_id = mc.movie_id AND ci.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id AND mc.movie_id = mi.movie_id AND ci.person_id = pi.person_id)

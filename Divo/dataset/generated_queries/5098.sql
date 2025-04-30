--{"gen": "combine", "time": "/", "template": "generated-d98a0b84-28fa-4c56-8d7e-b134cb09a7dc", "dataset": "full_job", "rows": null}
SELECT count(*)
FROM title AS t,
movie_keyword AS mk,
keyword AS k,
info_type AS it,
movie_info AS mi,
company_name AS cn,
movie_companies AS mc,
cast_info AS ci,
name AS n
WHERE (it.id = 3 AND lower(k.keyword) LIKE '%fight%' AND lower(mi.info) LIKE '%action%' AND cn.country_code = '[ru]' AND n.name LIKE 'Z%' AND it.id = mi.info_type_id AND mi.movie_id = t.id AND mk.keyword_id = k.id AND mk.movie_id = t.id AND mk.movie_id = mi.movie_id AND cn.id = mc.company_id AND mc.movie_id = t.id AND mc.movie_id = mk.movie_id AND mi.movie_id = mc.movie_id AND n.id = ci.person_id AND ci.movie_id = t.id AND ci.movie_id = mc.movie_id AND ci.movie_id = mk.movie_id AND ci.movie_id = mi.movie_id)

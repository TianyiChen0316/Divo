--{"gen": "erase", "time": "/", "template": "generated-ef097668-20c0-4b26-8d84-d83716b99cf0", "dataset": "full_job", "rows": null}
SELECT min(mi.info) AS release_date
FROM aka_title AS at,
company_name AS cn,
company_type AS ct,
info_type AS it1,
movie_companies AS mc,
movie_info AS mi,
movie_keyword AS mk
WHERE (cn.country_code = '[us]' AND it1.info = 'release dates' AND mc.note LIKE '%(200%)%' AND mc.note LIKE '%(worldwide)%' AND mi.note LIKE '%internet%' AND mi.info LIKE 'USA:% 200%' AND mk.movie_id = mi.movie_id AND mk.movie_id = mc.movie_id AND mk.movie_id = at.movie_id AND mi.movie_id = mc.movie_id AND mi.movie_id = at.movie_id AND mc.movie_id = at.movie_id AND it1.id = mi.info_type_id AND cn.id = mc.company_id AND ct.id = mc.company_type_id)

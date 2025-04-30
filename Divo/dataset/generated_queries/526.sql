--{"gen": "erase", "time": "/", "template": "generated-2bbedcbc-4c0b-4d73-b6b4-a21ba184d731", "dataset": "full_job", "rows": null}
SELECT min(mi.info) AS release_date
FROM aka_title AS at,
company_type AS ct,
info_type AS it1,
movie_companies AS mc,
movie_info AS mi
WHERE (it1.info = 'release dates' AND mi.note LIKE '%internet%' AND mi.info IS NOT NULL AND (mi.info LIKE 'USA:% 199%' OR mi.info LIKE 'USA:% 200%') AND mi.movie_id = mc.movie_id AND mi.movie_id = at.movie_id AND mc.movie_id = at.movie_id AND it1.id = mi.info_type_id AND ct.id = mc.company_type_id)

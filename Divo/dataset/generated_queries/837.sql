--{"gen": "erase", "time": "/", "template": "generated-e0ba645d-14ee-4f41-b420-0062ce5aae18", "dataset": "full_job", "rows": null}
SELECT min(mi.info) AS release_date
FROM aka_title AS at,
company_name AS cn,
company_type AS ct,
movie_companies AS mc,
movie_info AS mi
WHERE (cn.country_code = '[us]' AND mc.note NOT LIKE '%(as Metro-Goldwyn-Mayer Pictures)%' AND mc.note LIKE '%(Japan)%' AND mi.note LIKE '%internet%' AND mi.info LIKE 'USA:% 200%' AND mi.movie_id = mc.movie_id AND mi.movie_id = at.movie_id AND mc.movie_id = at.movie_id AND cn.id = mc.company_id AND ct.id = mc.company_type_id)

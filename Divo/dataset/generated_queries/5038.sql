--{"gen": "erase", "time": "/", "template": "generated-7bf81a07-bd4d-46c1-b39a-2ab11fe67bbe", "dataset": "full_job", "rows": null}
SELECT *
FROM company_type AS ct,
movie_companies AS mc,
movie_info AS mi
WHERE (ct.kind = 'production companies' AND mc.note LIKE '%(theatrical)%' AND mc.note LIKE '%(France)%' AND mi.info IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Denish', 'Norwegian', 'German') AND mc.movie_id = mi.movie_id AND ct.id = mc.company_type_id)

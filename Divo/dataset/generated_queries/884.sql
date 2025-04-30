--{"gen": "erase", "time": "/", "template": "generated-6d935d46-ff13-4ef0-85e0-7c3b69280cb3", "dataset": "full_job", "rows": null}
SELECT *
FROM company_type AS ct,
info_type AS it,
movie_companies AS mc,
movie_info AS mi
WHERE (ct.kind = 'production companies' AND mc.note NOT LIKE '%(USA)%' AND mc.note LIKE '%(USA)%' AND mi.info IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Denish', 'Norwegian', 'German', 'USA', 'American') AND mc.movie_id = mi.movie_id AND ct.id = mc.company_type_id AND it.id = mi.info_type_id)

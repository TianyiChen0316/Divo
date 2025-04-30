--{"gen": "erase", "time": "/", "template": "generated-2d6f20d1-1c4c-430c-b366-e8d64da480da", "dataset": "full_job", "rows": null}
SELECT *
FROM cast_info AS ci,
movie_companies AS mc,
company_type AS ct,
info_type AS it,
name AS n,
movie_info AS mi,
movie_info_idx AS miidx
WHERE (ct.kind = 'production companies' AND it.info = 'bottom 10 rank' AND n.name LIKE '%Angel%' AND ci.movie_id = mc.movie_id AND ct.id = mc.company_type_id AND n.id = ci.person_id AND it.id = miidx.info_type_id AND mi.movie_id = miidx.movie_id AND mi.movie_id = mc.movie_id AND miidx.movie_id = mc.movie_id AND miidx.movie_id = ci.movie_id AND ci.movie_id = mi.movie_id)

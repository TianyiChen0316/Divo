--{"gen": "erase", "time": "/", "template": "generated-5d13d416-9934-4457-9782-00457527441a", "dataset": "full_job", "rows": null}
SELECT *
FROM cast_info AS ci,
role_type AS rt,
movie_companies AS mc,
movie_keyword AS mk,
movie_info AS mi,
movie_info_idx AS mi_idx
WHERE (ci.note NOT LIKE '%(voice)%' AND ci.note LIKE '%(uncredited)%' AND mi.info ILIKE '%romance%' AND mi_idx.info > '9.0' AND ci.movie_id = mc.movie_id AND ci.role_id = rt.id AND mi.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id AND mc.movie_id = mi.movie_id AND ci.movie_id = mk.movie_id AND ci.movie_id = mi.movie_id AND mk.movie_id = mi_idx.movie_id AND mi.info_type_id = mi_idx.info_type_id AND mc.movie_id = mi_idx.movie_id AND ci.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id)

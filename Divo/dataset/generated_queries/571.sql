--{"gen": "erase", "time": "/", "template": "generated-9b6352f8-269a-44c4-90d9-5156f6e48dfc", "dataset": "full_job", "rows": null}
SELECT min(mi_idx.info) AS rating
FROM movie_info_idx AS mi_idx,
movie_keyword AS mk,
movie_companies AS mc,
cast_info AS ci,
movie_info_idx AS miidx
WHERE (mi_idx.info < '3.5' AND mc.note NOT LIKE '%(USA)%' AND ci.note LIKE '%(voice)%' AND ci.note LIKE '%(uncredited)%' AND mk.movie_id = mi_idx.movie_id AND mc.movie_id = mi_idx.movie_id AND ci.movie_id = mc.movie_id AND ci.movie_id = mi_idx.movie_id AND ci.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id AND miidx.movie_id = mc.movie_id AND miidx.movie_id = ci.movie_id AND miidx.movie_id = mk.movie_id AND miidx.info_type_id = mi_idx.info_type_id AND miidx.movie_id = mi_idx.movie_id)

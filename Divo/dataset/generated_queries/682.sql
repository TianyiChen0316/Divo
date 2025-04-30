--{"gen": "erase", "time": "/", "template": "generated-0a3d87ba-60ea-4f99-88e0-2a3f725bc8cc", "dataset": "full_job", "rows": null}
SELECT *
FROM movie_companies AS mc,
cast_info AS ci,
movie_info AS mi,
movie_info_idx AS miidx
WHERE (mc.note NOT LIKE '%(USA)%' AND ci.note LIKE '%(voice)%' AND ci.note LIKE '%(uncredited)%' AND ci.movie_id = mc.movie_id AND mi.movie_id = miidx.movie_id AND mi.movie_id = mc.movie_id AND miidx.movie_id = mc.movie_id AND miidx.movie_id = ci.movie_id AND ci.movie_id = mi.movie_id)

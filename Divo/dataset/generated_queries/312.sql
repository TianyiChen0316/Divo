--{"gen": "erase", "time": "/", "template": "generated-0a4ce112-d2ea-4a48-8b98-21083c2bdc4e", "dataset": "full_job", "rows": null}
SELECT *
FROM movie_companies AS mc,
movie_info AS mi,
movie_link AS ml,
cast_info AS ci,
movie_info_idx AS miidx
WHERE (mc.note LIKE '%(worldwide)%' AND mc.note LIKE '%(Japan)%' AND mi.info IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Denish', 'Norwegian', 'German', 'USA', 'American') AND mc.movie_id = mi.movie_id AND ml.movie_id = mc.movie_id AND ci.movie_id = mc.movie_id AND ml.movie_id = ci.movie_id AND mi.movie_id = miidx.movie_id AND miidx.movie_id = mc.movie_id AND miidx.movie_id = ml.movie_id AND miidx.movie_id = ci.movie_id AND ml.movie_id = mi.movie_id AND ci.movie_id = mi.movie_id)

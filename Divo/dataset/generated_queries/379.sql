--{"gen": "erase", "time": "/", "template": "generated-6289bda7-87a8-4b66-921e-2f0fe70550a9", "dataset": "full_job", "rows": null}
SELECT min(mi.info) AS release_date
FROM aka_title AS at,
movie_companies AS mc,
movie_info AS mi,
movie_keyword AS mk,
movie_info_idx AS mi_idx
WHERE (mc.note LIKE '%(200%)%' AND mc.note NOT LIKE '%(TV)%' AND mi.note LIKE '%internet%' AND mi.info LIKE 'USA:% 200%' AND mk.movie_id = mi.movie_id AND mk.movie_id = mc.movie_id AND mk.movie_id = at.movie_id AND mi.movie_id = mc.movie_id AND mi.movie_id = at.movie_id AND mc.movie_id = at.movie_id AND mc.movie_id = mi_idx.movie_id AND at.movie_id = mi_idx.movie_id AND mk.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id)

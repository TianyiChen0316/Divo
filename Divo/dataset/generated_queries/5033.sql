--{"gen": "erase", "time": "/", "template": "e3b", "dataset": "full_job", "rows": null}
SELECT min(mi_idx.info) AS rating
FROM movie_companies AS mc,
movie_info AS mi,
movie_info_idx AS mi_idx
WHERE (mi.info IN ('Drama', 'Horror', 'Western', 'Family') AND mi_idx.info > '5.0' AND mc.movie_id = mi.movie_id AND mc.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id)

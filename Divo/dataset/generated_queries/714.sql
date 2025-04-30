--{"gen": "erase", "time": "/", "template": "generated-9d7935c3-7905-420b-b15b-e2e95faccdfe", "dataset": "full_job", "rows": null}
SELECT min(mi_idx.info) AS rating
FROM info_type AS it1,
movie_companies AS mc,
movie_info AS mi,
movie_info_idx AS mi_idx
WHERE (it1.info = 'bottom 10 rank' AND mi.info IN ('Drama', 'Horror', 'Western', 'Family') AND mi_idx.info > '7.0' AND mi.info_type_id = it1.id AND mc.movie_id = mi.movie_id AND mc.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id)

--{"gen": "erase", "time": "/", "template": "generated-3a1cc47d-1883-40b8-ab78-1670fde50132", "dataset": "full_job", "rows": null}
SELECT min(mi_idx.info) AS rating
FROM movie_companies AS mc,
movie_info AS mi,
movie_info_idx AS mi_idx,
keyword AS k,
movie_keyword AS mk
WHERE (mi.info IN ('Drama', 'Horror', 'Western', 'Family') AND mi_idx.info > '7.0' AND k.keyword LIKE '%sequel%' AND mi.movie_id = mi_idx.movie_id AND mi.movie_id = mc.movie_id AND mi_idx.movie_id = mc.movie_id AND mk.movie_id = mi.movie_id AND k.id = mk.keyword_id AND mc.movie_id = mk.movie_id AND mk.movie_id = mi_idx.movie_id)

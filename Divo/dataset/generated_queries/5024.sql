--{"gen": "erase", "time": "/", "template": "14b", "dataset": "full_job", "rows": null}
SELECT min(mi_idx.info) AS rating
FROM info_type AS it1,
info_type AS it2,
keyword AS k,
movie_info AS mi,
movie_info_idx AS mi_idx,
movie_keyword AS mk
WHERE (it1.info = 'budget' AND it2.info = 'rating' AND k.keyword IN ('murder', 'murder-in-title') AND mi.info IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Denish', 'Norwegian', 'German', 'USA', 'American') AND mi_idx.info > '7.0' AND mk.movie_id = mi.movie_id AND mk.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND k.id = mk.keyword_id AND it1.id = mi.info_type_id AND it2.id = mi_idx.info_type_id)

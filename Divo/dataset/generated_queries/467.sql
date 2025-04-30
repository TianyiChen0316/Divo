--{"gen": "erase", "time": "/", "template": "generated-fa0dfa1a-4133-479a-a1de-19b20b864ad2", "dataset": "full_job", "rows": null}
SELECT min(mi_idx.info) AS rating
FROM movie_info_idx AS mi_idx,
movie_keyword AS mk,
movie_companies AS mc,
cast_info AS ci
WHERE (mi_idx.info > '9.0' AND mc.note LIKE '%(Blu-ray)%' AND ci.note NOT LIKE '%(voice)%' AND ci.note LIKE '%(uncredited)%' AND mk.movie_id = mi_idx.movie_id AND mc.movie_id = mi_idx.movie_id AND ci.movie_id = mc.movie_id AND ci.movie_id = mi_idx.movie_id AND ci.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id)

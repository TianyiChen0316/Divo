--{"gen": "erase", "time": "/", "template": "generated-0a9d63df-a7e0-4fb7-8001-0c9981dee8ca", "dataset": "full_job", "rows": null}
SELECT min(mi.info) AS movie_budget,
min(mi_idx.info) AS movie_votes
FROM cast_info AS ci,
movie_info AS mi,
movie_info_idx AS mi_idx,
movie_companies AS mc,
movie_keyword AS mk,
movie_link AS ml
WHERE (ci.note IN ('(producer)', '(executive producer)') AND mc.note LIKE '%(1994)%' AND mc.note NOT LIKE '%(as Metro-Goldwyn-Mayer Pictures)%' AND (mc.note LIKE '%(2006)%' OR mc.note LIKE '%(2007)%') AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND ci.movie_id = mc.movie_id AND mc.movie_id = mi.movie_id AND mc.movie_id = mi_idx.movie_id AND mc.movie_id = mk.movie_id AND ci.movie_id = mk.movie_id AND ml.movie_id = mc.movie_id AND ml.movie_id = ci.movie_id AND ml.movie_id = mk.movie_id AND ml.movie_id = mi.movie_id AND ml.movie_id = mi_idx.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = mi_idx.movie_id)

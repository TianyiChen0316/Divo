--{"gen": "erase", "time": "/", "template": "generated-cc2003e7-e3e0-446f-b523-c94fb9cc6fbc", "dataset": "full_job", "rows": null}
SELECT min(mi.info) AS movie_budget,
min(mi_idx.info) AS movie_votes
FROM cast_info AS ci,
movie_companies AS mc,
movie_info AS mi,
movie_info_idx AS mi_idx,
movie_keyword AS mk,
movie_info_idx AS miidx,
aka_title AS at
WHERE (ci.note IN ('(writer)', '(head writer)', '(written by)', '(story)', '(story editor)') AND mc.note LIKE '%(co-production)%' AND mi.info IN ('Horror', 'Thriller') AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND ci.movie_id = mk.movie_id AND ci.movie_id = mc.movie_id AND mi.movie_id = mi_idx.movie_id AND mi.movie_id = mk.movie_id AND mi.movie_id = mc.movie_id AND mi_idx.movie_id = mk.movie_id AND mi_idx.movie_id = mc.movie_id AND mk.movie_id = mc.movie_id AND mi.movie_id = miidx.movie_id AND miidx.movie_id = mc.movie_id AND miidx.movie_id = mk.movie_id AND miidx.movie_id = mi_idx.movie_id AND miidx.movie_id = ci.movie_id AND mk.movie_id = at.movie_id AND mi.movie_id = at.movie_id AND mc.movie_id = at.movie_id AND at.movie_id = ci.movie_id AND miidx.movie_id = at.movie_id AND at.movie_id = mi_idx.movie_id)

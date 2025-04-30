--{"gen": "erase", "time": "/", "template": "generated-e3f508f7-d2b3-42b2-bb18-d81923984a8d", "dataset": "full_job", "rows": null}
SELECT min(mc.note) AS production_note
FROM movie_companies AS mc,
movie_info_idx AS mi_idx,
aka_title AS at,
movie_info AS mi,
movie_keyword AS mk
WHERE (mc.note NOT LIKE '%(TV)%' AND mi.note LIKE '%internet%' AND mi.info IS NOT NULL AND (mi.info LIKE 'USA:% 199%' OR mi.info LIKE 'USA:% 200%') AND mc.movie_id = mi_idx.movie_id AND mc.movie_id = at.movie_id AND mc.movie_id = mk.movie_id AND mc.movie_id = mi.movie_id AND at.movie_id = mk.movie_id AND at.movie_id = mi.movie_id AND at.movie_id = mi_idx.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id)

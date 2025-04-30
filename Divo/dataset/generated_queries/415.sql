--{"gen": "erase", "time": "/", "template": "generated-d950be15-1f10-4a08-96ca-8770df6e5d43", "dataset": "full_job", "rows": null}
SELECT min(mc.note) AS production_note
FROM movie_companies AS mc,
movie_info_idx AS mi_idx,
movie_info AS mi,
cast_info AS ci,
link_type AS lt,
movie_link AS ml,
person_info AS pi
WHERE (mc.note NOT LIKE '%(TV)%' AND mc.note LIKE '%(co-production)%' AND mi.note LIKE '%internet%' AND mi.info IS NOT NULL AND (mi.info LIKE 'USA:% 199%' OR mi.info LIKE 'USA:% 200%') AND lt.link = 'features' AND pi.note = 'Volker Boehm' AND mc.movie_id = mi_idx.movie_id AND mi.movie_id = mc.movie_id AND lt.id = ml.link_type_id AND pi.person_id = ci.person_id AND ci.movie_id = ml.linked_movie_id AND ci.movie_id = mi.movie_id AND mi.movie_id = ml.linked_movie_id AND mi.info_type_id = pi.info_type_id AND mc.movie_id = ci.movie_id AND mc.movie_id = ml.linked_movie_id AND ci.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND ml.linked_movie_id = mi_idx.movie_id)

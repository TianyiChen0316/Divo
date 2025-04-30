--{"gen": "erase", "time": "/", "template": "generated-61bc8011-08b1-420a-bb20-083418ce7927", "dataset": "full_job", "rows": null}
SELECT *
FROM movie_keyword AS mk,
keyword AS k,
movie_link AS ml,
title AS t1,
movie_companies AS mc,
movie_info AS mi,
movie_companies AS mc1,
movie_info_idx AS mi_idx1,
movie_info_idx AS mi_idx2
WHERE (k.keyword = 'character-name-in-title' AND mi.note LIKE '%internet%' AND mi.info IS NOT NULL AND (mi.info LIKE 'USA:% 199%' OR mi.info LIKE 'USA:% 200%') AND mi_idx2.info < '3.5' AND mk.keyword_id = k.id AND t1.id = mk.movie_id AND ml.movie_id = t1.id AND mk.movie_id = t1.id AND ml.movie_id = mk.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = mc.movie_id AND mi.movie_id = mc.movie_id AND ml.movie_id = mc.movie_id AND ml.movie_id = mi.movie_id AND mc.movie_id = t1.id AND t1.id = mi.movie_id AND ml.movie_id = mi_idx1.movie_id AND ml.movie_id = mc1.movie_id AND mi_idx1.movie_id = mc1.movie_id AND ml.linked_movie_id = mi_idx2.movie_id AND mi.info_type_id = mi_idx1.info_type_id AND mi_idx1.movie_id = mc.movie_id AND mi_idx1.movie_id = t1.id AND mi_idx1.movie_id = mk.movie_id AND mi_idx1.movie_id = mi.movie_id AND mc.movie_id = mc1.movie_id AND t1.id = mc1.movie_id AND mc1.movie_id = mk.movie_id AND mc1.movie_id = mi.movie_id)

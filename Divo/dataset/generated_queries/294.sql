--{"gen": "erase", "time": "/", "template": "generated-caec2f33-7a26-4398-9bf5-39de1bde4544", "dataset": "full_job", "rows": null}
SELECT min(mi_idx1.info) AS first_rating,
min(mi_idx2.info) AS second_rating,
min(t2.title) AS second_movie
FROM info_type AS it1,
movie_companies AS mc1,
movie_companies AS mc2,
movie_info_idx AS mi_idx1,
movie_info_idx AS mi_idx2,
movie_link AS ml,
title AS t2,
char_name AS chn,
cast_info AS ci,
company_name AS cn,
movie_companies AS mc,
movie_info AS mi,
person_info AS pi
WHERE (it1.info = 'rating' AND mi_idx2.info < '8.5' AND t2.production_year BETWEEN 1950 AND 2000 AND ci.note IN ('(voice)', '(voice: Japanese version)', '(voice) (uncredited)', '(voice: English version)') AND cn.country_code = '[nl]' AND cn.name = 'YouTube' AND mi.info IS NOT NULL AND (mi.info LIKE 'Japan:%201%' OR mi.info LIKE 'USA:%201%') AND pi.info ILIKE '%usa%' AND t2.id = ml.linked_movie_id AND it1.id = mi_idx1.info_type_id AND ml.movie_id = mi_idx1.movie_id AND ml.movie_id = mc1.movie_id AND mi_idx1.movie_id = mc1.movie_id AND t2.id = mi_idx2.movie_id AND t2.id = mc2.movie_id AND ml.linked_movie_id = mi_idx2.movie_id AND ml.linked_movie_id = mc2.movie_id AND mi_idx2.movie_id = mc2.movie_id AND mc.movie_id = ci.movie_id AND mc.movie_id = mi.movie_id AND mi.movie_id = ci.movie_id AND cn.id = mc.company_id AND chn.id = ci.person_role_id AND it1.id = mi.info_type_id AND pi.person_id = ci.person_id AND mi.info_type_id = mi_idx1.info_type_id)

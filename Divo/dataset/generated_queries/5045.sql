--{"gen": "erase", "time": "/", "template": "generated-facb6317-7753-4ff2-a232-eac1b66385b3", "dataset": "full_job", "rows": null}
SELECT *
FROM cast_info AS ci,
movie_companies AS mc,
info_type AS it,
movie_link AS ml,
person_info AS pi,
complete_cast AS cc,
title AS t
WHERE (ci.role_id = 2 AND mc.note IS NOT NULL AND (mc.note LIKE '%(USA)%' OR mc.note LIKE '%(worldwide)%') AND it.info = 'mini biography' AND pi.note IS NOT NULL AND t.production_year BETWEEN 2007 AND 2010 AND ci.movie_id = mc.movie_id AND mc.company_id = ci.person_role_id AND it.id = pi.info_type_id AND pi.person_id = ci.person_id AND ci.movie_id = ml.linked_movie_id AND mc.movie_id = ml.linked_movie_id AND t.id = ci.movie_id AND t.id = cc.movie_id AND ci.movie_id = cc.movie_id AND t.id = mc.movie_id AND t.id = ml.linked_movie_id AND mc.movie_id = cc.movie_id AND cc.movie_id = ml.linked_movie_id)

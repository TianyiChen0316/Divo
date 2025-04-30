--{"gen": "combine", "time": "/", "template": "generated-8a4b42b2-0ae8-46bc-9afd-59090787b561", "dataset": "full_job", "rows": null}
SELECT *
FROM cast_info AS ci,
keyword AS k,
movie_keyword AS mk,
char_name AS cn,
movie_companies AS mc,
movie_link AS ml,
complete_cast AS cc,
title AS t
WHERE (k.keyword = 'character-name-in-title' AND mc.note IS NOT NULL AND (mc.note LIKE '%(USA)%' OR mc.note LIKE '%(worldwide)%') AND t.production_year > 2005 AND mk.keyword_id = k.id AND ci.movie_id = mk.movie_id AND cn.id = ci.person_role_id AND ci.movie_id = mc.movie_id AND mc.company_id = cn.id AND mc.company_id = ci.person_role_id AND ci.movie_id = ml.linked_movie_id AND mc.movie_id = ml.linked_movie_id AND t.id = mk.movie_id AND t.id = ci.movie_id AND t.id = cc.movie_id AND mk.movie_id = cc.movie_id AND ci.movie_id = cc.movie_id AND t.id = mc.movie_id AND t.id = ml.linked_movie_id AND mc.movie_id = cc.movie_id AND mc.movie_id = mk.movie_id AND cc.movie_id = ml.linked_movie_id AND mk.movie_id = ml.linked_movie_id)

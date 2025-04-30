--{"gen": "erase", "time": "/", "template": "generated-2d8a72da-420e-4629-b571-2002877dbca4", "dataset": "full_job", "rows": null}
SELECT min(t.title) AS movie_title
FROM movie_info AS mi,
title AS t,
cast_info AS ci,
movie_companies AS mc,
char_name AS chn,
complete_cast AS cc
WHERE (mi.info IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Denish', 'Norwegian', 'German') AND t.production_year BETWEEN 2005 AND 2010 AND t.id = mi.movie_id AND t.id = ci.movie_id AND mi.movie_id = ci.movie_id AND ci.movie_id = mc.movie_id AND t.id = mc.movie_id AND mc.movie_id = mi.movie_id AND chn.id = ci.person_role_id AND t.id = cc.movie_id AND ci.movie_id = cc.movie_id AND mc.movie_id = cc.movie_id AND cc.movie_id = mi.movie_id)

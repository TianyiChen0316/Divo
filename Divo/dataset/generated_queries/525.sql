--{"gen": "combine", "time": "/", "template": "5c", "dataset": "full_job", "rows": null}
SELECT min(t.title) AS american_movie
FROM company_type AS ct,
movie_companies AS mc,
movie_info AS mi,
title AS t,
cast_info AS ci,
company_name AS cn,
keyword AS k,
movie_keyword AS mk,
role_type AS rt
WHERE (ct.kind = 'production companies' AND mc.note NOT LIKE '%(TV)%' AND mc.note LIKE '%(USA)%' AND mi.info IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Denish', 'Norwegian', 'German', 'USA', 'American') AND t.production_year > 1990 AND cn.country_code = '[us]' AND k.keyword = 'character-name-in-title' AND rt.role = 'actress' AND t.id = mi.movie_id AND t.id = mc.movie_id AND mc.movie_id = mi.movie_id AND ct.id = mc.company_type_id AND ci.movie_id = t.id AND t.id = mk.movie_id AND mk.keyword_id = k.id AND mc.company_id = cn.id AND ci.movie_id = mc.movie_id AND ci.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id AND ci.role_id = rt.id AND ci.movie_id = mi.movie_id AND mk.movie_id = mi.movie_id)

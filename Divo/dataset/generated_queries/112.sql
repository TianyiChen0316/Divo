--{"gen": "erase", "time": "/", "template": "10a", "dataset": "full_job", "rows": null}
SELECT min(t.title) AS russian_movie
FROM cast_info AS ci,
company_name AS cn,
movie_companies AS mc,
role_type AS rt,
title AS t
WHERE (ci.note LIKE '%(producer)%' AND ci.note LIKE '%(uncredited)%' AND cn.country_code = '[ru]' AND rt.role = 'actress' AND t.production_year > 2005 AND t.id = mc.movie_id AND t.id = ci.movie_id AND ci.movie_id = mc.movie_id AND rt.id = ci.role_id AND cn.id = mc.company_id)

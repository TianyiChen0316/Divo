--{"gen": "combine", "time": "/", "template": "generated-502115d1-672f-408d-ab12-20d939d88e5a", "dataset": "full_job", "rows": null}
SELECT min(t.title) AS northern_dark_movie
FROM keyword AS k,
movie_info AS mi,
movie_keyword AS mk,
title AS t,
movie_companies AS mc,
movie_info_idx AS miidx,
aka_title AS at,
company_name AS cn,
company_type AS ct,
info_type AS it1
WHERE (k.keyword IN ('murder', 'murder-in-title', 'blood', 'violence') AND mi.info IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Denish', 'Norwegian', 'German', 'USA', 'American') AND t.production_year > 2010 AND cn.country_code = '[us]' AND it1.info = 'rating' AND t.id = mi.movie_id AND t.id = mk.movie_id AND mk.movie_id = mi.movie_id AND k.id = mk.keyword_id AND mc.movie_id = t.id AND miidx.movie_id = t.id AND mi.movie_id = miidx.movie_id AND mi.movie_id = mc.movie_id AND miidx.movie_id = mc.movie_id AND miidx.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id AND t.id = at.movie_id AND mk.movie_id = at.movie_id AND mi.movie_id = at.movie_id AND mc.movie_id = at.movie_id AND it1.id = mi.info_type_id AND cn.id = mc.company_id AND ct.id = mc.company_type_id AND miidx.movie_id = at.movie_id)

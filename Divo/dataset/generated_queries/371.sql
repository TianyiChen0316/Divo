--{"gen": "combine", "time": "/", "template": "2b", "dataset": "full_job", "rows": null}
SELECT *
FROM company_name AS cn,
keyword AS k,
movie_companies AS mc,
movie_keyword AS mk,
info_type AS it1,
info_type AS it2,
movie_info AS mi,
movie_info_idx AS mi_idx,
movie_info_idx AS miidx
WHERE (cn.country_code = '[nl]' AND k.keyword = 'character-name-in-title' AND it1.info = 'countries' AND it2.info = 'rating' AND mi.info IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Denish', 'Norwegian', 'German', 'USA', 'American') AND mi_idx.info < '8.5' AND cn.id = mc.company_id AND mk.keyword_id = k.id AND mc.movie_id = mk.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND it1.id = mi.info_type_id AND it2.id = mi_idx.info_type_id AND mi.movie_id = miidx.movie_id AND mi.movie_id = mc.movie_id AND miidx.movie_id = mc.movie_id AND miidx.movie_id = mk.movie_id AND miidx.movie_id = mi_idx.movie_id AND mc.movie_id = mi_idx.movie_id)

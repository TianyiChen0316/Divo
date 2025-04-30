--{"gen": "combine", "time": "/", "template": "generated-6df59644-8cfa-4fa6-8460-914e4a3616f1", "dataset": "full_job", "rows": null}
SELECT *
FROM company_type AS ct,
movie_companies AS mc,
movie_info AS mi,
company_name AS cn,
info_type AS it1,
keyword AS k,
movie_info_idx AS mi_idx,
movie_keyword AS mk
WHERE (ct.kind = 'production companies' AND mc.note NOT LIKE '%(TV)%' AND mc.note LIKE '%(USA)%' AND mi.info IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Denish', 'Norwegian', 'German', 'USA', 'American') AND cn.country_code <> '[pl]' AND it1.info = 'countries' AND k.keyword IN ('murder', 'murder-in-title', 'blood', 'violence') AND mi_idx.info < '7.0' AND mc.movie_id = mi.movie_id AND ct.id = mc.company_type_id AND mk.movie_id = mi.movie_id AND mk.movie_id = mi_idx.movie_id AND mk.movie_id = mc.movie_id AND mi.movie_id = mi_idx.movie_id AND mc.movie_id = mi_idx.movie_id AND k.id = mk.keyword_id AND it1.id = mi.info_type_id AND cn.id = mc.company_id)

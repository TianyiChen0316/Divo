--{"gen": "combine", "time": "/", "template": "generated-2451ab6b-94d0-4d8b-b4e9-790c1afb8d12", "dataset": "full_job", "rows": null}
SELECT min(mi.info) AS release_date
FROM aka_title AS at,
movie_companies AS mc,
movie_info AS mi,
movie_keyword AS mk,
company_type AS ct,
company_name AS cn,
info_type AS it1,
info_type AS it2,
keyword AS k,
movie_info_idx AS mi_idx
WHERE (mi.note LIKE '%internet%' AND mi.info IS NOT NULL AND (mi.info LIKE 'USA:% 199%' OR mi.info LIKE 'USA:% 200%') AND ct.kind = 'production companies' AND cn.country_code <> '[us]' AND it1.info = 'countries' AND it2.info = 'rating' AND k.keyword IN ('murder', 'murder-in-title', 'blood', 'violence') AND mi_idx.info > '7.0' AND ct.id = mc.company_type_id AND mc.movie_id = at.movie_id AND mc.movie_id = mk.movie_id AND mc.movie_id = mi.movie_id AND at.movie_id = mk.movie_id AND at.movie_id = mi.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND mc.movie_id = mi_idx.movie_id AND k.id = mk.keyword_id AND it1.id = mi.info_type_id AND it2.id = mi_idx.info_type_id AND cn.id = mc.company_id AND at.movie_id = mi_idx.movie_id)

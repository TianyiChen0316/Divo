--{"gen": "combine", "time": "/", "template": "generated-f3dd5275-6f83-4603-b41b-dd69d6e25e2e", "dataset": "full_job", "rows": null}
SELECT min(an.name) AS cool_actor_pseudonym
FROM aka_name AS an,
cast_info AS ci,
keyword AS k,
movie_companies AS mc,
movie_keyword AS mk,
company_type AS ct,
movie_info AS mi,
company_name AS cn,
info_type AS it1,
movie_info_idx AS mi_idx
WHERE (k.keyword = 'character-name-in-title' AND ct.kind = 'production companies' AND mi.info IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Denish', 'Norwegian', 'German', 'USA', 'American') AND cn.country_code <> '[pl]' AND it1.info = 'countries' AND mi_idx.info > '8.0' AND mk.keyword_id = k.id AND an.person_id = ci.person_id AND ci.movie_id = mc.movie_id AND ci.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id AND mc.movie_id = mi.movie_id AND ct.id = mc.company_type_id AND mk.movie_id = mi.movie_id AND mk.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND mc.movie_id = mi_idx.movie_id AND it1.id = mi.info_type_id AND cn.id = mc.company_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id)

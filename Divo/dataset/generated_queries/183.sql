--{"gen": "combine", "time": "/", "template": "e8b", "dataset": "full_job", "rows": null}
SELECT count(*)
FROM title AS t,
movie_keyword AS mk,
keyword AS k,
info_type AS it,
movie_info AS mi,
company_type AS ct,
movie_companies AS mc
WHERE (it.id = 3 AND lower(k.keyword) LIKE '%fight%' AND lower(mi.info) LIKE '%action%' AND ct.kind = 'production companies' AND mc.note NOT LIKE '%(USA)%' AND it.id = mi.info_type_id AND mi.movie_id = t.id AND mk.keyword_id = k.id AND mk.movie_id = t.id AND ct.id = mc.company_type_id AND t.id = mc.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = mc.movie_id AND mi.movie_id = mc.movie_id)

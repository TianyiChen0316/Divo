--{"gen": "combine", "time": "/", "template": "e8b", "dataset": "full_job", "rows": null}
SELECT count(*)
FROM movie_keyword AS mk,
keyword AS k,
info_type AS it,
movie_info AS mi,
company_type AS ct,
movie_companies AS mc,
movie_link AS ml,
cast_info AS ci,
char_name AS chn
WHERE (it.id = 3 AND lower(k.keyword) LIKE '%fight%' AND lower(mi.info) LIKE '%action%' AND ct.kind = 'production companies' AND mc.note IS NULL AND it.id = mi.info_type_id AND mk.keyword_id = k.id AND mc.company_type_id = ct.id AND ml.movie_id = mk.movie_id AND ml.movie_id = mc.movie_id AND mk.movie_id = mc.movie_id AND ci.movie_id = mc.movie_id AND ci.movie_id = mk.movie_id AND chn.id = ci.person_role_id AND ml.movie_id = ci.movie_id AND ml.movie_id = mi.movie_id AND mc.movie_id = mi.movie_id AND ci.movie_id = mi.movie_id AND mk.movie_id = mi.movie_id)

--{"gen": "combine", "time": "/", "template": "generated-be5a01b0-e5c4-4245-bfc3-83c0744bc71e", "dataset": "full_job", "rows": null}
SELECT min(mi.info) AS release_date,
min(miidx.info) AS rating
FROM company_name AS cn,
info_type AS it,
movie_companies AS mc,
movie_info AS mi,
movie_info_idx AS miidx,
aka_title AS at,
movie_keyword AS mk,
cast_info AS ci,
aka_name AS an
WHERE (cn.country_code = '[nl]' AND it.info = 'rating' AND ci.role_id = 1 AND cn.id = mc.company_id AND it.id = miidx.info_type_id AND mi.movie_id = miidx.movie_id AND mi.movie_id = mc.movie_id AND miidx.movie_id = mc.movie_id AND mc.movie_id = at.movie_id AND mc.movie_id = mk.movie_id AND at.movie_id = mk.movie_id AND at.movie_id = mi.movie_id AND mk.movie_id = mi.movie_id AND ci.movie_id = mc.movie_id AND an.person_id = ci.person_id AND mc.company_id = ci.person_role_id AND ci.movie_id = mk.movie_id AND at.movie_id = ci.movie_id AND ci.movie_id = mi.movie_id AND cn.id = ci.person_role_id AND miidx.movie_id = at.movie_id AND miidx.movie_id = ci.movie_id AND miidx.movie_id = mk.movie_id)

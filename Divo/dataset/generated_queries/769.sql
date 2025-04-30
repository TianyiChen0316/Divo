--{"gen": "combine", "time": "/", "template": "generated-38700d7a-0e34-4045-a8ab-da4e08a514a3", "dataset": "full_job", "rows": null}
SELECT *
FROM cast_info AS ci,
movie_info AS mi,
movie_info_idx AS mi_idx,
company_name AS cn,
movie_companies AS mc,
movie_info_idx AS miidx,
movie_keyword AS mk,
name AS n,
company_type AS ct,
aka_title AS at
WHERE (mi.info IN ('Horror', 'Thriller') AND cn.country_code = '[nl]' AND n.gender = 'm' AND ct.kind = 'production companies' AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND cn.id = mc.company_id AND mi.movie_id = miidx.movie_id AND mi.movie_id = mc.movie_id AND miidx.movie_id = mc.movie_id AND miidx.movie_id = ci.movie_id AND miidx.movie_id = mi_idx.movie_id AND mc.movie_id = ci.movie_id AND mc.movie_id = mi_idx.movie_id AND mk.movie_id = mi_idx.movie_id AND ci.movie_id = mk.movie_id AND mi.movie_id = mk.movie_id AND n.id = ci.person_id AND ct.id = mc.company_type_id AND mc.movie_id = at.movie_id AND mc.movie_id = mk.movie_id AND at.movie_id = mk.movie_id AND at.movie_id = mi.movie_id AND at.movie_id = mi_idx.movie_id AND at.movie_id = ci.movie_id AND miidx.movie_id = at.movie_id AND miidx.movie_id = mk.movie_id)

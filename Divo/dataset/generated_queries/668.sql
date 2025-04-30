--{"gen": "erase", "time": "/", "template": "generated-9b2e42af-7d76-4c8f-9b4a-8c21af0d4882", "dataset": "full_job", "rows": null}
SELECT min(pi.info)
FROM person_info AS pi,
cast_info AS ci,
movie_info AS mi,
company_name AS cn,
movie_companies AS mc,
movie_link AS ml,
company_type AS ct,
movie_info_idx AS miidx,
aka_title AS at,
char_name AS chn
WHERE (lower(mi.info) LIKE '%documentary%' AND (lower(pi.info) LIKE '%189%' OR lower(pi.info) LIKE '188%' OR lower(pi.info) LIKE '187%' OR lower(pi.info) LIKE '186%' OR lower(pi.info) LIKE '185%' OR lower(pi.info) LIKE '184%') AND cn.country_code <> '[pl]' AND (cn.name LIKE '%Film%' OR cn.name LIKE '%Warner%') AND mc.note IS NULL AND ct.kind = 'production companies' AND mc.company_id = cn.id AND ml.movie_id = mc.movie_id AND ml.movie_id = mi.movie_id AND mc.movie_id = mi.movie_id AND ml.movie_id = ci.movie_id AND mc.movie_id = ci.movie_id AND ci.movie_id = mi.movie_id AND ci.person_id = pi.person_id AND ct.id = mc.company_type_id AND mi.movie_id = miidx.movie_id AND miidx.movie_id = mc.movie_id AND mi.movie_id = at.movie_id AND mc.movie_id = at.movie_id AND miidx.movie_id = at.movie_id AND chn.id = ci.person_role_id AND miidx.movie_id = ci.movie_id AND at.movie_id = ci.movie_id AND miidx.movie_id = ml.movie_id AND ml.movie_id = at.movie_id)

--{"gen": "combine", "time": "/", "template": "generated-b6f70315-ce95-426f-a0fd-1b5587851e69", "dataset": "full_job", "rows": null}
SELECT min(miidx.info) AS rating
FROM company_type AS ct,
info_type AS it,
movie_companies AS mc,
movie_info_idx AS miidx,
company_name AS cn,
link_type AS lt,
movie_link AS ml,
aka_name AS an,
cast_info AS ci,
name AS n,
char_name AS chn
WHERE (ct.kind = 'production companies' AND it.info = 'rating' AND cn.country_code <> '[pl]' AND (cn.name LIKE '%Film%' OR cn.name LIKE '%Warner%') AND lt.link LIKE '%follow%' AND ct.id = mc.company_type_id AND it.id = miidx.info_type_id AND miidx.movie_id = mc.movie_id AND lt.id = ml.link_type_id AND mc.company_id = cn.id AND ml.movie_id = mc.movie_id AND an.person_id = n.id AND n.id = ci.person_id AND an.person_id = ci.person_id AND ci.movie_id = mc.movie_id AND chn.id = ci.person_role_id AND ml.movie_id = ci.movie_id AND miidx.movie_id = ml.movie_id AND miidx.movie_id = ci.movie_id)

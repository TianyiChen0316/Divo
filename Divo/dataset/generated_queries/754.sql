--{"gen": "combine", "time": "/", "template": "generated-3acb75f4-74f7-4b19-be81-5ea224e23988", "dataset": "full_job", "rows": null}
SELECT min(chn.name) AS character,
min(t.title) AS russian_mov_with_actor_producer
FROM char_name AS chn,
cast_info AS ci,
company_type AS ct,
movie_companies AS mc,
title AS t,
role_type AS rt
WHERE (ci.note LIKE '%(producer)%' AND t.production_year > 2010 AND t.id = mc.movie_id AND t.id = ci.movie_id AND ci.movie_id = mc.movie_id AND chn.id = ci.person_role_id AND ct.id = mc.company_type_id AND ci.role_id = rt.id)

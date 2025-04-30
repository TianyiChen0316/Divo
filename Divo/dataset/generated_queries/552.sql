--{"gen": "erase", "time": "/", "template": "generated-c98a8b27-5e57-4df0-8b62-0e21db632bc6", "dataset": "full_job", "rows": null}
SELECT count(*)
FROM title AS t,
info_type AS it,
movie_info AS mi,
cast_info AS ci,
aka_title AS at,
movie_companies AS mc,
complete_cast AS cc,
comp_cast_type AS cct1,
kind_type AS kt
WHERE (it.id = 3 AND mi.info ILIKE '%romance%' AND cct1.kind = 'complete' AND kt.kind IN ('movie', 'tv movie', 'video movie', 'video game') AND it.id = mi.info_type_id AND mi.movie_id = t.id AND t.id = ci.movie_id AND t.id = at.movie_id AND t.id = mc.movie_id AND mi.movie_id = mc.movie_id AND mi.movie_id = at.movie_id AND mc.movie_id = at.movie_id AND t.id = cc.movie_id AND ci.movie_id = cc.movie_id AND mc.movie_id = ci.movie_id AND mc.movie_id = cc.movie_id AND at.movie_id = ci.movie_id AND at.movie_id = cc.movie_id AND ci.movie_id = mi.movie_id AND cc.movie_id = mi.movie_id AND kt.id = t.kind_id AND cct1.id = cc.status_id)

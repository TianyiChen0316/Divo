--{"gen": "erase", "time": "/", "template": "generated-09a7a78e-5f70-4ec3-b670-a8c7b5dacf6d", "dataset": "full_job", "rows": null}
SELECT *
FROM movie_companies AS mc,
info_type AS it,
movie_info_idx AS miidx,
aka_name AS an,
char_name AS chn,
cast_info AS ci
WHERE (mc.note LIKE '%(theatrical)%' AND mc.note LIKE '%(France)%' AND it.info = 'votes' AND ci.note = '(voice)' AND it.id = miidx.info_type_id AND miidx.movie_id = mc.movie_id AND mc.movie_id = ci.movie_id AND ci.person_id = an.person_id AND chn.id = ci.person_role_id AND miidx.movie_id = ci.movie_id)

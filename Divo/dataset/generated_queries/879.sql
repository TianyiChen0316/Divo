--{"gen": "combine", "time": "/", "template": "generated-6df59644-8cfa-4fa6-8460-914e4a3616f1", "dataset": "full_job", "rows": null}
SELECT *
FROM movie_companies AS mc,
movie_info AS mi,
cast_info AS ci,
movie_info_idx AS mi_idx,
movie_keyword AS mk,
movie_info_idx AS miidx,
aka_title AS at,
role_type AS rt
WHERE (mc.note NOT LIKE '%(TV)%' AND mc.note LIKE '%(USA)%' AND mi.info IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Denish', 'Norwegian', 'German', 'USA', 'American') AND ci.note IN ('(writer)', '(head writer)', '(written by)', '(story)', '(story editor)') AND rt.role = 'actress' AND mc.movie_id = mi.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND ci.movie_id = mk.movie_id AND ci.movie_id = mc.movie_id AND mi.movie_id = mi_idx.movie_id AND mi.movie_id = mk.movie_id AND mi_idx.movie_id = mk.movie_id AND mi_idx.movie_id = mc.movie_id AND mk.movie_id = mc.movie_id AND mi.movie_id = miidx.movie_id AND miidx.movie_id = mc.movie_id AND miidx.movie_id = mk.movie_id AND miidx.movie_id = mi_idx.movie_id AND miidx.movie_id = ci.movie_id AND mk.movie_id = at.movie_id AND mi.movie_id = at.movie_id AND mc.movie_id = at.movie_id AND at.movie_id = ci.movie_id AND miidx.movie_id = at.movie_id AND at.movie_id = mi_idx.movie_id AND rt.id = ci.role_id)

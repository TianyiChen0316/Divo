--{"gen": "combine", "time": "/", "template": "3a", "dataset": "full_job", "rows": null}
SELECT min(t.title) AS movie_title
FROM keyword AS k,
movie_info AS mi,
movie_keyword AS mk,
title AS t,
cast_info AS ci,
movie_companies AS mc,
movie_info_idx AS miidx,
movie_info_idx AS mi_idx
WHERE (k.keyword LIKE '%sequel%' AND mi.info IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Denish', 'Norwegian', 'German') AND t.production_year > 2005 AND ci.note IN ('(voice)', '(voice: Japanese version)', '(voice) (uncredited)', '(voice: English version)') AND mc.note IS NOT NULL AND (mc.note LIKE '%(USA)%' OR mc.note LIKE '%(worldwide)%') AND mi_idx.info < '7.0' AND t.id = mi.movie_id AND t.id = mk.movie_id AND mk.movie_id = mi.movie_id AND k.id = mk.keyword_id AND t.id = mc.movie_id AND t.id = ci.movie_id AND mc.movie_id = ci.movie_id AND mc.movie_id = mi.movie_id AND mi.movie_id = ci.movie_id AND ci.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id AND miidx.movie_id = t.id AND mi.movie_id = miidx.movie_id AND miidx.movie_id = mc.movie_id AND mi.info_type_id = miidx.info_type_id AND miidx.movie_id = ci.movie_id AND miidx.movie_id = mk.movie_id AND t.id = mi_idx.movie_id AND mk.movie_id = mi_idx.movie_id AND miidx.movie_id = mi_idx.movie_id AND mc.movie_id = mi_idx.movie_id AND ci.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id)

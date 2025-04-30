--{"gen": "erase", "time": "/", "template": "generated-d37d6bd9-f177-434b-9aad-b8ac88f813a0", "dataset": "full_job", "rows": null}
SELECT min(t.title) AS movie_title
FROM movie_keyword AS mk,
title AS t,
cast_info AS ci,
movie_companies AS mc,
movie_info AS mi,
movie_info_idx AS miidx
WHERE (t.production_year > 2005 AND ci.note IN ('(voice)', '(voice: Japanese version)', '(voice) (uncredited)', '(voice: English version)') AND mc.note IS NOT NULL AND (mc.note LIKE '%(USA)%' OR mc.note LIKE '%(worldwide)%') AND mi.info IS NOT NULL AND (mi.info LIKE 'Japan:%200%' OR mi.info LIKE 'USA:%200%') AND t.id = mk.movie_id AND t.id = mi.movie_id AND t.id = mc.movie_id AND t.id = ci.movie_id AND mc.movie_id = ci.movie_id AND mc.movie_id = mi.movie_id AND mi.movie_id = ci.movie_id AND ci.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id AND mk.movie_id = mi.movie_id AND miidx.movie_id = t.id AND mi.movie_id = miidx.movie_id AND miidx.movie_id = mc.movie_id AND mi.info_type_id = miidx.info_type_id AND miidx.movie_id = ci.movie_id AND miidx.movie_id = mk.movie_id)

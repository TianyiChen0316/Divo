--{"gen": "erase", "time": "/", "template": "generated-9afe0911-e1eb-4ae2-acc3-a50ba22e341b", "dataset": "full_job", "rows": null}
SELECT min(t.title) AS voiced_movie
FROM aka_name AS an,
char_name AS chn,
cast_info AS ci,
movie_companies AS mc,
movie_info AS mi,
role_type AS rt,
title AS t,
movie_keyword AS mk,
kind_type AS kt,
movie_info_idx AS miidx
WHERE (ci.note IN ('(voice)', '(voice: Japanese version)', '(voice) (uncredited)', '(voice: English version)') AND mc.note IS NOT NULL AND (mc.note LIKE '%(USA)%' OR mc.note LIKE '%(worldwide)%') AND mi.info IS NOT NULL AND (mi.info LIKE 'Japan:%200%' OR mi.info LIKE 'USA:%200%') AND rt.role = 'actress' AND t.production_year BETWEEN 2005 AND 2009 AND kt.kind = 'movie' AND t.id = mi.movie_id AND t.id = mc.movie_id AND t.id = ci.movie_id AND mc.movie_id = ci.movie_id AND mc.movie_id = mi.movie_id AND mi.movie_id = ci.movie_id AND rt.id = ci.role_id AND ci.person_id = an.person_id AND chn.id = ci.person_role_id AND t.id = mk.movie_id AND ci.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id AND mk.movie_id = mi.movie_id AND kt.id = t.kind_id AND miidx.movie_id = t.id AND mi.movie_id = miidx.movie_id AND miidx.movie_id = mc.movie_id AND mi.info_type_id = miidx.info_type_id AND miidx.movie_id = ci.movie_id AND miidx.movie_id = mk.movie_id)

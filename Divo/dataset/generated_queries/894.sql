--{"gen": "erase", "time": "/", "template": "generated-9afe0911-e1eb-4ae2-acc3-a50ba22e341b", "dataset": "full_job", "rows": null}
SELECT min(t.title) AS voiced_movie
FROM cast_info AS ci,
info_type AS it,
movie_companies AS mc,
movie_info AS mi,
role_type AS rt,
title AS t,
keyword AS k,
movie_keyword AS mk,
company_type AS ct,
movie_info_idx AS miidx
WHERE (ci.note IN ('(voice)', '(voice: Japanese version)', '(voice) (uncredited)', '(voice: English version)') AND it.info = 'bottom 10 rank' AND mc.note IS NOT NULL AND (mc.note LIKE '%(USA)%' OR mc.note LIKE '%(worldwide)%') AND mi.info IS NOT NULL AND (mi.info LIKE 'Japan:%200%' OR mi.info LIKE 'USA:%200%') AND rt.role = 'actress' AND t.production_year BETWEEN 2005 AND 2009 AND k.keyword = 'character-name-in-title' AND ct.kind = 'production companies' AND t.id = mi.movie_id AND t.id = mc.movie_id AND t.id = ci.movie_id AND mc.movie_id = ci.movie_id AND mc.movie_id = mi.movie_id AND mi.movie_id = ci.movie_id AND it.id = mi.info_type_id AND rt.id = ci.role_id AND t.id = mk.movie_id AND mk.keyword_id = k.id AND ci.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id AND mk.movie_id = mi.movie_id AND ct.id = mc.company_type_id AND miidx.movie_id = t.id AND it.id = miidx.info_type_id AND mi.movie_id = miidx.movie_id AND miidx.movie_id = mc.movie_id AND mi.info_type_id = miidx.info_type_id AND miidx.movie_id = ci.movie_id AND miidx.movie_id = mk.movie_id)

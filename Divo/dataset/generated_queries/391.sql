--{"gen": "combine", "time": "/", "template": "generated-98525e29-5dc0-45c8-adfa-bbcd55af4c14", "dataset": "full_job", "rows": null}
SELECT min(t.title) AS german_follow_up
FROM company_type AS ct,
movie_companies AS mc,
movie_info AS mi,
movie_keyword AS mk,
movie_link AS ml,
title AS t,
complete_cast AS cc,
comp_cast_type AS cct1,
kind_type AS kt,
aka_name AS an,
char_name AS chn,
cast_info AS ci,
name AS n,
info_type AS it1,
info_type AS it2,
movie_info_idx AS mi_idx
WHERE (ct.kind = 'production companies' AND mc.note IS NULL AND mi.info IN ('Germany', 'German') AND t.production_year BETWEEN 2000 AND 2010 AND cct1.kind = 'cast' AND kt.kind IN ('movie') AND ci.note IN ('(voice)', '(voice: Japanese version)', '(voice) (uncredited)', '(voice: English version)') AND n.name LIKE 'B%' AND it1.info = 'genres' AND it2.info = 'votes' AND ml.movie_id = t.id AND t.id = mk.movie_id AND t.id = mc.movie_id AND mc.company_type_id = ct.id AND mi.movie_id = t.id AND ml.movie_id = mk.movie_id AND ml.movie_id = mc.movie_id AND mk.movie_id = mc.movie_id AND ml.movie_id = mi.movie_id AND mk.movie_id = mi.movie_id AND mc.movie_id = mi.movie_id AND kt.id = t.kind_id AND t.id = cc.movie_id AND mk.movie_id = cc.movie_id AND mi.movie_id = cc.movie_id AND mc.movie_id = cc.movie_id AND cct1.id = cc.status_id AND t.id = ci.movie_id AND mc.movie_id = ci.movie_id AND mi.movie_id = ci.movie_id AND ci.person_id = an.person_id AND chn.id = ci.person_role_id AND n.id = ci.person_id AND ci.movie_id = mk.movie_id AND n.id = an.person_id AND ci.movie_id = cc.movie_id AND ml.movie_id = ci.movie_id AND ml.movie_id = cc.movie_id AND ci.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND mi_idx.movie_id = mk.movie_id AND it1.id = mi.info_type_id AND it2.id = mi_idx.info_type_id AND t.id = mi_idx.movie_id AND ml.movie_id = mi_idx.movie_id AND mc.movie_id = mi_idx.movie_id AND cc.movie_id = mi_idx.movie_id)

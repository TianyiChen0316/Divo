--{"gen": "combine", "time": "/", "template": "generated-2e58b35e-9879-4364-b630-c019dcfd5beb", "dataset": "full_job", "rows": null}
SELECT min(mi_idx.info) AS rating,
min(t.title) AS complete_euro_dark_movie
FROM complete_cast AS cc,
info_type AS it2,
keyword AS k,
kind_type AS kt,
movie_companies AS mc,
movie_info AS mi,
movie_info_idx AS mi_idx,
movie_keyword AS mk,
title AS t,
aka_name AS an,
char_name AS chn,
cast_info AS ci,
info_type AS it,
role_type AS rt
WHERE (it2.info = 'genres' AND k.keyword IN ('murder', 'murder-in-title', 'blood', 'violence') AND kt.kind IN ('movie', 'episode') AND mc.note LIKE '%(Japan)%' AND mc.note LIKE '%(200%)%' AND mi.info IN ('Sweden', 'Germany', 'Swedish', 'German') AND mi_idx.info > '6.5' AND t.production_year > 2005 AND ci.note IN ('(voice)', '(voice: Japanese version)', '(voice) (uncredited)', '(voice: English version)') AND it.info = 'genres' AND rt.role = 'actress' AND kt.id = t.kind_id AND t.id = mi.movie_id AND t.id = mk.movie_id AND t.id = mi_idx.movie_id AND t.id = mc.movie_id AND t.id = cc.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = mi_idx.movie_id AND mk.movie_id = mc.movie_id AND mk.movie_id = cc.movie_id AND mi.movie_id = mi_idx.movie_id AND mi.movie_id = mc.movie_id AND mi.movie_id = cc.movie_id AND mc.movie_id = mi_idx.movie_id AND mc.movie_id = cc.movie_id AND mi_idx.movie_id = cc.movie_id AND k.id = mk.keyword_id AND it2.id = mi_idx.info_type_id AND t.id = ci.movie_id AND mc.movie_id = ci.movie_id AND mi.movie_id = ci.movie_id AND ci.movie_id = mk.movie_id AND it.id = mi.info_type_id AND rt.id = ci.role_id AND ci.person_id = an.person_id AND chn.id = ci.person_role_id AND ci.movie_id = cc.movie_id AND ci.movie_id = mi_idx.movie_id)

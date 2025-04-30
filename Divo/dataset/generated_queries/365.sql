--{"gen": "combine", "time": "/", "template": "generated-419377fb-e28b-410e-a5f5-3389badc8eb9", "dataset": "full_job", "rows": null}
SELECT *
FROM aka_name AS an,
cast_info AS ci,
movie_companies AS mc,
movie_info AS mi,
role_type AS rt,
movie_keyword AS mk,
complete_cast AS cc,
comp_cast_type AS cct1,
comp_cast_type AS cct2,
info_type AS it2,
keyword AS k,
movie_info_idx AS mi_idx,
title AS t
WHERE (ci.note IN ('(voice)', '(voice: Japanese version)', '(voice) (uncredited)', '(voice: English version)') AND mc.note IS NOT NULL AND (mc.note LIKE '%(USA)%' OR mc.note LIKE '%(worldwide)%') AND mi.info IS NOT NULL AND (mi.info LIKE 'Japan:%200%' OR mi.info LIKE 'USA:%200%') AND rt.role = 'actress' AND cct1.kind = 'complete+verified' AND cct2.kind = 'complete' AND it2.info = 'top 250 rank' AND k.keyword IN ('murder', 'murder-in-title', 'blood', 'violence') AND mi_idx.info < '8.5' AND t.production_year > 2005 AND mc.movie_id = ci.movie_id AND mc.movie_id = mi.movie_id AND mi.movie_id = ci.movie_id AND rt.id = ci.role_id AND ci.person_id = an.person_id AND ci.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id AND mk.movie_id = mi.movie_id AND t.id = mi.movie_id AND t.id = mk.movie_id AND t.id = mi_idx.movie_id AND t.id = mc.movie_id AND t.id = cc.movie_id AND mk.movie_id = mi_idx.movie_id AND mk.movie_id = cc.movie_id AND mi.movie_id = mi_idx.movie_id AND mi.movie_id = cc.movie_id AND mc.movie_id = mi_idx.movie_id AND mc.movie_id = cc.movie_id AND mi_idx.movie_id = cc.movie_id AND k.id = mk.keyword_id AND it2.id = mi_idx.info_type_id AND cct1.id = cc.subject_id AND cct2.id = cc.status_id AND t.id = ci.movie_id AND ci.movie_id = cc.movie_id AND ci.movie_id = mi_idx.movie_id)

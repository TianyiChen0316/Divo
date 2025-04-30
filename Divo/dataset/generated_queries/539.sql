--{"gen": "combine", "time": "/", "template": "generated-4814f999-543f-442f-8c61-26075cb5d8a8", "dataset": "full_job", "rows": null}
SELECT min(t.title) AS jap_engl_voiced_movie
FROM aka_name AS an,
char_name AS chn,
cast_info AS ci,
company_name AS cn,
movie_companies AS mc,
movie_info AS mi,
title AS t,
keyword AS k,
movie_keyword AS mk,
name AS n,
aka_title AS at,
movie_info_idx AS mi_idx,
info_type AS it1,
info_type AS it2
WHERE (ci.note IN ('(voice)', '(voice: Japanese version)', '(voice) (uncredited)', '(voice: English version)') AND cn.country_code = '[de]' AND mi.info IS NOT NULL AND (mi.info LIKE 'Japan:%200%' OR mi.info LIKE 'USA:%200%') AND t.production_year > 2000 AND k.keyword = 'computer-animation' AND n.name LIKE 'Z%' AND mi_idx.info < '8.5' AND it1.info = 'genres' AND it2.info = 'rating' AND t.id = mi.movie_id AND t.id = mc.movie_id AND t.id = ci.movie_id AND mc.movie_id = ci.movie_id AND mc.movie_id = mi.movie_id AND mi.movie_id = ci.movie_id AND cn.id = mc.company_id AND ci.person_id = an.person_id AND chn.id = ci.person_role_id AND n.id = ci.person_id AND mk.keyword_id = k.id AND ci.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id AND t.id = mk.movie_id AND mk.movie_id = mi.movie_id AND n.id = an.person_id AND mi.movie_id = at.movie_id AND mc.movie_id = at.movie_id AND t.id = mi_idx.movie_id AND mk.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND mc.movie_id = mi_idx.movie_id AND ci.movie_id = mi_idx.movie_id AND t.id = at.movie_id AND at.movie_id = ci.movie_id AND at.movie_id = mk.movie_id AND at.movie_id = mi_idx.movie_id AND mi.info_type_id = it1.id AND mi_idx.info_type_id = it2.id)

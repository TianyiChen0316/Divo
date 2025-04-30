--{"gen": "combine", "time": "/", "template": "generated-13605b24-ff9b-43a8-bf07-659bc5fcebc4", "dataset": "full_job", "rows": null}
SELECT min(n.name) AS voicing_actress,
min(t.title) AS jap_engl_voiced_movie
FROM aka_name AS an,
cast_info AS ci,
company_name AS cn,
info_type AS it,
movie_companies AS mc,
movie_info AS mi,
name AS n,
role_type AS rt,
title AS t,
aka_name AS a1,
name AS n1,
movie_info_idx AS mi_idx,
movie_keyword AS mk
WHERE (ci.note IN ('(voice)', '(voice: Japanese version)', '(voice) (uncredited)', '(voice: English version)') AND cn.country_code = '[us]' AND it.info = 'release dates' AND mi.info IS NOT NULL AND (mi.info LIKE 'Japan:%200%' OR mi.info LIKE 'USA:%200%') AND n.gender = 'f' AND n.name LIKE '%An%' AND rt.role = 'actress' AND t.production_year > 2000 AND t.id = mi.movie_id AND t.id = mc.movie_id AND t.id = ci.movie_id AND mc.movie_id = ci.movie_id AND mc.movie_id = mi.movie_id AND mi.movie_id = ci.movie_id AND cn.id = mc.company_id AND it.id = mi.info_type_id AND n.id = ci.person_id AND rt.id = ci.role_id AND n.id = an.person_id AND ci.person_id = an.person_id AND a1.person_id = n1.id AND n1.id = ci.person_id AND a1.person_id = ci.person_id AND t.id = mi_idx.movie_id AND t.id = mk.movie_id AND ci.movie_id = mi_idx.movie_id AND ci.movie_id = mk.movie_id AND mi.movie_id = mi_idx.movie_id AND mi.movie_id = mk.movie_id AND mi_idx.movie_id = mk.movie_id AND n.id = n1.id AND n.id = a1.person_id AND mc.movie_id = mk.movie_id AND mc.movie_id = mi_idx.movie_id AND n1.id = an.person_id AND an.person_id = a1.person_id)

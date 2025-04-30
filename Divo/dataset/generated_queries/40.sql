--{"gen": "combine", "time": "/", "template": "19c", "dataset": "full_job", "rows": null}
SELECT min(n.name) AS voicing_actress,
min(t.title) AS jap_engl_voiced_movie
FROM aka_name AS an,
char_name AS chn,
cast_info AS ci,
company_name AS cn,
info_type AS it,
movie_companies AS mc,
movie_info AS mi,
name AS n,
role_type AS rt,
title AS t,
movie_info_idx AS mii,
person_info AS pi,
company_type AS ct,
movie_link AS ml
WHERE (ci.note IN ('(voice)', '(voice: Japanese version)', '(voice) (uncredited)', '(voice: English version)') AND cn.country_code = '[us]' AND it.info = 'release dates' AND mi.info IS NOT NULL AND (mi.info LIKE 'Japan:%200%' OR mi.info LIKE 'USA:%200%') AND n.gender = 'f' AND n.name LIKE '%An%' AND rt.role = 'actress' AND t.production_year > 2000 AND pi.info ILIKE '%india%' AND (mii.info ILIKE '8%' OR mii.info ILIKE '9%' OR mii.info ILIKE '10%') AND ct.kind = 'production companies' AND t.id = mi.movie_id AND t.id = mc.movie_id AND t.id = ci.movie_id AND mc.movie_id = ci.movie_id AND mc.movie_id = mi.movie_id AND mi.movie_id = ci.movie_id AND cn.id = mc.company_id AND it.id = mi.info_type_id AND n.id = ci.person_id AND rt.id = ci.role_id AND n.id = an.person_id AND ci.person_id = an.person_id AND chn.id = ci.person_role_id AND mii.movie_id = ci.movie_id AND n.id = pi.person_id AND ci.person_id = pi.person_id AND mc.company_type_id = ct.id AND ml.movie_id = mc.movie_id AND ml.movie_id = mi.movie_id AND ml.movie_id = ci.movie_id AND ml.movie_id = mii.movie_id AND mc.movie_id = mii.movie_id AND mi.movie_id = mii.movie_id AND t.id = ml.movie_id AND t.id = mii.movie_id AND pi.person_id = an.person_id)

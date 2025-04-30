--{"gen": "combine", "time": "/", "template": "9d", "dataset": "full_job", "rows": null}
SELECT min(an.name) AS alternative_name,
min(chn.name) AS voiced_char_name,
min(n.name) AS voicing_actress,
min(t.title) AS american_movie
FROM aka_name AS an,
char_name AS chn,
cast_info AS ci,
company_name AS cn,
movie_companies AS mc,
name AS n,
role_type AS rt,
title AS t,
info_type AS it1,
info_type AS it2,
movie_info_idx AS mi_idx,
person_info AS pi
WHERE (ci.note IN ('(voice)', '(voice: Japanese version)', '(voice) (uncredited)', '(voice: English version)') AND cn.country_code = '[us]' AND n.gender = 'f' AND rt.role = 'actress' AND lower(it1.info) LIKE 'rating' AND lower(it2.info) LIKE '%birth%' AND lower(pi.info) LIKE '%usa%' AND (lower(mi_idx.info) LIKE '0%' OR lower(mi_idx.info) LIKE '1%' OR lower(mi_idx.info) LIKE '2%') AND ci.movie_id = t.id AND t.id = mc.movie_id AND ci.movie_id = mc.movie_id AND mc.company_id = cn.id AND ci.role_id = rt.id AND n.id = ci.person_id AND chn.id = ci.person_role_id AND an.person_id = n.id AND an.person_id = ci.person_id AND it1.id = mi_idx.info_type_id AND t.id = mi_idx.movie_id AND n.id = pi.person_id AND pi.info_type_id = it2.id AND mi_idx.movie_id = ci.movie_id AND mi_idx.movie_id = mc.movie_id AND ci.person_id = pi.person_id AND pi.person_id = an.person_id)

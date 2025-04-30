--{"gen": "combine", "time": "/", "template": "generated-0429eece-24ae-4120-8ba0-8cf3bb0b6729", "dataset": "full_job", "rows": null}
SELECT min(chn.name) AS voiced_char_name,
min(n.name) AS voicing_actress_name
FROM aka_name AS an,
char_name AS chn,
cast_info AS ci,
movie_companies AS mc,
movie_info AS mi,
movie_keyword AS mk,
name AS n,
role_type AS rt,
title AS t,
keyword AS k,
link_type AS lt,
movie_link AS ml,
person_info AS pi,
company_type AS ct,
company_name AS cn,
info_type AS it1,
movie_info_idx AS mi_idx
WHERE (ci.note IN ('(voice)', '(voice: Japanese version)', '(voice) (uncredited)', '(voice: English version)') AND mi.info IS NOT NULL AND (mi.info LIKE 'Japan:%201%' OR mi.info LIKE 'USA:%201%') AND n.gender = 'f' AND n.name LIKE 'B%' AND rt.role = 'actress' AND lower(k.keyword) LIKE '%fight%' AND lt.link = 'features' AND pi.note = 'Volker Boehm' AND ct.kind = 'production companies' AND cn.country_code <> '[pl]' AND it1.info = 'bottom 10 rank' AND mi_idx.info < '7.0' AND mc.movie_id = ci.movie_id AND mc.movie_id = mi.movie_id AND mc.movie_id = mk.movie_id AND mi.movie_id = ci.movie_id AND mi.movie_id = mk.movie_id AND ci.movie_id = mk.movie_id AND n.id = ci.person_id AND rt.id = ci.role_id AND n.id = an.person_id AND ci.person_id = an.person_id AND chn.id = ci.person_role_id AND mi.movie_id = t.id AND mk.keyword_id = k.id AND mk.movie_id = t.id AND t.id = ci.movie_id AND ml.linked_movie_id = t.id AND lt.id = ml.link_type_id AND pi.person_id = an.person_id AND pi.person_id = ci.person_id AND ci.movie_id = ml.linked_movie_id AND mk.movie_id = ml.linked_movie_id AND mi.movie_id = ml.linked_movie_id AND mi.info_type_id = pi.info_type_id AND t.id = mc.movie_id AND mc.movie_id = ml.linked_movie_id AND n.id = pi.person_id AND ct.id = mc.company_type_id AND mk.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND mc.movie_id = mi_idx.movie_id AND it1.id = mi.info_type_id AND cn.id = mc.company_id AND ci.movie_id = mi_idx.movie_id AND it1.id = pi.info_type_id AND t.id = mi_idx.movie_id AND ml.linked_movie_id = mi_idx.movie_id)

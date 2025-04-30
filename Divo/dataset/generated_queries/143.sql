--{"gen": "erase", "time": "/", "template": "generated-f76050b8-1d3e-4ff6-8fb1-9d17a6415a6d", "dataset": "full_job", "rows": null}
SELECT min(chn.name) AS voiced_char_name,
min(n.name) AS voicing_actress_name,
min(t.title) AS kung_fu_panda
FROM aka_name AS an,
char_name AS chn,
cast_info AS ci,
info_type AS it,
keyword AS k,
movie_companies AS mc,
movie_info AS mi,
movie_keyword AS mk,
name AS n,
role_type AS rt,
title AS t,
company_type AS ct,
info_type AS it1,
movie_info_idx AS mi_idx
WHERE (ci.note IN ('(voice)', '(voice: Japanese version)', '(voice) (uncredited)', '(voice: English version)') AND it.info = 'release dates' AND k.keyword IN ('hero', 'martial-arts', 'hand-to-hand-combat', 'computer-animated-movie') AND mi.info IS NOT NULL AND (mi.info LIKE 'Japan:%201%' OR mi.info LIKE 'USA:%201%') AND n.gender = 'f' AND n.name LIKE '%Bert%' AND rt.role = 'actor' AND t.production_year > 2010 AND t.title LIKE 'Kung Fu Panda%' AND ct.kind = 'production companies' AND it1.info = 'votes' AND mi_idx.info < '3.0' AND t.id = mi.movie_id AND t.id = mc.movie_id AND t.id = ci.movie_id AND t.id = mk.movie_id AND mc.movie_id = ci.movie_id AND mc.movie_id = mi.movie_id AND mc.movie_id = mk.movie_id AND mi.movie_id = ci.movie_id AND mi.movie_id = mk.movie_id AND ci.movie_id = mk.movie_id AND it.id = mi.info_type_id AND n.id = ci.person_id AND rt.id = ci.role_id AND n.id = an.person_id AND ci.person_id = an.person_id AND chn.id = ci.person_role_id AND k.id = mk.keyword_id AND t.id = mi_idx.movie_id AND mi.info_type_id = it1.id AND ct.id = mc.company_type_id AND mc.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND it1.id = it.id AND ci.movie_id = mi_idx.movie_id AND mk.movie_id = mi_idx.movie_id)

--{"gen": "combine", "time": "/", "template": "generated-0c123bef-48b7-4cce-944e-ebf02405482c", "dataset": "full_job", "rows": null}
SELECT min(t.title) AS movie_title
FROM title AS t,
title AS t1,
aka_name AS an,
complete_cast AS cc,
comp_cast_type AS cct2,
cast_info AS ci,
movie_companies AS mc,
movie_info AS mi,
name AS n,
person_info AS pi
WHERE (t.production_year > 2008 AND cct2.kind = 'complete+verified' AND ci.note IN ('(voice)', '(voice) (uncredited)', '(voice: English version)') AND mi.info IS NOT NULL AND (mi.info LIKE 'Japan:%200%' OR mi.info LIKE 'USA:%200%') AND n.gender = 'f' AND n.name LIKE '%An%' AND t.id = t1.id AND t.id = mi.movie_id AND t.id = mc.movie_id AND t.id = ci.movie_id AND t.id = cc.movie_id AND mc.movie_id = ci.movie_id AND mc.movie_id = mi.movie_id AND mc.movie_id = cc.movie_id AND mi.movie_id = ci.movie_id AND mi.movie_id = cc.movie_id AND ci.movie_id = cc.movie_id AND n.id = ci.person_id AND n.id = an.person_id AND ci.person_id = an.person_id AND n.id = pi.person_id AND ci.person_id = pi.person_id AND cct2.id = cc.status_id AND pi.person_id = an.person_id AND mc.movie_id = t1.id AND t1.id = ci.movie_id AND t1.id = cc.movie_id AND t1.id = mi.movie_id)

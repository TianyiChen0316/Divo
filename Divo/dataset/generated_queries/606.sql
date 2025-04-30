--{"gen": "erase", "time": "/", "template": "generated-cabe7075-76e2-47c8-941e-5cf35c09cef3", "dataset": "full_job", "rows": null}
SELECT min(mc.note) AS production_note,
min(t.title) AS movie_title,
min(t.production_year) AS movie_year
FROM movie_companies AS mc,
title AS t,
cast_info AS ci,
movie_keyword AS mk,
name AS n,
movie_link AS ml,
movie_info AS mi,
person_info AS pi
WHERE (mc.note NOT LIKE '%(as Metro-Goldwyn-Mayer Pictures)%' AND t.production_year > 2008 AND ci.note LIKE '%(voice)%' AND ci.note LIKE '%(uncredited)%' AND mi.info IS NOT NULL AND (mi.info LIKE 'Japan:%200%' OR mi.info LIKE 'USA:%200%') AND t.id = mc.movie_id AND t.id = ci.movie_id AND ci.movie_id = mc.movie_id AND n.id = ci.person_id AND t.id = mk.movie_id AND ci.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id AND ml.movie_id = t.id AND ml.movie_id = mk.movie_id AND ml.movie_id = mc.movie_id AND ml.movie_id = ci.movie_id AND t.id = mi.movie_id AND mc.movie_id = mi.movie_id AND mi.movie_id = ci.movie_id AND ci.person_id = pi.person_id AND ml.movie_id = mi.movie_id AND mk.movie_id = mi.movie_id AND n.id = pi.person_id)

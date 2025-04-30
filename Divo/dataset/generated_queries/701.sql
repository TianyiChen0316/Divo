--{"gen": "erase", "time": "/", "template": "generated-d70a221e-d62c-410b-89b0-0e741caa7162", "dataset": "full_job", "rows": null}
SELECT min(an.name) AS cool_actor_pseudonym,
min(t.title) AS series_named_after_char
FROM aka_name AS an,
cast_info AS ci,
company_name AS cn,
movie_companies AS mc,
movie_keyword AS mk,
name AS n,
title AS t,
movie_info AS mi,
movie_info_idx AS mi_idx,
person_info AS pi
WHERE (cn.country_code = '[us]' AND t.episode_nr >= 50 AND t.episode_nr < 100 AND mi.info IN ('Drama', 'Horror', 'Western', 'Family') AND mi_idx.info > '5.0' AND lower(pi.info) LIKE '%india%' AND an.person_id = n.id AND n.id = ci.person_id AND ci.movie_id = t.id AND t.id = mk.movie_id AND t.id = mc.movie_id AND mc.company_id = cn.id AND an.person_id = ci.person_id AND ci.movie_id = mc.movie_id AND ci.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id AND t.id = mi.movie_id AND t.id = mi_idx.movie_id AND mc.movie_id = mi.movie_id AND mc.movie_id = mi_idx.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND n.id = pi.person_id AND ci.person_id = pi.person_id AND pi.person_id = an.person_id)

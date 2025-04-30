--{"gen": "combine", "time": "/", "template": "generated-63fdd5a4-a308-4d35-8048-d6b92a1d8669", "dataset": "full_job", "rows": null}
SELECT min(t.title) AS hero_movie
FROM cast_info AS ci,
movie_keyword AS mk,
title AS t,
movie_companies AS mc,
movie_info AS mi,
movie_info_idx AS miidx,
keyword AS k,
movie_info_idx AS mi_idx,
name AS n,
person_info AS pi
WHERE (t.production_year > 2000 AND mi.info IN ('Drama', 'Horror', 'Western', 'Family') AND k.keyword LIKE '%sequel%' AND mi_idx.info > '9.0' AND lower(pi.info) LIKE '%india%' AND t.id = mk.movie_id AND t.id = ci.movie_id AND ci.movie_id = mk.movie_id AND t.id = mi.movie_id AND t.id = mc.movie_id AND mi.movie_id = mc.movie_id AND mk.movie_id = mi.movie_id AND mc.movie_id = mk.movie_id AND miidx.movie_id = t.id AND mi.movie_id = miidx.movie_id AND miidx.movie_id = mc.movie_id AND miidx.movie_id = mk.movie_id AND miidx.movie_id = ci.movie_id AND mc.movie_id = ci.movie_id AND ci.movie_id = mi.movie_id AND mk.movie_id = mi_idx.movie_id AND k.id = mk.keyword_id AND ci.person_id = n.id AND n.id = pi.person_id AND ci.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND ci.person_id = pi.person_id AND t.id = mi_idx.movie_id AND miidx.movie_id = mi_idx.movie_id AND mc.movie_id = mi_idx.movie_id)

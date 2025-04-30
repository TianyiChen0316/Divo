--{"gen": "combine", "time": "/", "template": "generated-df06032b-1c29-42a0-89bb-f05893511ef9", "dataset": "full_job", "rows": null}
SELECT min(n.name) AS member_in_charnamed_movie,
min(n.name) AS a1
FROM cast_info AS ci,
company_name AS cn,
keyword AS k,
movie_companies AS mc,
movie_keyword AS mk,
name AS n,
title AS t,
info_type AS it,
movie_info_idx AS mi_idx,
char_name AS chn,
role_type AS rt,
aka_name AS an
WHERE (k.keyword = 'character-name-in-title' AND n.name LIKE 'X%' AND it.info = 'bottom 10 rank' AND rt.role = 'actor' AND n.id = ci.person_id AND ci.movie_id = t.id AND t.id = mk.movie_id AND mk.keyword_id = k.id AND t.id = mc.movie_id AND mc.company_id = cn.id AND ci.movie_id = mc.movie_id AND ci.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id AND mc.movie_id = mi_idx.movie_id AND it.id = mi_idx.info_type_id AND chn.id = ci.person_role_id AND rt.id = ci.role_id AND ci.movie_id = mi_idx.movie_id AND t.id = mi_idx.movie_id AND mk.movie_id = mi_idx.movie_id AND an.person_id = n.id AND an.person_id = ci.person_id)

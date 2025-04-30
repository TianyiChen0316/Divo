--{"gen": "combine", "time": "/", "template": "generated-4d10a538-b64f-4518-acb2-fe0973421fb6", "dataset": "full_job", "rows": null}
SELECT min(an.name) AS cool_actor_pseudonym,
min(t.title) AS series_named_after_char
FROM aka_name AS an,
cast_info AS ci,
company_name AS cn,
keyword AS k,
movie_companies AS mc,
movie_keyword AS mk,
name AS n,
title AS t,
company_type AS ct,
info_type AS it1,
movie_info AS mi,
movie_info_idx AS mi_idx,
char_name AS chn,
info_type AS it,
role_type AS rt
WHERE (cn.country_code = '[us]' AND k.keyword = 'character-name-in-title' AND it1.info = 'countries' AND mi.info IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Danish', 'Norwegian', 'German', 'USA', 'American') AND mi_idx.info < '8.5' AND it.info = 'release dates' AND rt.role = 'actress' AND an.person_id = n.id AND n.id = ci.person_id AND ci.movie_id = t.id AND t.id = mk.movie_id AND mk.keyword_id = k.id AND t.id = mc.movie_id AND mc.company_id = cn.id AND an.person_id = ci.person_id AND ci.movie_id = mc.movie_id AND ci.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id AND t.id = mi.movie_id AND t.id = mi_idx.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND mi.movie_id = mc.movie_id AND mc.movie_id = mi_idx.movie_id AND it1.id = mi.info_type_id AND ct.id = mc.company_type_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND it.id = mi.info_type_id AND rt.id = ci.role_id AND chn.id = ci.person_role_id AND it1.id = it.id)

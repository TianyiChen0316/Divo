--{"gen": "combine", "time": "/", "template": "generated-fd0e9541-1844-4898-a887-79bc8ad7f4ba", "dataset": "full_job", "rows": null}
SELECT n.name
FROM title AS t,
name AS n,
cast_info AS ci,
movie_info AS mi,
info_type AS it1,
info_type AS it2,
person_info AS pi,
aka_name AS an,
movie_companies AS mc,
role_type AS rt,
movie_info_idx AS mi_idx,
company_name AS cn,
keyword AS k,
movie_keyword AS mk
WHERE (it1.id = 3 AND (mi.info ILIKE '%romance%' OR mi.info ILIKE '%action%') AND it2.info ILIKE '%count%' AND pi.info ILIKE '%usa%' AND rt.role = 'actress' AND cn.country_code = '[us]' AND k.keyword = 'character-name-in-title' AND t.id = ci.movie_id AND t.id = mi.movie_id AND ci.movie_id = mi.movie_id AND ci.person_id = n.id AND it1.id = mi.info_type_id AND pi.person_id = n.id AND pi.person_id = ci.person_id AND pi.info_type_id = it2.id AND t.id = mc.movie_id AND mc.movie_id = ci.movie_id AND mc.movie_id = mi.movie_id AND rt.id = ci.role_id AND n.id = an.person_id AND ci.person_id = an.person_id AND pi.person_id = an.person_id AND ci.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND it2.id = mi_idx.info_type_id AND mi_idx.info_type_id = pi.info_type_id AND t.id = mi_idx.movie_id AND mc.movie_id = mi_idx.movie_id AND t.id = mk.movie_id AND mk.keyword_id = k.id AND mc.company_id = cn.id AND ci.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = mi_idx.movie_id)
 group by n.name order by count(*) desc
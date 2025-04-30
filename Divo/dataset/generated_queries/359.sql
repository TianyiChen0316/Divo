--{"gen": "combine", "time": "/", "template": "generated-63a9600f-a8a5-4963-8967-174a897b0ff8", "dataset": "full_job", "rows": null}
SELECT min(cn.name)
FROM cast_info AS ci,
char_name AS cn,
aka_name AS an,
char_name AS chn,
movie_companies AS mc,
info_type AS it,
movie_link AS ml,
name AS n,
person_info AS pi,
title AS t,
movie_info AS mi,
movie_info_idx AS mi_idx
WHERE (ci.role_id = 2 AND mc.note IS NOT NULL AND (mc.note LIKE '%(USA)%' OR mc.note LIKE '%(worldwide)%') AND it.info = 'mini biography' AND n.name_pcode_cf BETWEEN 'A' AND 'F' AND pi.note IS NOT NULL AND mi.info IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Danish', 'Norwegian', 'German', 'USA', 'American') AND mi_idx.info < '8.5' AND cn.id = ci.person_role_id AND ci.movie_id = mc.movie_id AND mc.company_id = cn.id AND chn.id = ci.person_role_id AND an.person_id = ci.person_id AND cn.id = chn.id AND mc.company_id = chn.id AND mc.company_id = ci.person_role_id AND n.id = an.person_id AND n.id = pi.person_id AND ci.person_id = n.id AND it.id = pi.info_type_id AND pi.person_id = an.person_id AND pi.person_id = ci.person_id AND ci.movie_id = ml.linked_movie_id AND mc.movie_id = ml.linked_movie_id AND ci.movie_id = t.id AND t.id = mc.movie_id AND t.id = mi.movie_id AND t.id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND mi.movie_id = mc.movie_id AND mc.movie_id = mi_idx.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND t.id = ml.linked_movie_id AND mi.movie_id = ml.linked_movie_id AND ml.linked_movie_id = mi_idx.movie_id AND (n.gender = 'm' OR (n.gender = 'f' AND n.name LIKE 'A%')))

--{"gen": "combine", "time": "/", "template": "generated-82383e3a-b267-409d-8d10-689c7a293736", "dataset": "full_job", "rows": null}
SELECT count(*)
FROM title AS t,
movie_keyword AS mk,
info_type AS it,
movie_info AS mi,
cast_info AS ci,
company_name AS cn,
info_type AS it2,
movie_companies AS mc,
movie_info_idx AS mi_idx
WHERE (it.id = 3 AND lower(mi.info) LIKE '%action%' AND ci.note IN ('(writer)', '(head writer)', '(written by)', '(story)', '(story editor)') AND cn.name LIKE 'Lionsgate%' AND it2.info = 'votes' AND mc.note LIKE '%(Blu-ray)%' AND it.id = mi.info_type_id AND mi.movie_id = t.id AND mk.movie_id = t.id AND mk.movie_id = mi.movie_id AND t.id = mi_idx.movie_id AND t.id = ci.movie_id AND t.id = mc.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND ci.movie_id = mk.movie_id AND ci.movie_id = mc.movie_id AND mi.movie_id = mi_idx.movie_id AND mi.movie_id = mc.movie_id AND mi_idx.movie_id = mk.movie_id AND mi_idx.movie_id = mc.movie_id AND mk.movie_id = mc.movie_id AND it2.id = mi_idx.info_type_id AND cn.id = mc.company_id)

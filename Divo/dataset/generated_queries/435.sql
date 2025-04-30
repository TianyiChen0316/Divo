--{"gen": "erase", "time": "/", "template": "generated-e152a431-b23d-4ca6-a8cd-03ef6cdf75b7", "dataset": "full_job", "rows": null}
SELECT min(mi.info) AS movie_budget,
min(mi_idx.info) AS movie_votes,
min(n.name) AS male_writer
FROM cast_info AS ci,
info_type AS it2,
movie_info AS mi,
movie_info_idx AS mi_idx,
movie_keyword AS mk,
name AS n,
company_name AS cn,
movie_companies AS mc
WHERE (ci.note IN ('(writer)', '(head writer)', '(written by)', '(story)', '(story editor)') AND it2.info = 'votes' AND mi.info = 'Horror' AND n.gender = 'm' AND cn.country_code <> '[us]' AND mc.note NOT LIKE '%(TV)%' AND mc.note LIKE '%(200%)%' AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND ci.movie_id = mk.movie_id AND mi.movie_id = mi_idx.movie_id AND mi.movie_id = mk.movie_id AND mi_idx.movie_id = mk.movie_id AND n.id = ci.person_id AND it2.id = mi_idx.info_type_id AND mk.movie_id = mc.movie_id AND mi.movie_id = mc.movie_id AND mc.movie_id = mi_idx.movie_id AND cn.id = mc.company_id AND mc.movie_id = ci.movie_id)

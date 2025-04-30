--{"gen": "combine", "time": "/", "template": "25b", "dataset": "full_job", "rows": null}
SELECT min(mi.info) AS movie_budget,
min(mi_idx.info) AS movie_votes
FROM cast_info AS ci,
info_type AS it1,
info_type AS it2,
keyword AS k,
movie_info AS mi,
movie_info_idx AS mi_idx,
movie_keyword AS mk,
company_name AS cn,
link_type AS lt,
movie_companies AS mc,
movie_link AS ml,
person_info AS pi,
aka_title AS at
WHERE (ci.note IN ('(writer)', '(head writer)', '(written by)', '(story)', '(story editor)') AND it1.info = 'genres' AND it2.info = 'votes' AND k.keyword IN ('murder', 'blood', 'gore', 'death', 'female-nudity') AND mi.info = 'Horror' AND cn.country_code <> '[pl]' AND (cn.name LIKE '20th Century Fox%' OR cn.name LIKE 'Twentieth Century Fox%') AND mc.note IS NOT NULL AND pi.info ILIKE '%199%' AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND ci.movie_id = mk.movie_id AND mi.movie_id = mi_idx.movie_id AND mi.movie_id = mk.movie_id AND mi_idx.movie_id = mk.movie_id AND it1.id = mi.info_type_id AND it2.id = mi_idx.info_type_id AND k.id = mk.keyword_id AND lt.id = ml.link_type_id AND mc.company_id = cn.id AND ml.movie_id = mk.movie_id AND ml.movie_id = mc.movie_id AND mk.movie_id = mc.movie_id AND ml.movie_id = mi.movie_id AND mc.movie_id = mi.movie_id AND mc.movie_id = at.movie_id AND mc.movie_id = ci.movie_id AND at.movie_id = ci.movie_id AND at.movie_id = mk.movie_id AND at.movie_id = mi.movie_id AND ci.person_id = pi.person_id AND ml.movie_id = at.movie_id AND ml.movie_id = ci.movie_id AND ml.movie_id = mi_idx.movie_id AND mc.movie_id = mi_idx.movie_id AND at.movie_id = mi_idx.movie_id)

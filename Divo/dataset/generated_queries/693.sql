--{"gen": "erase", "time": "/", "template": "generated-a7479705-78c7-4e45-89f2-8b08eea0b308", "dataset": "full_job", "rows": null}
SELECT min(mi.info) AS movie_budget,
min(mi_idx.info) AS movie_votes
FROM cast_info AS ci,
info_type AS it1,
info_type AS it2,
keyword AS k,
movie_info AS mi,
movie_info_idx AS mi_idx,
movie_keyword AS mk,
person_info AS pi,
aka_name AS an,
info_type AS it,
movie_companies AS mc
WHERE (ci.note IN ('(writer)', '(head writer)', '(written by)', '(story)', '(story editor)') AND it1.info = 'genres' AND it2.info = 'votes' AND k.keyword IN ('murder', 'blood', 'gore', 'death', 'female-nudity') AND mi.info = 'Horror' AND pi.info ILIKE '%india%' AND it.info = 'rating' AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND ci.movie_id = mk.movie_id AND mi.movie_id = mi_idx.movie_id AND mi.movie_id = mk.movie_id AND mi_idx.movie_id = mk.movie_id AND it1.id = mi.info_type_id AND it2.id = mi_idx.info_type_id AND k.id = mk.keyword_id AND pi.person_id = ci.person_id AND pi.info_type_id = it2.id AND mc.movie_id = ci.movie_id AND mc.movie_id = mi.movie_id AND it.id = mi.info_type_id AND ci.person_id = an.person_id AND it1.id = it.id AND pi.person_id = an.person_id AND mc.movie_id = mk.movie_id AND mc.movie_id = mi_idx.movie_id AND mi_idx.info_type_id = pi.info_type_id)

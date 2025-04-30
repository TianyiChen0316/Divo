--{"gen": "combine", "time": "/", "template": "18b", "dataset": "full_job", "rows": null}
SELECT min(mi.info) AS movie_budget,
min(mi_idx.info) AS movie_votes
FROM cast_info AS ci,
info_type AS it1,
movie_info AS mi,
movie_info_idx AS mi_idx,
name AS n,
company_type AS ct,
movie_companies AS mc,
movie_keyword AS mk,
aka_title AS at,
aka_name AS an,
role_type AS rt
WHERE (ci.note IN ('(writer)', '(head writer)', '(written by)', '(story)', '(story editor)') AND it1.info = 'genres' AND mi.info IN ('Horror', 'Thriller') AND mi.note IS NULL AND mi_idx.info > '8.0' AND n.gender IS NOT NULL AND n.gender = 'f' AND ct.kind = 'production companies' AND mc.note LIKE '%(theatrical)%' AND rt.role = 'actress' AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND n.id = ci.person_id AND it1.id = mi.info_type_id AND ct.id = mc.company_type_id AND ci.movie_id = mc.movie_id AND ci.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = at.movie_id AND mi.movie_id = mc.movie_id AND mi.movie_id = at.movie_id AND mc.movie_id = at.movie_id AND at.movie_id = ci.movie_id AND rt.id = ci.role_id AND ci.person_id = an.person_id AND mc.movie_id = mi_idx.movie_id AND at.movie_id = mi_idx.movie_id AND mk.movie_id = mi_idx.movie_id AND n.id = an.person_id)

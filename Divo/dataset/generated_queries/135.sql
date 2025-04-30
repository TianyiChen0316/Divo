--{"gen": "erase", "time": "/", "template": "generated-5fa5fd95-d672-4af0-adcc-f8c1eb8c38eb", "dataset": "full_job", "rows": null}
SELECT min(miidx.info) AS rating
FROM company_type AS ct,
info_type AS it,
info_type AS it2,
movie_companies AS mc,
movie_info AS mi,
movie_info_idx AS miidx,
cast_info AS ci,
movie_info_idx AS mi_idx,
movie_keyword AS mk,
person_info AS pi,
aka_name AS an,
role_type AS rt
WHERE (ct.kind = 'production companies' AND it.info = 'rating' AND it2.info = 'release dates' AND ci.note IN ('(writer)', '(head writer)', '(written by)', '(story)', '(story editor)') AND pi.info ILIKE '%india%' AND rt.role = 'costume designer' AND it2.id = mi.info_type_id AND ct.id = mc.company_type_id AND it.id = miidx.info_type_id AND mi.movie_id = miidx.movie_id AND mi.movie_id = mc.movie_id AND miidx.movie_id = mc.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND ci.movie_id = mk.movie_id AND mi.movie_id = mi_idx.movie_id AND mi.movie_id = mk.movie_id AND mi_idx.movie_id = mk.movie_id AND it2.id = mi_idx.info_type_id AND pi.person_id = ci.person_id AND pi.info_type_id = it2.id AND mc.movie_id = ci.movie_id AND rt.id = ci.role_id AND ci.person_id = an.person_id AND pi.person_id = an.person_id AND mc.movie_id = mk.movie_id AND mc.movie_id = mi_idx.movie_id AND mi_idx.info_type_id = pi.info_type_id AND miidx.info_type_id = mi.info_type_id AND miidx.info_type_id = mi_idx.info_type_id AND miidx.info_type_id = pi.info_type_id AND miidx.info_type_id = it2.id AND mi.info_type_id = mi_idx.info_type_id AND mi.info_type_id = it.id AND mi.info_type_id = pi.info_type_id AND mi_idx.info_type_id = it.id AND it.id = pi.info_type_id AND it.id = it2.id AND miidx.movie_id = ci.movie_id AND miidx.movie_id = mk.movie_id AND miidx.movie_id = mi_idx.movie_id)

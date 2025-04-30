--{"gen": "combine", "time": "/", "template": "1a", "dataset": "full_job", "rows": null}
SELECT min(mc.note) AS production_note
FROM company_type AS ct,
info_type AS it,
movie_companies AS mc,
movie_info_idx AS mi_idx,
cast_info AS ci,
keyword AS k,
movie_keyword AS mk,
movie_info AS mi,
person_info AS pi
WHERE (ct.kind = 'production companies' AND it.info = 'top 250 rank' AND mc.note NOT LIKE '%(as Metro-Goldwyn-Mayer Pictures)%' AND (mc.note LIKE '%(co-production)%' OR mc.note LIKE '%(presents)%') AND ci.role_id = 2 AND k.keyword LIKE '%sequel%' AND lower(pi.info) LIKE '%india%' AND lower(mi.info) LIKE '%usa%' AND ct.id = mc.company_type_id AND mc.movie_id = mi_idx.movie_id AND it.id = mi_idx.info_type_id AND mk.movie_id = mi_idx.movie_id AND k.id = mk.keyword_id AND ci.movie_id = mk.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND mk.movie_id = mi.movie_id AND mi.movie_id = mi_idx.movie_id AND ci.person_id = pi.person_id AND mc.movie_id = ci.movie_id AND mc.movie_id = mk.movie_id AND mc.movie_id = mi.movie_id)

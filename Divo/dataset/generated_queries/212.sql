--{"gen": "erase", "time": "/", "template": "generated-adcfbe94-3e24-4c14-9784-f16a01c06bb0", "dataset": "full_job", "rows": null}
SELECT *
FROM cast_info AS ci,
movie_companies AS mc,
movie_info AS mi,
movie_info_idx AS mi_idx,
movie_keyword AS mk,
company_type AS ct,
movie_info_idx AS miidx,
char_name AS chn,
keyword AS k,
info_type AS it
WHERE (mi.info IN ('Drama', 'Horror', 'Western', 'Family') AND mi_idx.info > '7.0' AND ct.kind = 'production companies' AND chn.name IS NOT NULL AND (chn.name LIKE '%man%' OR chn.name LIKE '%Man%') AND it.id = 3 AND lower(k.keyword) LIKE '%fight%' AND ci.movie_id = mc.movie_id AND mi.movie_id = mi_idx.movie_id AND mi.movie_id = mc.movie_id AND mi_idx.movie_id = mc.movie_id AND mk.movie_id = mi.movie_id AND mc.movie_id = mk.movie_id AND mk.movie_id = mi_idx.movie_id AND ct.id = mc.company_type_id AND mi.movie_id = miidx.movie_id AND miidx.movie_id = mc.movie_id AND miidx.movie_id = mk.movie_id AND miidx.movie_id = mi_idx.movie_id AND mk.movie_id = ci.movie_id AND ci.movie_id = mi_idx.movie_id AND chn.id = ci.person_role_id AND miidx.movie_id = ci.movie_id AND ci.movie_id = mi.movie_id AND it.id = mi.info_type_id AND mk.keyword_id = k.id)

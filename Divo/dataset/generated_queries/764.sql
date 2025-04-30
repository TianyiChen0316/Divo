--{"gen": "combine", "time": "/", "template": "generated-5b73c6c1-4a2c-4357-a607-ce97ead251b9", "dataset": "full_job", "rows": null}
SELECT min(chn.name) AS uncredited_voiced_character,
min(t.title)
FROM char_name AS chn,
cast_info AS ci,
role_type AS rt,
movie_companies AS mc,
title AS t,
movie_keyword AS mk,
keyword AS k,
movie_info AS mi,
aka_name AS an,
company_name AS cn,
company_type AS ct,
movie_info_idx AS miidx
WHERE (ci.note NOT LIKE '%(voice)%' AND ci.note NOT LIKE '%(voice)%' AND t.production_year BETWEEN 2005 AND 2008 AND k.keyword ILIKE '%love%' AND mi.info ILIKE '%romance%' AND cn.country_code = '[us]' AND ct.kind = 'production companies' AND t.id = mc.movie_id AND t.id = ci.movie_id AND ci.movie_id = mc.movie_id AND ci.role_id = rt.id AND chn.id = ci.person_role_id AND mi.movie_id = t.id AND mk.keyword_id = k.id AND mk.movie_id = t.id AND mi.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id AND mc.movie_id = mi.movie_id AND ci.movie_id = mk.movie_id AND ci.movie_id = mi.movie_id AND cn.id = mc.company_id AND ci.person_id = an.person_id AND ct.id = mc.company_type_id AND miidx.movie_id = t.id AND mi.movie_id = miidx.movie_id AND miidx.movie_id = mc.movie_id AND mi.info_type_id = miidx.info_type_id AND miidx.movie_id = ci.movie_id AND miidx.movie_id = mk.movie_id)

--{"gen": "erase", "time": "/", "template": "generated-237a1ae1-c982-4a18-a75f-402edc803013", "dataset": "full_job", "rows": null}
SELECT count(*)
FROM movie_keyword AS mk,
keyword AS k,
info_type AS it,
movie_info AS mi,
aka_name AS an,
cast_info AS ci,
company_name AS cn,
movie_companies AS mc,
name AS n,
char_name AS chn,
role_type AS rt
WHERE (it.id = 3 AND lower(k.keyword) LIKE '%fight%' AND lower(mi.info) LIKE '%action%' AND ci.note IN ('(voice)', '(voice: Japanese version)', '(voice) (uncredited)', '(voice: English version)') AND cn.country_code = '[jp]' AND n.gender = 'f' AND n.name LIKE '%An%' AND rt.role = 'writer' AND it.id = mi.info_type_id AND mk.keyword_id = k.id AND mk.movie_id = mi.movie_id AND mc.movie_id = ci.movie_id AND mc.movie_id = mi.movie_id AND mi.movie_id = ci.movie_id AND cn.id = mc.company_id AND n.id = ci.person_id AND n.id = an.person_id AND ci.person_id = an.person_id AND mc.movie_id = mk.movie_id AND ci.movie_id = mk.movie_id AND rt.id = ci.role_id AND chn.id = ci.person_role_id)

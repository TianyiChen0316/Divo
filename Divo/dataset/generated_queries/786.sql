--{"gen": "combine", "time": "/", "template": "generated-e86b9562-f0a3-4d8f-b22c-1def5d0d7c11", "dataset": "full_job", "rows": null}
SELECT *
FROM movie_companies AS mc,
complete_cast AS cc,
cast_info AS ci,
movie_info AS mi,
person_info AS pi,
role_type AS rt,
company_name AS cn,
keyword AS k,
movie_keyword AS mk
WHERE (ci.note IN ('(voice)', '(voice) (uncredited)', '(voice: English version)') AND mi.info IS NOT NULL AND (mi.info LIKE 'Japan:%200%' OR mi.info LIKE 'USA:%200%') AND rt.role = 'actress' AND cn.country_code = '[us]' AND k.keyword = 'character-name-in-title' AND mc.movie_id = ci.movie_id AND mc.movie_id = mi.movie_id AND mc.movie_id = cc.movie_id AND mi.movie_id = ci.movie_id AND mi.movie_id = cc.movie_id AND ci.movie_id = cc.movie_id AND rt.id = ci.role_id AND ci.person_id = pi.person_id AND cn.id = mc.company_id AND mk.keyword_id = k.id AND mc.movie_id = mk.movie_id AND ci.movie_id = mk.movie_id AND cc.movie_id = mk.movie_id AND mk.movie_id = mi.movie_id)

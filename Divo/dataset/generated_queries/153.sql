--{"gen": "combine", "time": "/", "template": "generated-c098eabd-294a-4ebc-b0c0-9d7ea7b934df", "dataset": "full_job", "rows": null}
SELECT min(n.name)
FROM cast_info AS ci,
name AS n,
person_info AS pi,
company_name AS cn,
keyword AS k,
movie_companies AS mc,
movie_keyword AS mk,
title AS t
WHERE (pi.info ILIKE '%india%' AND cn.country_code = '[de]' AND k.keyword = 'character-name-in-title' AND t.episode_nr >= 5 AND t.episode_nr < 100 AND ci.person_id = n.id AND n.id = pi.person_id AND ci.person_id = pi.person_id AND ci.movie_id = t.id AND t.id = mk.movie_id AND mk.keyword_id = k.id AND t.id = mc.movie_id AND mc.company_id = cn.id AND ci.movie_id = mc.movie_id AND ci.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id)

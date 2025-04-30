--{"gen": "erase", "time": "/", "template": "generated-a64a0f4e-5175-412b-8b5e-7dd089073556", "dataset": "full_job", "rows": null}
SELECT min(t.title) AS series_named_after_char
FROM cast_info AS ci,
company_name AS cn,
keyword AS k,
movie_companies AS mc,
movie_keyword AS mk,
title AS t
WHERE (cn.country_code = '[us]' AND k.keyword = 'character-name-in-title' AND t.episode_nr < 100 AND ci.movie_id = t.id AND t.id = mk.movie_id AND mk.keyword_id = k.id AND t.id = mc.movie_id AND mc.company_id = cn.id AND ci.movie_id = mc.movie_id AND ci.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id)

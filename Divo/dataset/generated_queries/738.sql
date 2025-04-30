--{"gen": "erase", "time": "/", "template": "generated-869be7c0-dd52-48bc-97ae-fe73250c5773", "dataset": "full_job", "rows": null}
SELECT *
FROM cast_info AS ci,
company_name AS cn,
keyword AS k,
movie_companies AS mc,
movie_keyword AS mk
WHERE (cn.country_code = '[de]' AND k.keyword = 'character-name-in-title' AND mk.keyword_id = k.id AND mc.company_id = cn.id AND ci.movie_id = mc.movie_id AND ci.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id)

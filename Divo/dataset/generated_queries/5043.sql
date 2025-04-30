--{"gen": "erase", "time": "/", "template": "2a", "dataset": "full_job", "rows": null}
SELECT *
FROM company_name AS cn,
keyword AS k,
movie_companies AS mc,
movie_keyword AS mk
WHERE (cn.country_code = '[ru]' AND k.keyword = 'character-name-in-title' AND cn.id = mc.company_id AND mk.keyword_id = k.id AND mc.movie_id = mk.movie_id)

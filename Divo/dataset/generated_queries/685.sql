--{"gen": "erase", "time": "/", "template": "generated-3dd84907-1e24-4d49-8af1-2f2b9701e387", "dataset": "full_job", "rows": null}
SELECT *
FROM cast_info AS ci,
keyword AS k,
movie_companies AS mc,
movie_keyword AS mk
WHERE (k.keyword = 'character-name-in-title' AND mk.keyword_id = k.id AND ci.movie_id = mc.movie_id AND ci.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id)

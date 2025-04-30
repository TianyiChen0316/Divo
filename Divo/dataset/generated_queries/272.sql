--{"gen": "erase", "time": "/", "template": "generated-96695ab7-19a6-44f6-9a5d-4c04b1403a0f", "dataset": "full_job", "rows": null}
SELECT *
FROM cast_info AS ci,
keyword AS k,
movie_companies AS mc,
movie_keyword AS mk
WHERE (k.keyword = 'character-name-in-title' AND mk.keyword_id = k.id AND ci.movie_id = mc.movie_id AND ci.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id)

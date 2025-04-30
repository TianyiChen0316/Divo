--{"gen": "erase", "time": "/", "template": "generated-3f57070a-c13a-46b9-a1b7-57578f889f7e", "dataset": "full_job", "rows": null}
SELECT *
FROM keyword AS k,
movie_keyword AS mk,
cast_info AS ci,
char_name AS chn
WHERE (k.keyword = 'character-name-in-title' AND ci.role_id = 1 AND mk.keyword_id = k.id AND chn.id = ci.person_role_id AND ci.movie_id = mk.movie_id)

--{"gen": "erase", "time": "/", "template": "generated-ce38bb0f-5305-40a0-bb9e-bea4e49dd814", "dataset": "full_job", "rows": null}
SELECT min(n.name) AS actor_name
FROM cast_info AS ci,
movie_keyword AS mk,
name AS n
WHERE (n.name LIKE '%Downey%Robert%' AND ci.movie_id = mk.movie_id AND n.id = ci.person_id)

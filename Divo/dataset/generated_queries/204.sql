--{"gen": "erase", "time": "/", "template": "generated-4a41215d-fcd8-4e47-8ad0-40ebe133ad0e", "dataset": "full_job", "rows": null}
SELECT min(n.name) AS actor_name
FROM cast_info AS ci,
movie_keyword AS mk,
name AS n
WHERE (n.name LIKE '%Bert%' AND ci.movie_id = mk.movie_id AND n.id = ci.person_id)

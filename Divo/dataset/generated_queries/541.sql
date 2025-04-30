--{"gen": "erase", "time": "/", "template": "17d", "dataset": "full_job", "rows": null}
SELECT min(n.name) AS member_in_charnamed_movie
FROM cast_info AS ci,
company_name AS cn,
movie_companies AS mc,
movie_keyword AS mk,
name AS n
WHERE (n.name LIKE '%Yo%' AND n.id = ci.person_id AND mc.company_id = cn.id AND ci.movie_id = mc.movie_id AND ci.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id)

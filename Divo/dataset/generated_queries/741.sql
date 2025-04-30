--{"gen": "erase", "time": "/", "template": "generated-d280a0bb-4e75-4efe-ad90-0d80eb6e3083", "dataset": "full_job", "rows": null}
SELECT min(n.name) AS member_in_charnamed_movie,
min(n.name) AS a1
FROM cast_info AS ci,
company_name AS cn,
movie_companies AS mc,
movie_keyword AS mk,
name AS n
WHERE (n.name LIKE 'X%' AND n.id = ci.person_id AND mc.company_id = cn.id AND ci.movie_id = mc.movie_id AND ci.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id)

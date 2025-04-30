--{"gen": "erase", "time": "/", "template": "17b", "dataset": "full_job", "rows": null}
SELECT min(n.name) AS member_in_charnamed_movie,
min(n.name) AS a1
FROM cast_info AS ci,
company_name AS cn,
keyword AS k,
movie_companies AS mc,
movie_keyword AS mk,
name AS n
WHERE (k.keyword = 'character-name-in-title' AND n.name LIKE 'Z%' AND n.id = ci.person_id AND mk.keyword_id = k.id AND mc.company_id = cn.id AND ci.movie_id = mc.movie_id AND ci.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id)

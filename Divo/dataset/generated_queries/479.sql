--{"gen": "erase", "time": "/", "template": "generated-8f33f037-ddfa-41dd-b2f1-32210c883bdf", "dataset": "full_job", "rows": null}
SELECT min(n.name) AS member_in_charnamed_american_movie,
min(n.name) AS a1
FROM cast_info AS ci,
keyword AS k,
movie_companies AS mc,
movie_keyword AS mk,
name AS n
WHERE (k.keyword = 'character-name-in-title' AND n.name LIKE 'B%' AND n.id = ci.person_id AND mk.keyword_id = k.id AND ci.movie_id = mc.movie_id AND ci.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id)

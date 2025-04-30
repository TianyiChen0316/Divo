--{"gen": "erase", "time": "/", "template": "generated-86a757d7-fbc7-419c-9f0e-fda6c2a95a96", "dataset": "full_job", "rows": null}
SELECT *
FROM keyword AS k,
movie_keyword AS mk,
aka_name AS an,
cast_info AS ci,
movie_companies AS mc,
name AS n
WHERE (k.keyword LIKE '%sequel%' AND k.id = mk.keyword_id AND an.person_id = n.id AND n.id = ci.person_id AND an.person_id = ci.person_id AND ci.movie_id = mc.movie_id AND ci.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id)

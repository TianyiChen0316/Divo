--{"gen": "erase", "time": "/", "template": "generated-8f4ae498-8f6b-4fce-a116-0281dd5bcd0e", "dataset": "full_job", "rows": null}
SELECT *
FROM keyword AS k,
movie_info AS mi,
movie_keyword AS mk,
cast_info AS ci,
company_name AS cn,
movie_companies AS mc,
name AS n
WHERE (k.keyword LIKE '%sequel%' AND mi.info IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Denish', 'Norwegian', 'German') AND n.name LIKE '%B%' AND mk.movie_id = mi.movie_id AND k.id = mk.keyword_id AND n.id = ci.person_id AND mc.company_id = cn.id AND ci.movie_id = mc.movie_id AND ci.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id AND mc.movie_id = mi.movie_id AND ci.movie_id = mi.movie_id)

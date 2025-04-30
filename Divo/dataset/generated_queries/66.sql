--{"gen": "erase", "time": "/", "template": "generated-df668205-8aaf-4150-a4f2-52b1a368827a", "dataset": "full_job", "rows": null}
SELECT min(an.name) AS cool_actor_pseudonym
FROM aka_name AS an,
cast_info AS ci,
company_name AS cn,
keyword AS k,
movie_companies AS mc,
movie_keyword AS mk,
movie_info AS mi,
link_type AS lt,
movie_link AS ml
WHERE (cn.country_code = '[us]' AND k.keyword = 'character-name-in-title' AND mi.info IN ('Drama', 'Horror', 'Western', 'Family') AND mk.keyword_id = k.id AND mc.company_id = cn.id AND an.person_id = ci.person_id AND ci.movie_id = mc.movie_id AND ci.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id AND mc.movie_id = mi.movie_id AND ci.movie_id = mi.movie_id AND mk.movie_id = mi.movie_id AND lt.id = ml.link_type_id AND ml.movie_id = mk.movie_id AND ml.movie_id = mc.movie_id AND ml.movie_id = ci.movie_id AND ml.movie_id = mi.movie_id)

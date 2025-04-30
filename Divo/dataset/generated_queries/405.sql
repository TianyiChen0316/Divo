--{"gen": "erase", "time": "/", "template": "generated-5f2faec6-b662-42ce-b1f7-9bada1d65e3a", "dataset": "full_job", "rows": null}
SELECT min(an.name) AS cool_actor_pseudonym
FROM aka_name AS an,
cast_info AS ci,
keyword AS k,
movie_companies AS mc,
movie_keyword AS mk,
name AS n,
char_name AS chn
WHERE (k.keyword = 'character-name-in-title' AND an.person_id = n.id AND n.id = ci.person_id AND mk.keyword_id = k.id AND an.person_id = ci.person_id AND ci.movie_id = mc.movie_id AND ci.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id AND chn.id = ci.person_role_id)

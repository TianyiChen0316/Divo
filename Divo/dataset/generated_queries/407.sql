--{"gen": "erase", "time": "/", "template": "generated-4fe1da8e-b1fb-46ec-bddd-35565bae9530", "dataset": "full_job", "rows": null}
SELECT min(chn.name) AS uncredited_voiced_character
FROM char_name AS chn,
cast_info AS ci,
movie_companies AS mc,
keyword AS k,
movie_keyword AS mk
WHERE (ci.note NOT LIKE '%(voice)%' AND ci.note LIKE '%(uncredited)%' AND k.keyword = 'character-name-in-title' AND ci.movie_id = mc.movie_id AND chn.id = ci.person_role_id AND mk.keyword_id = k.id AND ci.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id)

--{"gen": "erase", "time": "/", "template": "e2a", "dataset": "full_job", "rows": null}
SELECT min(chn.name) AS uncredited_voiced_character
FROM char_name AS chn,
cast_info AS ci,
movie_companies AS mc
WHERE (ci.note LIKE '%(voice)%' AND ci.note LIKE '%(uncredited)%' AND ci.movie_id = mc.movie_id AND chn.id = ci.person_role_id)

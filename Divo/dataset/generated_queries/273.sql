--{"gen": "erase", "time": "/", "template": "10a", "dataset": "full_job", "rows": null}
SELECT min(chn.name) AS uncredited_voiced_character
FROM char_name AS chn,
cast_info AS ci,
company_name AS cn,
movie_companies AS mc,
role_type AS rt
WHERE (ci.note LIKE '%(voice)%' AND ci.note LIKE '%(uncredited)%' AND cn.country_code = '[ru]' AND rt.role = 'actor' AND ci.movie_id = mc.movie_id AND chn.id = ci.person_role_id AND rt.id = ci.role_id AND cn.id = mc.company_id)

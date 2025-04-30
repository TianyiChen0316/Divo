--{"gen": "erase", "time": "/", "template": "10b", "dataset": "full_job", "rows": null}
SELECT min(chn.name) AS character
FROM char_name AS chn,
cast_info AS ci,
company_type AS ct,
movie_companies AS mc,
role_type AS rt
WHERE (ci.note LIKE '%(producer)%' AND rt.role = 'actor' AND ci.movie_id = mc.movie_id AND chn.id = ci.person_role_id AND rt.id = ci.role_id AND ct.id = mc.company_type_id)

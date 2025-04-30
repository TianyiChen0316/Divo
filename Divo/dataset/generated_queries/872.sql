--{"gen": "erase", "time": "/", "template": "generated-64b491e9-ad86-45fe-9b48-4100d82ffde3", "dataset": "full_job", "rows": null}
SELECT min(cn.name)
FROM cast_info AS ci,
char_name AS cn,
char_name AS chn,
movie_companies AS mc
WHERE (ci.role_id = 2 AND mc.note IS NOT NULL AND (mc.note LIKE '%(USA)%' OR mc.note LIKE '%(worldwide)%') AND cn.id = ci.person_role_id AND ci.movie_id = mc.movie_id AND mc.company_id = cn.id AND chn.id = ci.person_role_id AND cn.id = chn.id AND mc.company_id = chn.id AND mc.company_id = ci.person_role_id)

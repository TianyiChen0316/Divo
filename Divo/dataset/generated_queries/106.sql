--{"gen": "erase", "time": "/", "template": "generated-36db9ae0-020d-4e41-b8c3-7b24c4978b57", "dataset": "full_job", "rows": null}
SELECT min(a1.name) AS writer_pseudo_name
FROM aka_name AS a1,
cast_info AS ci,
company_name AS cn,
movie_companies AS mc,
aka_name AS an,
name AS n,
role_type AS rt
WHERE (cn.country_code = '[us]' AND n.gender = 'f' AND n.name LIKE '%Ang%' AND rt.role = 'actress' AND mc.company_id = cn.id AND a1.person_id = ci.person_id AND ci.movie_id = mc.movie_id AND ci.role_id = rt.id AND n.id = ci.person_id AND an.person_id = n.id AND an.person_id = ci.person_id AND n.id = a1.person_id AND an.person_id = a1.person_id)

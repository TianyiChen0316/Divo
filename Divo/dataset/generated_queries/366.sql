--{"gen": "erase", "time": "/", "template": "generated-c25ed4ee-2807-455a-b35f-1a29ee72960d", "dataset": "full_job", "rows": null}
SELECT min(n.name)
FROM info_type AS it2,
cast_info AS ci,
name AS n,
person_info AS pi
WHERE (lower(it2.info) LIKE '%birth%' AND lower(pi.info) LIKE '%usa%' AND ci.person_id = n.id AND n.id = pi.person_id AND pi.info_type_id = it2.id AND pi.person_id = ci.person_id)

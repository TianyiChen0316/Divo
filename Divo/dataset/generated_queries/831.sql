--{"gen": "erase", "time": "/", "template": "generated-82524f0c-7785-4636-9210-0d4c17d80e00", "dataset": "full_job", "rows": null}
SELECT min(n.name)
FROM movie_info_idx AS mii,
cast_info AS ci,
name AS n,
person_info AS pi
WHERE (pi.info ILIKE '%india%' AND (mii.info ILIKE '8%' OR mii.info ILIKE '9%' OR mii.info ILIKE '10%') AND mii.movie_id = ci.movie_id AND ci.person_id = n.id AND n.id = pi.person_id AND ci.person_id = pi.person_id)

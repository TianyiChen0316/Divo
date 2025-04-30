--{"gen": "erase", "time": "/", "template": "generated-d31b865d-9c7a-464d-831b-a9c1701ff1ea", "dataset": "full_job", "rows": null}
SELECT min(chn.name) AS character
FROM char_name AS chn,
cast_info AS ci,
movie_companies AS mc,
info_type AS it2,
movie_info AS mi
WHERE (ci.note NOT LIKE '%(voice)%' AND it2.info = 'top 250 rank' AND ci.movie_id = mc.movie_id AND chn.id = ci.person_role_id AND it2.id = mi.info_type_id AND mi.movie_id = mc.movie_id AND ci.movie_id = mi.movie_id)

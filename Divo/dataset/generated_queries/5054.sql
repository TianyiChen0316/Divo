--{"gen": "erase", "time": "/", "template": "generated-4ebe598c-c5a1-4f41-a6e5-84b938aa961d", "dataset": "full_job", "rows": null}
SELECT *
FROM movie_info AS mi,
complete_cast AS cc,
cast_info AS ci,
movie_companies AS mc,
name AS n,
person_info AS pi
WHERE (mi.info IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Denish', 'Norwegian', 'German') AND ci.note IN ('(voice)', '(voice) (uncredited)', '(voice: English version)') AND n.gender = 'm' AND n.name LIKE '%B%' AND mc.movie_id = ci.movie_id AND mc.movie_id = mi.movie_id AND mc.movie_id = cc.movie_id AND mi.movie_id = ci.movie_id AND mi.movie_id = cc.movie_id AND ci.movie_id = cc.movie_id AND n.id = ci.person_id AND n.id = pi.person_id AND ci.person_id = pi.person_id)

--{"gen": "erase", "time": "/", "template": "generated-b99fe309-995e-471c-91cb-8cae8a41e668", "dataset": "full_job", "rows": null}
SELECT *
FROM movie_companies AS mc,
cast_info AS ci,
movie_info AS mi,
person_info AS pi,
role_type AS rt
WHERE (ci.note IN ('(voice)', '(voice) (uncredited)', '(voice: English version)') AND mi.info IS NOT NULL AND (mi.info LIKE 'Japan:%200%' OR mi.info LIKE 'USA:%200%') AND rt.role = 'actress' AND mc.movie_id = ci.movie_id AND mc.movie_id = mi.movie_id AND mi.movie_id = ci.movie_id AND rt.id = ci.role_id AND ci.person_id = pi.person_id)

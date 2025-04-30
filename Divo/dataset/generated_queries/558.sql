--{"gen": "erase", "time": "/", "template": "generated-0b5c23d4-c45e-4278-b9d4-c796f340d16a", "dataset": "full_job", "rows": null}
SELECT *
FROM aka_name AS an,
cast_info AS ci,
info_type AS it,
movie_companies AS mc,
movie_info AS mi,
role_type AS rt
WHERE (ci.note IN ('(voice)', '(voice: Japanese version)', '(voice) (uncredited)', '(voice: English version)') AND it.info = 'release dates' AND mi.info IS NOT NULL AND (mi.info LIKE 'Japan:%201%' OR mi.info LIKE 'USA:%201%') AND rt.role = 'actress' AND mc.movie_id = ci.movie_id AND mc.movie_id = mi.movie_id AND mi.movie_id = ci.movie_id AND it.id = mi.info_type_id AND rt.id = ci.role_id AND ci.person_id = an.person_id)

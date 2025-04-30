--{"gen": "erase", "time": "/", "template": "generated-aa29013f-227f-49de-9a17-a112c636ba85", "dataset": "full_job", "rows": null}
SELECT *
FROM movie_companies AS mc,
movie_info AS mi,
movie_keyword AS mk,
aka_name AS an,
char_name AS chn,
cast_info AS ci,
company_name AS cn
WHERE (mi.info IN ('Drama', 'Horror', 'Western', 'Family') AND ci.note IN ('(voice)', '(voice: Japanese version)', '(voice) (uncredited)', '(voice: English version)') AND cn.country_code = '[ru]' AND mi.movie_id = mc.movie_id AND mk.movie_id = mi.movie_id AND mc.movie_id = mk.movie_id AND ci.movie_id = mc.movie_id AND mc.company_id = cn.id AND chn.id = ci.person_role_id AND an.person_id = ci.person_id AND ci.movie_id = mk.movie_id AND ci.movie_id = mi.movie_id)

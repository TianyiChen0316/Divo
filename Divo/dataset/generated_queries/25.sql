--{"gen": "erase", "time": "/", "template": "24a", "dataset": "full_job", "rows": null}
SELECT min(chn.name) AS voiced_char_name
FROM aka_name AS an,
char_name AS chn,
cast_info AS ci,
company_name AS cn,
info_type AS it,
keyword AS k,
movie_companies AS mc,
movie_info AS mi,
movie_keyword AS mk,
role_type AS rt
WHERE (ci.note IN ('(voice)', '(voice: Japanese version)', '(voice) (uncredited)', '(voice: English version)') AND cn.country_code = '[us]' AND it.info = 'release dates' AND k.keyword IN ('hero', 'martial-arts', 'hand-to-hand-combat') AND mi.info IS NOT NULL AND (mi.info LIKE 'Japan:%201%' OR mi.info LIKE 'USA:%201%') AND rt.role = 'actress' AND mc.movie_id = ci.movie_id AND mc.movie_id = mi.movie_id AND mc.movie_id = mk.movie_id AND mi.movie_id = ci.movie_id AND mi.movie_id = mk.movie_id AND ci.movie_id = mk.movie_id AND cn.id = mc.company_id AND it.id = mi.info_type_id AND rt.id = ci.role_id AND ci.person_id = an.person_id AND chn.id = ci.person_role_id AND k.id = mk.keyword_id)

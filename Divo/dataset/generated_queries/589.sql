--{"gen": "combine", "time": "/", "template": "e5a", "dataset": "full_job", "rows": null}
SELECT min(mc.note) AS production_note
FROM movie_companies AS mc,
aka_name AS an,
cast_info AS ci,
name AS n,
person_info AS pi,
char_name AS chn,
movie_info AS mi
WHERE (mc.note NOT LIKE '%(as Metro-Goldwyn-Mayer Pictures)%' AND an.name LIKE '%a%' AND n.name_pcode_cf LIKE 'D%' AND n.gender = 'f' AND pi.note = 'Volker Boehm' AND mi.info ILIKE '%romance%' AND n.id = an.person_id AND n.id = pi.person_id AND ci.person_id = n.id AND pi.person_id = an.person_id AND pi.person_id = ci.person_id AND an.person_id = ci.person_id AND ci.movie_id = mc.movie_id AND chn.id = ci.person_role_id AND mc.movie_id = mi.movie_id AND ci.movie_id = mi.movie_id AND mi.info_type_id = pi.info_type_id)

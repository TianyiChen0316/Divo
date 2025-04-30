--{"gen": "erase", "time": "/", "template": "generated-06ba17df-5e26-46d8-bab1-89fc02040a34", "dataset": "full_job", "rows": null}
SELECT min(n.name) AS writer
FROM cast_info AS ci,
keyword AS k,
movie_keyword AS mk,
name AS n,
movie_companies AS mc,
movie_info_idx AS miidx,
aka_name AS an,
char_name AS chn,
role_type AS rt,
info_type AS it2,
person_info AS pi
WHERE (ci.note IN ('(writer)', '(head writer)', '(written by)', '(story)', '(story editor)') AND k.keyword IN ('murder', 'violence', 'blood', 'gore', 'death', 'female-nudity', 'hospital') AND n.gender = 'm' AND rt.role = 'costume designer' AND lower(it2.info) LIKE '%birth%' AND lower(pi.info) LIKE '%japan%' AND ci.movie_id = mk.movie_id AND n.id = ci.person_id AND k.id = mk.keyword_id AND miidx.movie_id = mc.movie_id AND miidx.movie_id = ci.movie_id AND miidx.movie_id = mk.movie_id AND mc.movie_id = ci.movie_id AND mc.movie_id = mk.movie_id AND ci.role_id = rt.id AND chn.id = ci.person_role_id AND an.person_id = n.id AND an.person_id = ci.person_id AND pi.person_id = n.id AND pi.info_type_id = it2.id AND ci.person_id = pi.person_id AND pi.person_id = an.person_id)

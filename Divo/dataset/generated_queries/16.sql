--{"gen": "erase", "time": "/", "template": "generated-ef9cf845-e8bb-490d-9194-7179b0c8348c", "dataset": "full_job", "rows": null}
SELECT min(chn.name) AS voiced_char_name
FROM char_name AS chn,
cast_info AS ci,
keyword AS k,
movie_companies AS mc,
movie_info AS mi,
movie_keyword AS mk,
role_type AS rt
WHERE (ci.note IN ('(voice)', '(voice: Japanese version)', '(voice) (uncredited)', '(voice: English version)') AND k.keyword IN ('hero', 'martial-arts', 'hand-to-hand-combat', 'computer-animated-movie') AND mi.info IS NOT NULL AND (mi.info LIKE 'Japan:%201%' OR mi.info LIKE 'USA:%201%') AND rt.role = 'actress' AND mc.movie_id = ci.movie_id AND mc.movie_id = mi.movie_id AND mc.movie_id = mk.movie_id AND mi.movie_id = ci.movie_id AND mi.movie_id = mk.movie_id AND ci.movie_id = mk.movie_id AND rt.id = ci.role_id AND chn.id = ci.person_role_id AND k.id = mk.keyword_id)

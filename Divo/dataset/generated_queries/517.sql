--{"gen": "erase", "time": "/", "template": "generated-3c39f59d-1f44-4485-925d-ed9ee8fa4910", "dataset": "full_job", "rows": null}
SELECT min(mi_idx.info) AS rating
FROM info_type AS it,
keyword AS k,
movie_info_idx AS mi_idx,
movie_keyword AS mk,
aka_name AS an,
cast_info AS ci,
movie_companies AS mc,
movie_info AS mi
WHERE (it.info = 'rating' AND k.keyword LIKE '%sequel%' AND mi_idx.info > '9.0' AND ci.note IN ('(voice)', '(voice: Japanese version)', '(voice) (uncredited)', '(voice: English version)') AND mi.info IS NOT NULL AND (mi.info LIKE 'Japan:%200%' OR mi.info LIKE 'USA:%200%') AND mk.movie_id = mi_idx.movie_id AND k.id = mk.keyword_id AND it.id = mi_idx.info_type_id AND mc.movie_id = ci.movie_id AND mc.movie_id = mi.movie_id AND mi.movie_id = ci.movie_id AND it.id = mi.info_type_id AND ci.person_id = an.person_id AND mc.movie_id = mk.movie_id AND mc.movie_id = mi_idx.movie_id AND ci.movie_id = mk.movie_id AND ci.movie_id = mi_idx.movie_id AND mk.movie_id = mi.movie_id AND mi.movie_id = mi_idx.movie_id AND mi.info_type_id = mi_idx.info_type_id)

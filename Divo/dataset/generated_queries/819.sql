--{"gen": "combine", "time": "/", "template": "generated-2e79c21d-9b05-4357-ba1b-17a400fdfa1b", "dataset": "full_job", "rows": null}
SELECT *
FROM movie_companies AS mc,
movie_info AS mi,
cast_info AS ci,
company_name AS cn,
info_type AS it,
keyword AS k,
movie_keyword AS mk
WHERE (mc.note NOT LIKE '%(TV)%' AND mc.note LIKE '%(USA)%' AND mi.info IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Denish', 'Norwegian', 'German', 'USA', 'American') AND ci.note IN ('(voice)', '(voice: Japanese version)', '(voice) (uncredited)', '(voice: English version)') AND cn.country_code = '[us]' AND it.info = 'release dates' AND k.keyword IN ('hero', 'martial-arts', 'hand-to-hand-combat') AND mc.movie_id = mi.movie_id AND mc.movie_id = ci.movie_id AND mc.movie_id = mk.movie_id AND mi.movie_id = ci.movie_id AND mi.movie_id = mk.movie_id AND ci.movie_id = mk.movie_id AND cn.id = mc.company_id AND it.id = mi.info_type_id AND k.id = mk.keyword_id)

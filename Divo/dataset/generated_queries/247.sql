--{"gen": "erase", "time": "/", "template": "generated-0fbed2ff-9113-4ae6-a7d0-b068aa75530c", "dataset": "full_job", "rows": null}
SELECT min(mi.info) AS release_date
FROM aka_title AS at,
company_type AS ct,
info_type AS it1,
movie_companies AS mc,
movie_info AS mi,
cast_info AS ci,
name AS n,
title AS t
WHERE (it1.info = 'release dates' AND mc.note LIKE '%(200%)%' AND mc.note LIKE '%(worldwide)%' AND mi.note LIKE '%internet%' AND mi.info LIKE 'USA:% 200%' AND ci.note = '(voice: English version)' AND n.name LIKE '%Yo%' AND n.name NOT LIKE '%Yu%' AND t.production_year BETWEEN 2006 AND 2007 AND (t.title LIKE 'One Piece%' OR t.title LIKE 'Dragon Ball Z%') AND mi.movie_id = mc.movie_id AND mi.movie_id = at.movie_id AND mc.movie_id = at.movie_id AND it1.id = mi.info_type_id AND ct.id = mc.company_type_id AND n.id = ci.person_id AND ci.movie_id = t.id AND t.id = mc.movie_id AND ci.movie_id = mc.movie_id AND t.id = at.movie_id AND t.id = mi.movie_id AND at.movie_id = ci.movie_id AND ci.movie_id = mi.movie_id)

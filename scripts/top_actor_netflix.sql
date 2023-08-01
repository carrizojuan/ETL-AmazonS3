SELECT actor.name, COUNT(content_has_actor.Content_id) AS appearances
FROM actor
INNER JOIN content_has_actor ON actor.id = content_has_actor.Actor_id
INNER JOIN content ON content_has_actor.Content_id = content.id
WHERE content.platform = 'Netflix'
GROUP BY actor.name
ORDER BY appearances DESC
LIMIT 1
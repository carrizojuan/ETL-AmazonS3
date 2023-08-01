DELIMITER //
CREATE PROCEDURE GetTop5LongestMovies(in year_in INT)
BEGIN
	select title, duration, release_year
    from content
    where type = "Movie" and release_year = year_in
    order by duration desc
    limit 5;
END //
DELIMITER ;

call GetTop5LongestMovies(2002)
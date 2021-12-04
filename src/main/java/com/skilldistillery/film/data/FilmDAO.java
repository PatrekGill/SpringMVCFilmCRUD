package com.skilldistillery.film.data;

import java.util.List;

import com.skilldistillery.film.entities.Actor;
import com.skilldistillery.film.entities.Film;

public interface FilmDAO {
	public Film findFilmById(int filmId);

	public Actor findActorById(int actorId);

	public List<Actor> findActorsByFilmId(int filmId);
	
	public Film updateFilmData(int filmId, String column, Object newValue);
	
	public Film createFilm(Film film);

	public boolean deleteFilm(Film film);
	
	public String getLanguageNameById(int languageId);
	
	public List<Film> findFilmsByKeyword(String keyword);
	
}

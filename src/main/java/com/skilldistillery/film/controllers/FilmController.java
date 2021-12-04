package com.skilldistillery.film.controllers;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.film.data.FilmDAO;
import com.skilldistillery.film.entities.Actor;
import com.skilldistillery.film.entities.Film;
import com.skilldistillery.film.misc.Pair;

@Controller
public class FilmController {
	
	@Autowired
	private FilmDAO filmDao;
	
	/* ------------------------------------------------
	    home.do
	------------------------------------------------ */	
	@RequestMapping({"/", "home.do"})
	public String home(Model model) {
		model.addAttribute("TEST", "Hello, Spring MVC");
		
		return "home";
	}
	
	/* ------------------------------------------------
	    GetFilmData.do (GET)
	------------------------------------------------ */
	@RequestMapping(path="GetFilmData.do", method=RequestMethod.GET)
	public String getFilmById(Integer filmId, Model model) {
		
		Film f = filmDao.findFilmById(filmId);
		if (f != null) {			
			model.addAttribute("film",f);
		}
		
		List<Actor> actorsInFilm = filmDao.findActorsByFilmId(filmId);
		if (actorsInFilm != null) {
			model.addAttribute("actors", actorsInFilm);
		}
		
		return "film";
	}
	
	/* ------------------------------------------------
	    GetFilms.do (POST)
	------------------------------------------------ */
	@RequestMapping(path="GetFilmData.do", method=RequestMethod.POST)
	public String updateFilmData(
			Integer id,
			String title,
			String description,
			Integer releaseYear,
			Integer languageId,
			Integer rentalDuration,
			Double rentalRate,
			Integer length,
			Double replacementCost,
			String rating,
			Model model
		) {
		
		List<Pair<String, Object>> updateInstructions = new ArrayList<>();
		updateInstructions.add(new Pair<>("title", "\'" + title + "\'")); //will show as literal string in SQL statement now
		updateInstructions.add(new Pair<>("description","\'" + description + "\'"));
		updateInstructions.add(new Pair<>("release_year", releaseYear));
		updateInstructions.add(new Pair<>("rental_duration", rentalDuration));
		updateInstructions.add(new Pair<>("rental_rate", rentalRate));
		updateInstructions.add(new Pair<>("length", length));
		updateInstructions.add(new Pair<>("language_id", languageId));
		updateInstructions.add(new Pair<>("replacement_cost", replacementCost));
		updateInstructions.add(new Pair<>("rating", "\'" + rating + "\'"));
		
		List<String> failureNotices = new ArrayList<>();
		Film film = null;
		for (Pair<String, Object> pair : updateInstructions) {
			Film filmTemp = filmDao.updateFilmData(id, pair.left(), pair.right());
			
			if (filmTemp == null) {
				String notice = "Failure on update of column: " + pair.left();
				failureNotices.add(notice);
			}
			film = filmTemp;
		}
		
		
		if (film != null) {
			model.addAttribute("film",film);
			
		}

		if (!failureNotices.isEmpty()) {
			model.addAttribute("failureNotices",failureNotices);
			
		}
		
		
		return "film";
	}
	
	
	/* ------------------------------------------------
	    GetFilms.do (GET)
	------------------------------------------------ */
	@RequestMapping(path="GetFilms.do", method=RequestMethod.GET)
	public String getFilmByKeyword(String keyword, Model model) {
		List<Film> foundFilms;
		foundFilms = filmDao.findFilmsByKeyword(keyword);
		
		model.addAttribute("films", foundFilms);
		
		return "films";
	}
	
	
	/* ------------------------------------------------
	    addFilm.do (GET)
	------------------------------------------------ */
	@RequestMapping(path="addFilm.do", method=RequestMethod.GET)
	public String addFilm()	{
		return "addFilm";
	}
	
	
	/* ------------------------------------------------
	    addFilm.do (POST)
	------------------------------------------------ */	
	@RequestMapping(path="addFilm.do", method=RequestMethod.POST)
	public String addFilm(
			Integer id,
			String title,
			String description,
			Integer releaseYear,
			Integer languageId,
			Integer rentalDuration,
			Double rentalRate,
			Integer length,
			Double replacementCost,
			String rating,
			Model model
		) {
		Film film = null;
		try {
			film = new Film(
					-1,	title, description, releaseYear, languageId, 
					rentalDuration, rentalRate, length, replacementCost, 
					rating, ""
				);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		if (film != null) {
			film = filmDao.addFilmToDatabase(film);
			model.addAttribute("film",film);	
			model.addAttribute("newlyCreated",true);
			return "film";
			
		} else {
			model.addAttribute("error","A failure occurred while attempting to add the film to the database");
			return "addFilm";
		}
		
	}
	
	/* ------------------------------------------------
	    deleteFilm.do (POST)
	------------------------------------------------ */
	@RequestMapping(path="deleteFilm.do", method=RequestMethod.POST)
	public String deleteFilm(Integer filmId, Model model) {
		Film film = filmDao.findFilmById(filmId);
		boolean deleted = false;
		if (film != null) {
			deleted = filmDao.deleteFilm(film);			
		}
		
		String view;
		if (deleted) {
			model.addAttribute("deletedFilmId",filmId);	
			view = "home";
			
		} else {
			model.addAttribute("error","A failure occurred while attempting to delete the film from the database");
			model.addAttribute("film",film);
			view = "film";
			
		}
		
		return view;
	}
	/* ------------------------------------------------
    EditFilm.do (GET)
	------------------------------------------------ */
	@RequestMapping(path="EditFilm.do", method=RequestMethod.GET)
	public String editFilm(int id, Model model) {
		Film f = filmDao.findFilmById(id);
		model.addAttribute("film", f);
		
		
		
		return "filmEdit";
	}
}

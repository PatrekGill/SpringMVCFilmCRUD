package com.skilldistillery.film.controllers;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.film.data.FilmDAO;
import com.skilldistillery.film.entities.Film;
import com.skilldistillery.film.misc.Pair;

@Controller
public class FilmController {
	
	@Autowired
	private FilmDAO filmDao;
	
	@RequestMapping({"/", "home.do"})
	public String home(Model model) {
		model.addAttribute("TEST", "Hello, Spring MVC");
		
		return "home";
	}
	
	@RequestMapping(path="GetFilmData.do", method=RequestMethod.GET)
	public String getFilmById(String filmId, Model model) {
		int filmIdInt;
		
		try {
			filmIdInt = Integer.parseInt(filmId);
		} catch (Exception e) {
			filmIdInt = -1;
		}
		
		Film f = filmDao.findFilmById(filmIdInt);
		if (f != null) {			
			model.addAttribute("film",f);
		}
		
		
		return "film";
	}

	@RequestMapping(path="GetFilmData.do", method=RequestMethod.POST)
	public String updateFilmData(
			String id,
			String title,
			String description,
			String releaseYear,
			String languageId,
			String rentalDuration,
			String rentalRate,
			String length,
			String replacementCost,
			String rating,
			Model model
		) {
		
		List<Pair<String, String>> updateInstructions = new ArrayList<>();
		updateInstructions.add(new Pair<>("title", "\'" + title + "\'")); //will show as literal string in SQL statement now
		updateInstructions.add(new Pair<>("description","\'" + description + "\'"));
		updateInstructions.add(new Pair<>("release_year", releaseYear));
		updateInstructions.add(new Pair<>("rental_duration", rentalDuration));
		updateInstructions.add(new Pair<>("rental_rate", rentalRate));
		updateInstructions.add(new Pair<>("length", length));
		updateInstructions.add(new Pair<>("language_id", languageId));
		updateInstructions.add(new Pair<>("replacement_cost", replacementCost));
		updateInstructions.add(new Pair<>("rating", "\'" + rating + "\'"));
		
		
		int filmId;
		List<String> failureNotices = new ArrayList<>();
		try {
			filmId = Integer.parseInt(id);
						
		} catch (Exception e) {
			filmId = -1;
			failureNotices.add("Failure during update");
			
		}
		
		Film film = null;
		for (Pair<String, String> pair : updateInstructions) {
			Film filmTemp = filmDao.updateFilmData(filmId, pair.left(), pair.right());
			
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
	
	
	@RequestMapping(path="GetFilms.do", method=RequestMethod.GET)
	public String getFilmByKeyword(String keyword, Model model) {
		List<Film> foundFilms;
		foundFilms = filmDao.findFilmsByKeyword(keyword);
		
		model.addAttribute("films", foundFilms);
		
		return "films";
	}
	
	@RequestMapping(path="addFilm.do", method=RequestMethod.GET)
	public String addFilm()	{
		return "addFilm";
	}
	
	@RequestMapping(path="addFilm.do", method=RequestMethod.POST)
	public String addFilm(
			String id,
			String title,
			String description,
			String releaseYear,
			String languageId,
			String rentalDuration,
			String rentalRate,
			String length,
			String replacementCost,
			String rating,
			Model model
		) {
		
		Film film = null;
		try {
			int releaseYearInt = Integer.parseInt(releaseYear);
			int languageIdInt = Integer.parseInt(languageId);
			int rentalDurationInt = Integer.parseInt(rentalDuration);
			int lengthInt = Integer.parseInt(length);
			double rentalRateDouble = Double.parseDouble(rentalRate);
			double replacementCostDouble = Double.parseDouble(replacementCost);
			
			film = new Film(
					-1,	title, description, releaseYearInt, languageIdInt, 
					rentalDurationInt, rentalRateDouble, lengthInt, replacementCostDouble, 
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
	public String deleteFilm(String filmId, Model model) {
	
		int filmIdInt;
		try {
			filmIdInt = Integer.parseInt(filmId);
			
		} catch (Exception e) {
			e.printStackTrace();
			filmIdInt = -1;
			
		}
		
		Film film = filmDao.findFilmById(filmIdInt);
		boolean deleted = false;
		if (film != null) {
			film = filmDao.addFilmToDatabase(film);
			deleted = filmDao.deleteFilm(film);			
		}
		
		
		String view;
		if (deleted) {
			model.addAttribute("deletedFilmId",filmIdInt);	
			view = "home";
			
		} else {
			model.addAttribute("error","A failure occurred while attempting to delete the film from the database");
			model.addAttribute("film",film);
			view = "film";
			
		}
		
		return view;
	}
}

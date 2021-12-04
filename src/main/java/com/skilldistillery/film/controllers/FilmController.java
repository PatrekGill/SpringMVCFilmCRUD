package com.skilldistillery.film.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.film.data.FilmDAO;
import com.skilldistillery.film.entities.Film;

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
	@RequestMapping(path="GetFilmData.do",params = "keyword", method=RequestMethod.GET)
	public String getFilmByKeyword(String keyword, Model model) {
		List<Film> foundFilms;
		foundFilms = filmDao.findFilmsByKeyword(keyword);
		
		model.addAttribute("films", foundFilms);
		
		return "films";
	}
}

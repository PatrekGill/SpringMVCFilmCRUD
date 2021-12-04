package com.skilldistillery.film.entities;

import java.util.List;
import java.util.Objects;

import com.skilldistillery.film.data.FilmDAO;
import com.skilldistillery.film.data.FilmDaoJdbcImpl;


public class Film {
	private int id;
	private String title;
	private String description;
	private int releaseYear;
	private int languageId;
	private int rentalDuration;
	private double rentalRate;
	private int length;
	private double replacementCost;
	private String rating;
	private String specialFeatures;
	private List<Actor> actors;
	private String language;
	
	public Film(
			int id, String title, String description, int releaseYear, int languageId, int rentalDuration,
			double rentalRate, int length, double replacementCost, String rating, String specialFeatures
		) {
		this.id = id;
		this.title = title;
		this.description = description;
		this.releaseYear = releaseYear;
		this.languageId = languageId;
		this.rentalDuration = rentalDuration;
		this.rentalRate = rentalRate;
		this.length = length;
		this.replacementCost = replacementCost;
		this.rating = rating;
		this.specialFeatures = specialFeatures;
		
		FilmDAO dao = new FilmDaoJdbcImpl();
		this.language = dao.getLanguageNameById(languageId);
		this.actors = dao.findActorsByFilmId(id);
	}
	
	/* ------------------------------------------------
	    get/set film ID
	------------------------------------------------ */
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	
	/* ------------------------------------------------
	    get/set Title
	------------------------------------------------ */
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	
	/* ------------------------------------------------
	    get/set Description
	------------------------------------------------ */
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	
	/* ------------------------------------------------
	    get/set Release Year
	------------------------------------------------ */	
	public int getReleaseYear() {
		return releaseYear;
	}
	public void setReleaseYear(int releaseYear) {
		this.releaseYear = releaseYear;
	}
	
	
	/* ------------------------------------------------
	    get/set Language ID
	------------------------------------------------ */
	public int getLanguageId() {
		return languageId;
	}
	public void setLanguageId(int languageId) {
		FilmDAO dao = new FilmDaoJdbcImpl();
		String language = dao.getLanguageNameById(languageId);
		this.language = language;
		this.languageId = languageId;
	}
	public String getLanguage() {
		return language;
	}
	
	
	
	/* ------------------------------------------------
	    get/set Title
	------------------------------------------------ */
	public int getRentalDuration() {
		return rentalDuration;
	}
	public void setRentalDuration(int rentalDuration) {
		this.rentalDuration = rentalDuration;
	}
	
	
	/* ------------------------------------------------
	    get/set Length
	------------------------------------------------ */
	public int getLength() {
		return length;
	}
	public void setLength(int length) {
		this.length = length;
	}
	
	/* ------------------------------------------------
		get/set Rental Rate
	------------------------------------------------ */	
	public double getRentalRate() {
		return rentalRate;
	}
	public void setRentalRate(double rentalRate) {
		this.rentalRate = rentalRate;
	}
	
	
	
	/* ------------------------------------------------
	    get/set Replacement Cost
	------------------------------------------------ */	
	public double getReplacementCost() {
		return replacementCost;
	}
	public void setReplacementCost(double replacementCost) {
		this.replacementCost = replacementCost;
	}
	
	
	/* ------------------------------------------------
	    get/set Rating
	------------------------------------------------ */
	public String getRating() {
		return rating;
	}
	public void setRating(String rating) {
		this.rating = rating;
	}
	
	
	/* ------------------------------------------------
	    get Special Features List
	------------------------------------------------ */
	public String getSpecialFeatures() {
		return specialFeatures;
	}

	
	
	
	
	/* ------------------------------------------------
	   	Misc
	------------------------------------------------ */
	@Override
	public String toString() {
		String string = "Film Info:";
		string += "\n\tTitle: " + title;
		string += "\n\tID: " + id;
		string += "\n\tDescription: " + description;
		string += "\n\tRelease Year: " + releaseYear;
		string += "\n\tLanguage ID: " + languageId;
		string += "\n\tLanguage: " + language;
		string += "\n\tRental Duration: " + rentalDuration;
		string += "\n\tRental Rate: " + rentalRate;
		string += "\n\tLength: " + length;
		string += "\n\tReplacement Cost: " + replacementCost;
		string += "\n\tRating: " + rating;
		string += "\n\tSpecial Features: " + specialFeatures;
		
		if (actors != null && actors.size() > 1) {
			string += "\n\tActors:";
			for (Actor actor : actors) {
				string += "\n\t\t" + actor;
			}
		}	
		
		return string;
	}
	
	
	@Override
	public int hashCode() {
		return Objects.hash(actors, description, id, language, languageId, length, rating, releaseYear, rentalDuration,
				rentalRate, replacementCost, specialFeatures, title);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Film other = (Film) obj;
		return Objects.equals(actors, other.actors) && Objects.equals(description, other.description) && id == other.id
				&& Objects.equals(language, other.language) && languageId == other.languageId && length == other.length
				&& Objects.equals(rating, other.rating) && releaseYear == other.releaseYear
				&& rentalDuration == other.rentalDuration
				&& Double.doubleToLongBits(rentalRate) == Double.doubleToLongBits(other.rentalRate)
				&& Double.doubleToLongBits(replacementCost) == Double.doubleToLongBits(other.replacementCost)
				&& Objects.equals(specialFeatures, other.specialFeatures) && Objects.equals(title, other.title);
	}

	public String toStringSimple() {
		String string = "Film Info:";
		string += "\n\tID: " + id;
		string += "\n\tTitle: " + title;
		string += "\n\tRelease Year: " + releaseYear;
		string += "\n\tDescription: " + description;
		string += "\n\tRating: " + rating;
		string += "\n\tLanguage: " + language;
		string += "\n\tActors:";
		
		if (actors != null && actors.size() > 0) {
			for (Actor actor : actors) {
				string += "\n\t\t" + actor;
			}
		} else {
			string += "\n\t\tNone";
		}
		
		return string;
	}
}

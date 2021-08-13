package com.duttech.lookify_crud.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.duttech.lookify_crud.models.Lookify;
import com.duttech.lookify_crud.services.LookifyService;


@Controller
public class LookifyController {
	private final LookifyService lookServe;
	
	public LookifyController(LookifyService lookServe) {
		this.lookServe = lookServe;
	}
	
	@RequestMapping("/")
	public String index() {
		return "/songs/index.jsp";
	}
	
	@RequestMapping("/dashboard")
	public String dashboard(Model model, @ModelAttribute("search") Lookify search) {
		List<Lookify> songs = lookServe.allSongs();
		model.addAttribute("songs", songs);
		return "/songs/dashboard.jsp";
	}
	
	@RequestMapping("/songs/new")
	public String showNew(@ModelAttribute("songs") Lookify songs) {
		return "songs/new.jsp";
	}
	
	@RequestMapping(value="/new/song", method= RequestMethod.POST)
	public String createNew(@Valid @ModelAttribute("songs") Lookify songs, BindingResult result) {
		if(result.hasErrors()) {
			return"/songs/new.jsp";
		}else {
			lookServe.newSong(songs);
			return"redirect:/dashboard";
		}
		
	}
	
	@RequestMapping("/songs/{id}")
	public String showSong(@PathVariable("id") Long id,Model model) {
		Lookify foundSong = lookServe.findSong(id);
		model.addAttribute("foundSong", foundSong);
		return "/songs/show.jsp";
	}
	
	
	@RequestMapping(value="/delete/{id}", method=RequestMethod.DELETE)
	public String destroySong(@PathVariable("id") Long id) {
		lookServe.deleteSong(id);
		return "redirect:/dashboard";
	}
	
	@RequestMapping(value="/search/artist", method= RequestMethod.POST)
	public String search(@RequestParam("artist") String artist) {
		return "redirect:/show/"+ artist;
	}
	
	@RequestMapping("/show/{artist}")
	public String showArtist(@PathVariable("artist") String artist, Model model, @ModelAttribute("search") Lookify search) {
		List<Lookify> allArtist = lookServe.artistSong(artist);
		model.addAttribute("allArtist", allArtist);
		model.addAttribute("artist", artist);
		return "/songs/artists.jsp";
	}
	
	@RequestMapping("/search/topTen")
	public String topTen(Model model) {
		List<Lookify> topSongs=lookServe.sortSongs();
		model.addAttribute("topSongs", topSongs);
		return"songs/sortlist.jsp";
	}

}



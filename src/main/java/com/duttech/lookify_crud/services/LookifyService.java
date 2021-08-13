package com.duttech.lookify_crud.services;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.duttech.lookify_crud.models.Lookify;
import com.duttech.lookify_crud.repositories.LookifyRepository;

@Service
public class LookifyService {
	private final LookifyRepository lookRepo;
	
	public LookifyService(LookifyRepository lookRepo) {
		this.lookRepo = lookRepo;
	}
	
//	To return all the songs
	public List<Lookify> allSongs(){
		return lookRepo.findAll();
	}
		
//	to create new song
	public Lookify newSong(Lookify song) {
		return lookRepo.save(song);
	}
	
//	to find a song with an id
	
	public Lookify findSong(Long id) {
		Optional<Lookify> optionalSong = lookRepo.findById(id);
		if(optionalSong.isPresent()) {
			return optionalSong.get();
		}else {
			return null;
		}
	}
	
	
	
//	to find a song with artist name
	
	public List<Lookify> artistSong(String artist) {
		return lookRepo.findByArtistContaining(artist);
		
	}
	
//	to update song
	
	public Lookify editSong(Lookify song) {
		return lookRepo.save(song);
	}
	
//	to delete song
	public void deleteSong(Long id) {
		Optional<Lookify> songDeleted = lookRepo.findById(id);
		if(songDeleted.isPresent()) {
			lookRepo.deleteById(id);
		}
	}
	
//	top ten songs
	public List<Lookify> sortSongs() {
		return lookRepo.findTop10ByOrderByRatingDesc();
	}

		
	
	
}

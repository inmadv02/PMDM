import { Component, OnInit } from '@angular/core';
import { Genre, GenreResponse, Movie, MoviesPopularResponse } from 'src/app/models/interfaces/movies-popular.interface';
import { MoviesService } from 'src/app/services/movies.service';

@Component({
  selector: 'app-movies-popular-list',
  templateUrl: './movies-popular-list.component.html',
  styleUrls: ['./movies-popular-list.component.css']
})
export class MoviesPopularListComponent implements OnInit {
  popularMovies: Movie[] = [];
  genero_id!: number;
  listaNueva: Movie[] = [];
  generos: Genre[] = [];

  constructor(private moviesService: MoviesService) { }

  ngOnInit(): void {
    this.moviesService.getPopularMovies().subscribe(popularMoviesResponse => {
      this.popularMovies = popularMoviesResponse.results;
      this.listaNueva = popularMoviesResponse.results;
    });

    this.moviesService.getGenresList().subscribe(genreResponse => {
      this.generos = genreResponse.genres;
    })
  }

  filterMoviesByGenre(){
    this.listaNueva = this.popularMovies;

    this.listaNueva = this.popularMovies.filter(filtrado => filtrado.genre_ids.includes(this.genero_id));
  }

  noFilter() {
    this.listaNueva = this.popularMovies;

  }



}

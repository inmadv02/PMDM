import { Component, OnInit } from '@angular/core';
import { Movie, MoviesPopularResponse } from '../interfaces/movies.interface';
import { MoviesService } from '../services/movies-service';

@Component({
  selector: 'app-movies-popular-list',
  templateUrl: './movies-popular-list.component.html',
  styleUrls: ['./movies-popular-list.component.css']
})
export class MoviesPopularListComponent implements OnInit {

  moviesList : Movie [] = [];

  constructor(private moviesService: MoviesService) { }

  ngOnInit(): void {
    this.getMoviesList();
  }



  getMoviesList() {
    this.moviesService.getPopularMovies().subscribe( resultado => {
      this.moviesList = resultado.results;
      console.log(resultado);
    });
  }

}

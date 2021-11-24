import { Component, OnInit } from '@angular/core';
import { FavoriteMovie } from 'src/app/models/interfaces/favorite.interface';
import { Movie } from 'src/app/models/interfaces/movies-popular.interface';
import { MoviesService } from 'src/app/services/movies.service';
import { environment } from 'src/environments/environment';

@Component({
  selector: 'app-favorite-list',
  templateUrl: './favorite-list.component.html',
  styleUrls: ['./favorite-list.component.css']
})
export class FavoriteListComponent implements OnInit {

  favoriteMovies: FavoriteMovie[] = [];
  fav!: FavoriteMovie;
  movie!: Movie;


  constructor(private moviesService : MoviesService) { }

  ngOnInit(): void {
    this.moviesService.getFavoriteMovies().subscribe(result => {
      this.favoriteMovies = result.results;
      console.log(this.favoriteMovies);
    });
  }

  getMovieImageUrl(movie: Movie) {
    return `${environment.imageBaseUrl}${movie.poster_path}`;
  }

}

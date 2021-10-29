import { Component, Inject, OnInit } from '@angular/core';
import { MAT_DIALOG_DATA } from '@angular/material/dialog';
import { MovieResponse } from 'src/app/interfaces/movie.interface';
import { MoviesService } from 'src/app/service/movies.service';

export interface DialogMovieDetailData{
  movie_id: number;
}

@Component({
  selector: 'app-dialog-movie-detail',
  templateUrl: './dialog-movie-detail.component.html',
  styleUrls: ['./dialog-movie-detail.component.css']
})
export class DialogMovieDetailComponent implements OnInit {

  movie!: MovieResponse;

  constructor( @Inject(MAT_DIALOG_DATA) private data: DialogMovieDetailData,
  private moviesService: MoviesService) { }

  ngOnInit(): void {
    this.moviesService.getMovie(this.data.movie_id).subscribe(movieResult => {
      this.movie = movieResult;
    });
  }

}

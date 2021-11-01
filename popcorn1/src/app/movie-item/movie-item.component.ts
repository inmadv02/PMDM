import { Component, Input, OnInit } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { environment } from 'src/environments/environment';
import { DialogMovieDetailComponent } from '../dialogs/dialog-movie-detail/dialog-movie-detail.component';
import { MovieResponse } from '../interfaces/movie.interface';


@Component({
  selector: 'app-movie-item',
  templateUrl: './movie-item.component.html',
  styleUrls: ['./movie-item.component.css']
})
export class MovieItemComponent implements OnInit {

  @Input() movieInput!: MovieResponse;
  
  constructor(private dialog: MatDialog) { }

  ngOnInit(): void {
  }

  getMovieImageUrl(movie: MovieResponse){
    return `${environment.imageUrl}${movie.poster_path}`;
  }

  openMovieDetailDialog() {
    this.dialog.open(DialogMovieDetailComponent, {
      height: '400px',
      width: '300px',
      data: { movie_id: this.movieInput?.id }
    });
  }

}

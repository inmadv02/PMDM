import { Component, Inject, Input, OnInit } from '@angular/core';
import { MatDialog, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { DialogAddMovieComponent } from 'src/app/dialogs/dialog-add-movie/dialog-add-movie.component';
import { DialogLoginComponent } from 'src/app/dialogs/dialog-login/dialog-login.component';
import { FavoriteDto } from 'src/app/models/dto/favorite.dto';
import { Movie } from 'src/app/models/interfaces/movies-popular.interface';
import { AuthService } from 'src/app/services/auth.service';
import { MoviesService } from 'src/app/services/movies.service';
import { environment } from 'src/environments/environment';

@Component({
  selector: 'app-movie-item',
  templateUrl: './movie-item.component.html',
  styleUrls: ['./movie-item.component.css']
})
export class MovieItemComponent implements OnInit {
  @Input() movieInput!: Movie;
  favorito: FavoriteDto = new FavoriteDto();


  constructor(private dialog : MatDialog, private auth : AuthService, private movieService : MoviesService) { }

  ngOnInit(): void {
  }

  getMovieImageUrl(movie: Movie) {
    return `${environment.imageBaseUrl}${movie.poster_path}`;
  }
  addMovieToList() {
    if(this.auth.isLoggedIn()) {
      this.openDialog();  
    } else {
      this.openLoginDialog();
    }
  }

  openDialog(){
    this.dialog.open(DialogAddMovieComponent, {
      height: '600px',
      width: '800px',
      data: {id: this.movieInput?.id}
    });
  }

  openLoginDialog() {
    this.dialog.open(DialogLoginComponent, {
      height: '300px',
      width: '500px',
      disableClose: true
    });
  }

  addFavoriteMovie() {
    this.favorito.favorite=true;
    this.favorito.media_id=this.movieInput.id;
    return this.movieService.addFavouriteMovie(this.favorito).subscribe(resp => {
      
    });
  }

}

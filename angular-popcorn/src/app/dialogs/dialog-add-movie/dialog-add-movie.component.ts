import { Component, Inject, Input, OnInit } from '@angular/core';
import { MAT_DIALOG_DATA } from '@angular/material/dialog';
import { List } from 'src/app/models/interfaces/list.interface';
import { Movie } from 'src/app/models/interfaces/movies-popular.interface';
import { Media, MoviesService } from 'src/app/services/movies.service';
import { environment } from 'src/environments/environment';

export interface DialogAddMovieComponent{
  id: number;
}

@Component({
  selector: 'app-dialog-add-movie',
  templateUrl: './dialog-add-movie.component.html',
  styleUrls: ['./dialog-add-movie.component.css']
})
export class DialogAddMovieComponent implements OnInit {
  lists : List[] = [];
  movie!: Movie;
  list_id!: number;
  list!: List;
  nombre!: string;
  idioma!: string;
  descripcion!: string;

  constructor(@Inject(MAT_DIALOG_DATA) private data : DialogAddMovieComponent,
  private moviesService: MoviesService) { }

  ngOnInit(): void {
    this.moviesService.getMovieById(this.data.id).subscribe(result => {
      this.movie = result;
    });

    this.moviesService.getMovieLists().subscribe(result2 => { this.lists = result2.results;})

  }

  getMovieImageUrl(movie: Movie) {
    return `${environment.imageBaseUrl}${movie.poster_path}`;
  }

  addMovieToList (){
    return this.moviesService.addMovie(this.list_id, this.movie.id).subscribe();
  }

  
  addNewList() {
    return this.moviesService.addNewList(this.nombre, this.descripcion, this.idioma).subscribe(nuevaLista => {
      this.moviesService.getMovieLists().subscribe(listResponse => {
        this.lists = listResponse.results;
        this.list_id = nuevaLista.id;
    });
  });
   
  }
 
}

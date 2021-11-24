import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { FavoriteDto } from '../models/dto/favorite.dto';
import { FavoriteMoviesResponse, FavoriteResponse } from '../models/interfaces/favorite.interface';
import { List, ListsResponse } from '../models/interfaces/list.interface';
import { GenreResponse, Movie, MoviesPopularResponse } from '../models/interfaces/movies-popular.interface';

const movieUrl = `${environment.apiBaseUrl}`;

const DEFAULT_HEADERS = {
  headers: new HttpHeaders({
    'Content-Type': 'application/json'
  })
};

export class Media {
  media_id : number

  constructor (){
    this.media_id = 0
  }
}

@Injectable({
  providedIn: 'root'
})
export class MoviesService {

  constructor(private http: HttpClient) { }

  getPopularMovies(): Observable<MoviesPopularResponse> {
    return this.http.get<MoviesPopularResponse>(`${movieUrl}/movie/popular?api_key=${environment.apiKey}&language=${environment.defaultLang}`);
  }

  getMovieById(id : number) {
    return this.http.get<Movie>(`${movieUrl}/movie/${id}?api_key=${environment.apiKey}`);
  }

  addMovie(list_id : number, movie_id : number) {
    return this.http.post<Movie>(`${movieUrl}/list/${list_id}/add_item?api_key=${environment.apiKey}&session_id=${localStorage.getItem('session_id')}`, {media_id : movie_id});
  } 

  getMovieLists() : Observable<ListsResponse> {
    return this.http.get<ListsResponse>(`${movieUrl}/account/null/lists?api_key=${environment.apiKey}&session_id=${localStorage.getItem('session_id')}`);
  }

  addNewList(nombre : string, descripcion : string, idioma : string) : Observable<List>{
    return this.http.post<List>(`${movieUrl}/list?api_key=${environment.apiKey}&session_id=${localStorage.getItem('session_id')}`, {name : nombre, description : descripcion, language: idioma});
  }

  addFavouriteMovie(dto : FavoriteDto) {
    return this.http.post<FavoriteDto>(`${movieUrl}/account/null/favorite?api_key=${environment.apiKey}&session_id=${localStorage.getItem('session_id')}`, dto, DEFAULT_HEADERS);
  }

  getFavoriteMovies() : Observable<FavoriteMoviesResponse> {
    return this.http.get<FavoriteMoviesResponse>(`${movieUrl}/account/{account_id}/favorite/movies?api_key=${environment.apiKey}&sort_by=created_at.asc&page=1&session_id=${localStorage.getItem('session_id')}`);
  }

  getGenresList() : Observable<GenreResponse> {
    return this.http.get<GenreResponse>(`${movieUrl}/genre/movie/list?api_key=${environment.apiKey}&session_id=${localStorage.getItem('session_id')}`);
  }
  
}

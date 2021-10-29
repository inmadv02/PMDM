import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
<<<<<<< HEAD:popcorn/src/app/service/movies.service.ts
import { MovieResponse } from '../interfaces/movie.interface';
import { MoviesPopularResponse } from '../interfaces/movies.interface';
import { Person, PopularPeopleResponse } from '../interfaces/people.interface';
=======
import { MoviesPopularResponse } from '../interfaces/movies.interface';
>>>>>>> master:popcorn1/src/app/services/movies-service.ts

const API_BASE_URL = `${environment.apiBaseUrl}`;

@Injectable({
  providedIn: 'root'
})
export class MoviesService {

  constructor(private http: HttpClient) { }

<<<<<<< HEAD:popcorn/src/app/service/movies.service.ts
  getPopularMovies(): Observable<MoviesPopularResponse> {
    return this.http.get<MoviesPopularResponse>(`${API_BASE_URL}/movie/popular?api_key=${environment.apiKey}`);
  }
  
  getPopularPeople(): Observable<PopularPeopleResponse> {
    return this.http.get<PopularPeopleResponse>(`${API_BASE_URL}/person/popular?api_key=${environment.apiKey}`);
  }

  getMovie(id: number) {
    return this.http.get<MovieResponse>(`${API_BASE_URL}/movie/${id}?api_key=${environment.apiKey}`);
=======
  getMoviesList(): Observable<MoviesPopularResponse> {
    return this.http.get<MoviesPopularResponse>(`${API_BASE_URL}/movie/popular?api_key=${environment.apiKey}`);
>>>>>>> master:popcorn1/src/app/services/movies-service.ts
  }

  
}

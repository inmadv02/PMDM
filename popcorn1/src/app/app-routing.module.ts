import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Routes } from '@angular/router';
import { MoviesPopularListComponent } from './movies-popular-list/movies-popular-list.component';
import { PopularPeopleComponent } from './popular-people-list/popular-people-list.component';
import { PersonDetailsComponent } from './person-details/person-details.component';

const routes: Routes = [
  { path: 'movies', component: MoviesPopularListComponent },
  { path: 'actors', component: PopularPeopleComponent },
  { path: 'person/:person_id', component: PersonDetailsComponent}

];

@NgModule({
  declarations: [],
  imports: [
    CommonModule
  ]
})
export class AppRoutingModule { }

import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { MoviesPopularListComponent } from './movies-popular-list/movies-popular-list.component';
import { PopularPeopleComponent } from './popular-people-list/popular-people-list.component';

const routes: Routes = [
  { path: 'movies', component: MoviesPopularListComponent },
  { path: 'actors', component: PopularPeopleComponent }

];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { MoviesPopularListComponent } from './components/movies-popular-list/movies-popular-list.component';
import { FavoriteListComponent } from './shared/favorite-list/favorite-list.component';
import { SessionComponent } from './shared/session/session.component';

const routes: Routes = [
  {path: 'movies', component: MoviesPopularListComponent},
  {path: 'loginsuccess', component: SessionComponent},
  {path: 'favoriteMovies', component: FavoriteListComponent},
  {path: '', pathMatch: 'full', component: MoviesPopularListComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }

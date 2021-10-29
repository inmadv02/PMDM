import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { HttpClient, HttpClientModule } from '@angular/common/http';
import { AppComponent } from './app.component';
import { MovieItemComponent } from './movie-item/movie-item.component';
import { MoviesPopularListComponent } from './movies-popular-list/movies-popular-list.component';
<<<<<<< HEAD:popcorn/src/app/app.module.ts
import { MovieItemComponent } from './movie-item/movie-item.component';
=======
>>>>>>> master:popcorn1/src/app/app.module.ts
import { MaterialImportsModule } from './material-imports.module';
import { HttpClientModule } from '@angular/common/http';
import { AppRoutingModule } from './app-routing.module';
import { PersonItemComponent } from './person-item/person-item.component';
import { PopularPeopleComponent } from './popular-people-list/popular-people-list.component';
import { DialogMovieDetailComponent } from './dialogs/dialog-movie-detail/dialog-movie-detail.component';
import { SideNavbarComponent } from './side-navbar/side-navbar.component';
@NgModule({
  declarations: [
    AppComponent,
<<<<<<< HEAD:popcorn/src/app/app.module.ts
    MoviesPopularListComponent,
    MovieItemComponent,
    PersonItemComponent,
    PopularPeopleComponent,
    DialogMovieDetailComponent,
    SideNavbarComponent
  ],
  imports: [
    BrowserModule,
    BrowserAnimationsModule,
    MaterialImportsModule,
    HttpClientModule, 
    AppRoutingModule
  ],
  entryComponents: [
    DialogMovieDetailComponent
=======
    MovieItemComponent,
    MoviesPopularListComponent
  ],
  imports: [
    BrowserModule,
    HttpClientModule,
    HttpClient,
    MaterialImportsModule
>>>>>>> master:popcorn1/src/app/app.module.ts
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }

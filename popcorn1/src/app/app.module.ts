import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { HttpClient, HttpClientModule } from '@angular/common/http';
import { AppComponent } from './app.component';
import { MovieItemComponent } from './movie-item/movie-item.component';
import { MoviesPopularListComponent } from './movies-popular-list/movies-popular-list.component';
import { MaterialImportsModule } from './material-imports.module';
import { AppRoutingModule } from './app-routing.module';
import { PersonItemComponent } from './person-item/person-item.component';
import { PopularPeopleComponent } from './popular-people-list/popular-people-list.component';
import { DialogMovieDetailComponent } from './dialogs/dialog-movie-detail/dialog-movie-detail.component';
import { SideNavbarComponent } from './side-navbar/side-navbar.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { PersonDetailsComponent } from './person-details/person-details.component';


@NgModule({
  declarations: [
    AppComponent,
    MoviesPopularListComponent,
    MovieItemComponent,
    PersonItemComponent,
    PopularPeopleComponent,
    DialogMovieDetailComponent,
    SideNavbarComponent,
    PersonDetailsComponent
  ],
  imports: [
    BrowserModule,
    MaterialImportsModule,
    HttpClientModule, 
    HttpClient,
    AppRoutingModule,
    BrowserAnimationsModule,
  
  ],
  entryComponents: [
    DialogMovieDetailComponent,
    MovieItemComponent,
    MoviesPopularListComponent
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }

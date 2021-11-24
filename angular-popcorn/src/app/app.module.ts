import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { FlexLayoutModule } from '@angular/flex-layout';
import { HttpClientModule } from '@angular/common/http';
import { MaterialImportsModule } from './modules/material-imports.module';
import { MoviesPopularListComponent } from './components/movies-popular-list/movies-popular-list.component';
import { MovieItemComponent } from './components/movie-item/movie-item.component';
import { NgCircleProgressModule } from 'ng-circle-progress';
import { DialogAddMovieComponent } from './dialogs/dialog-add-movie/dialog-add-movie.component';
import { DialogLoginComponent } from './dialogs/dialog-login/dialog-login.component';
import { SessionComponent } from './shared/session/session.component';
import { ListComponent } from './components/list/list.component';
import { FormsModule } from '@angular/forms';
import { FavoriteListComponent } from './shared/favorite-list/favorite-list.component';
import { NavComponent } from './shared/nav/nav.component';
import { FormGroup, FormControl } from '@angular/forms';
import { ReactiveFormsModule } from '@angular/forms';

@NgModule({
  declarations: [
    AppComponent,
    MoviesPopularListComponent,
    MovieItemComponent,
    DialogAddMovieComponent,
    DialogLoginComponent,
    SessionComponent,
    ListComponent,
    FavoriteListComponent,
    NavComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    BrowserAnimationsModule,
    MaterialImportsModule,
    HttpClientModule,
    FlexLayoutModule, 
    FormsModule,
    ReactiveFormsModule,
    NgCircleProgressModule.forRoot({
      // set defaults here
      radius: 25,
      outerStrokeWidth: 5,
      innerStrokeWidth: 3,
      outerStrokeColor: "#1F6596",
      innerStrokeColor: "#39BBF2",
      animationDuration: 300,
      titleFontSize: '10pt',
      backgroundColor: "#FFF"
    })
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }

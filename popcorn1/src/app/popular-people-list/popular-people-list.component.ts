import { Component, OnInit } from '@angular/core';
import { Person } from '../interfaces/people.interface';
import { MoviesService } from '../services/movies-service';

@Component({
  selector: 'app-popular-people-list',
  templateUrl: './popular-people-list.component.html',
  styleUrls: ['./popular-people-list.component.css']
})
export class PopularPeopleComponent implements OnInit {

  popularPeople: Person[] = [];

  constructor(private moviesService: MoviesService) { }

  ngOnInit(): void {

    this.moviesService.getPopularPeople().subscribe(popularPeopleRespose => 
              {this.popularPeople = popularPeopleRespose.results;
              
        });
  }

}

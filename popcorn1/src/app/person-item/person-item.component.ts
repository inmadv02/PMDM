import { Component, Input, OnInit } from '@angular/core';
import { environment } from 'src/environments/environment';
import { Person } from '../interfaces/people.interface';


@Component({
  selector: 'app-person-item',
  templateUrl: './person-item.component.html',
  styleUrls: ['./person-item.component.css']
})
export class PersonItemComponent implements OnInit {

  @Input() personInput!: Person ;

  constructor() { }

  ngOnInit(): void {
  }
  getPersonImageUrl(person: Person){
    return `${environment.imageUrl}${person.profile_path}`;
  }

}

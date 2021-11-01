import { Component, Input, OnInit } from '@angular/core';
import { environment } from 'src/environments/environment';
import { Person } from '../interfaces/people.interface';
import { ActivatedRoute } from '@angular/router';


@Component({
  selector: 'app-person-item',
  templateUrl: './person-item.component.html',
  styleUrls: ['./person-item.component.css']
})
export class PersonItemComponent implements OnInit {

  @Input() personInput!: Person ;

  constructor(private route: ActivatedRoute) { }

  ngOnInit(): void {

    let id = this.route.snapshot.paramMap.get('person_id');
  }

  getPersonImageUrl(person: Person){
    return `${environment.imageUrl}${person.profile_path}`;
  }

}

import { Component, Input, OnInit } from '@angular/core';
import { List } from 'src/app/models/interfaces/list.interface';

@Component({
  selector: 'app-list',
  templateUrl: './list.component.html',
  styleUrls: ['./list.component.css']
})
export class ListComponent implements OnInit {
  @Input() listInput!: List;

  constructor() { }

  ngOnInit(): void {
  }

}

import { ComponentFixture, TestBed } from '@angular/core/testing';

import { MoviesPopularListComponent } from './movies-popular-list.component';

describe('MoviesPopularListComponent', () => {
  let component: MoviesPopularListComponent;
  let fixture: ComponentFixture<MoviesPopularListComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ MoviesPopularListComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(MoviesPopularListComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

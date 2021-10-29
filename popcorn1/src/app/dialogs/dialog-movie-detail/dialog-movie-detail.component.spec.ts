import { ComponentFixture, TestBed } from '@angular/core/testing';

import { DialogMovieDetailComponent } from './dialog-movie-detail.component';

describe('DialogMovieDetailComponent', () => {
  let component: DialogMovieDetailComponent;
  let fixture: ComponentFixture<DialogMovieDetailComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ DialogMovieDetailComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(DialogMovieDetailComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

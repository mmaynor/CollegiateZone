import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ViewStickyNoteComponent } from './view-sticky-note.component';

describe('ViewStickyNoteComponent', () => {
  let component: ViewStickyNoteComponent;
  let fixture: ComponentFixture<ViewStickyNoteComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ViewStickyNoteComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ViewStickyNoteComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

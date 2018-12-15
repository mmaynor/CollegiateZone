import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { AddStickyNoteComponent } from './add-sticky-note.component';

describe('AddStickyNoteComponent', () => {
  let component: AddStickyNoteComponent;
  let fixture: ComponentFixture<AddStickyNoteComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ AddStickyNoteComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(AddStickyNoteComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

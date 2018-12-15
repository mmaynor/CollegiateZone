import { Component, OnInit } from '@angular/core';
import { StickyNote } from '../model/StickyNote'
import { NoteKeeperServiceService } from '../note-keeper-service.service'

@Component({
  selector: 'app-add-sticky-note',
  templateUrl: './add-sticky-note.component.html',
  styleUrls: ['./add-sticky-note.component.css']
})
export class AddStickyNoteComponent implements OnInit {
  stickynote: StickyNote = new StickyNote();
  constructor(private service: NoteKeeperServiceService) { }

  ngOnInit() {
  }
  addStickyNote():void {
    console.log('add ts')
    this.service.addStickyNote(this.stickynote).subscribe(data => {
      alert("Sticky Note Added Successfully");
    });
  }
}
import { Component, OnInit, Input } from '@angular/core';
import {HttpClient} from '@angular/common/http';
import { StickyNote } from '../model/StickyNote';
import { NoteKeeperServiceService } from '../note-keeper-service.service';

@Component({
  selector: 'app-view-sticky-note',
  templateUrl: './view-sticky-note.component.html',
  styleUrls: ['./view-sticky-note.component.css']
})
export class ViewStickyNoteComponent implements OnInit {

  response:any;
  status=false;

@Input('Note') stickynote:any;
  constructor(private service: NoteKeeperServiceService) { }

  ngOnInit() {
    console.log("inside child")
    console.log(this.stickynote)
  }
     updateStickyNote():void {
    this.service.updateStickyNote(this.stickynote).subscribe(data => {
      alert("Sticky Note Updated Successfully");
    });
  }
    show(){
      this.status=true;    
    }
    removeStickyNote() {
      console.log(this.stickynote);
      this.service.removeStickyNote(this.stickynote).subscribe(data => {
        alert("Sticky Note Removed Successfully");
      })
    }
  }
  
import { Component, OnInit } from '@angular/core';
import { NoteKeeperServiceService } from './note-keeper-service.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent implements OnInit {
  title = 'NoteKeeper';
  notes:any[]=[];
  constructor(private api:NoteKeeperServiceService){

  }
  ngOnInit(){
    this.api.getStickyNote().subscribe(res=>{
      this.notes=res;
      console.log(res);
    });
  }
  
}

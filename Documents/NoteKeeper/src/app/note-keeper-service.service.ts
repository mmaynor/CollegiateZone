import { Injectable } from '@angular/core';
import {HttpClient, HttpHeaders} from '@angular/common/http';
import { StickyNote } from './model/StickyNote'

const httpOptions = { headers: new HttpHeaders(
  {
    'Content-Type' : 'aaplication/json'
  }
)};

@Injectable({
  providedIn: 'root'
})
export class NoteKeeperServiceService {
  constructor(private http: HttpClient) { }

  private stickynoteurl = 'http://localhost:50000/NoteDataFetch/rest/stickynote/getList';

  public getStickyNote() {
    return this.http.get<StickyNote[]>(this.stickynoteurl);
  }
  public removeStickyNote(StickyNote) {
    return this.http.delete<StickyNote>('http://localhost:50000/NoteDataFetch/rest/stickynote/remove/'+ StickyNote.noteId);
  }
  public addStickyNote(StickyNote) {
    return this.http.post<StickyNote>('http://localhost:50000/NoteDataFetch/rest/stickynote/add', StickyNote);
  }
  public updateStickyNote(StickyNote) {
    return this.http.post<StickyNote>('http://localhost:50000/NoteDataFetch/rest/stickynote/update', StickyNote);
  }
}

import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import {HttpClientModule} from '@angular/common/http';
import { FormsModule} from '@angular/forms';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { AddStickyNoteComponent } from './add-sticky-note/add-sticky-note.component';
import { ViewStickyNoteComponent } from './view-sticky-note/view-sticky-note.component';

@NgModule({
  declarations: [
    AppComponent,
    AddStickyNoteComponent,
    ViewStickyNoteComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    FormsModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }

package com.note.resources;

import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import com.note.dao.StickyNoteDao;
import com.note.dao.StickyNoteDaoImpl;
import com.note.model.StickyNote;

@Path("/stickynote")
public class StickyNoteResources {
	StickyNoteDao sdao;
	
	public StickyNoteResources() {
		this.sdao = new StickyNoteDaoImpl();
	}
	@GET
	@Path("/getList")
	@Produces(MediaType.APPLICATION_JSON)																													
	public List<StickyNote> getAllStickyNoteDetails() {
		return sdao.getStickyNoteDetails();
	}
//	@GET
//	@Path("/get/{noteId}")
//	@Produces(MediaType.APPLICATION_JSON)
//	public StickyNote getStickyNoteID(@PathParam("noteId") int noteId) {
//		return sdao.getStickyNoteID(noteId);
//	}
	@POST
	@Path("/add")
	@Produces(MediaType.APPLICATION_JSON)
	public String addStickyNote(StickyNote stickyNote) {
		sdao.insertStickyNote(stickyNote);
		return "success";
	}
	@DELETE
	@Path("/remove/{noteid}")
	@Produces(MediaType.APPLICATION_JSON)
	public void removeStickyNote(@PathParam("noteid") int noteId) {
		sdao.removeStickyNote(noteId);
	}
	
	@POST
	@Path("/update")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public StickyNote updateStickyNote( StickyNote stickynote) {
		
		System.out.println(stickynote.toString());
			sdao.updateStickyNote(stickynote);
		
		return stickynote;
	}
}
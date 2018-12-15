import { TestBed } from '@angular/core/testing';

import { NoteKeeperServiceService } from './note-keeper-service.service';

describe('NoteKeeperServiceService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: NoteKeeperServiceService = TestBed.get(NoteKeeperServiceService);
    expect(service).toBeTruthy();
  });
});

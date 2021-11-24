import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { AuthService } from 'src/app/services/auth.service';

@Component({
  selector: 'app-session',
  templateUrl: './session.component.html',
  styleUrls: ['./session.component.css']
})
export class SessionComponent implements OnInit {

  constructor(private authService: AuthService,
    private router: Router) { }

  ngOnInit(): void {
    this.authService.getSessionId().subscribe(result => {
      this.authService.setLocalSessionId(result.session_id);
      this.router.navigate(['/movies']);
    });
  }



}

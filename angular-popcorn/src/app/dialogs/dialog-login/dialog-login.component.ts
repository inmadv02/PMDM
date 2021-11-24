import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { AuthService } from 'src/app/services/auth.service';

@Component({
  selector: 'app-dialog-login',
  templateUrl: './dialog-login.component.html',
  styleUrls: ['./dialog-login.component.css']
})
export class DialogLoginComponent implements OnInit {

  constructor(private router : Router, private auth : AuthService) { }

  ngOnInit(): void {
  }

  login() {
    this.auth.getRequestToken().subscribe(result => { this.auth.setLocalRequestToken(result.request_token);
      window.open(`https://www.themoviedb.org/authenticate/${result.request_token}?redirect_to=http://localhost:4200/loginsuccess`,"_self");
    
    })
  }

}

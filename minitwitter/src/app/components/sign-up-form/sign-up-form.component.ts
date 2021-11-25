import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup } from '@angular/forms';
import { SignUpDto } from 'src/app/models/dto/SignUpDto.dto';
import { AuthService } from 'src/app/services/auth.service';

@Component({
  selector: 'app-sign-up-form',
  templateUrl: './sign-up-form.component.html',
  styleUrls: ['./sign-up-form.component.css']
})
export class SignUpFormComponent implements OnInit {

  dto = new SignUpDto ();

  registerForm = new FormGroup ({
    username : new FormControl (' '),
    email : new FormControl (' '),
    password : new FormControl (' ')
  })

  constructor(private service : AuthService) { }

  ngOnInit(): void {

  }

  register() {
    this.service.signUp(this.dto).subscribe(registrado => {

      alert("Te has registrado");
    })
  }


}

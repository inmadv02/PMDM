import { Component, OnInit } from '@angular/core';
import { AuthRegisterDto } from '../interfaces/dto/auth.dto';
import { AuthService } from './services/auth.service';

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.css']
})
export class RegisterComponent implements OnInit {
  registerDto = new AuthRegisterDto();

  constructor(private authService: AuthService) { }

  ngOnInit(): void {
  }

  doRegister() {
    this.authService.register(this.registerDto).subscribe(registerResult => {
      alert(`Te has logueado y tu token es ${registerResult.code}`);
    });
  }

}
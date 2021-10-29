import { Component, OnInit } from '@angular/core';
import { Usuario } from './usuario/usuario';


@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {

  submitted = false;
  model = new Usuario();

  constructor() { }

  ngOnInit(): void {
  }

  enviarDatos (){
      this.submitted = true;
      console.log(this.model.email, this.model.pssw)
  }

}

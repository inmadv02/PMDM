import { Injectable } from '@angular/core';
import { environment } from 'src/environments/environment';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { SignUpDto } from '../models/dto/SignUpDto.dto';


const API_BASE_URL = `${environment.apiBaseUrl}/auth`;

const DEFAULT_HEADERS = {
  headers: new HttpHeaders({
    'Content-Type': 'application/json'
  })
};

@Injectable({
  providedIn: 'root'
})
export class AuthService {

  constructor(private http: HttpClient) { }


  signUp(dto : SignUpDto) Observable<SignUpResponse> {
    
  }
}
